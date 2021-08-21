import 'dart:io';

import 'package:counter/database/tables/counters.dart';
import 'package:counter/database/tables/groups.dart';
import 'package:counter/database/tables/stats.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as path;
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@UseMoor(tables: [Groups, Counters, Stats])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<List<Counter>> getAllCounters() => select(counters).get();
  Future<int> insertCounter(CountersCompanion counter) =>
      into(counters).insert(counter);
  Future updateCounter(Counter counter) => update(counters).replace(counter);

  Future insertGroup(GroupsCompanion group) => into(groups).insert(group);

  Future insertStat(StatsCompanion stat) => into(stats).insert(stat);

  Future updateStat(Stat stat) => update(stats).replace(stat);

  Future<List<Stat>> getCounterStats(int counterId) {
    var query = select(stats)..where((tbl) => tbl._counterId.equals(counterId));
    return query.get();
  }

  Future<Stat> getCounterStat(int counterId, int date) {
    var query = select(stats)
      ..where((tbl) => tbl._counterId.equals(counterId))
      ..where((tbl) => tbl._date.equals(date));

    return query.get().then((result) {
      if (result.isEmpty) {
        return null;
      }

      return result[0];
    });
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
