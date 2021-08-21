import 'package:moor/moor.dart';

@DataClassName("Counter")
class Counters extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId =>
      integer().nullable().customConstraint('REFERENCES groups(id)')();
  TextColumn get title => text().withLength(max: 64)();
  RealColumn get value => real().withDefault(const Constant(0))();
  RealColumn get goal => real().withDefault(const Constant(0)).nullable()();
  RealColumn get increment =>
      real().withDefault(const Constant(1)).nullable()();
}
