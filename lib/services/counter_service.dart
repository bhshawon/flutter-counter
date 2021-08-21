import 'package:counter/database/database.dart';
import 'package:counter/models/counter.dart' as CounterModel;
import 'package:counter/models/stat.dart' as StatModel;
import 'package:counter/utils/date_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moor/moor.dart';

@lazySingleton
class CounterService {
  final Database database = GetIt.instance.get<Database>();
  Future<List<CounterModel.Counter>> listCounters() async {
    var counterEntities = await database.getAllCounters();

    return counterEntities
        .map((entity) => new CounterModel.Counter(
            title: entity.title,
            value: entity.value,
            goal: entity.goal,
            id: entity.id))
        .toList();
  }

  Future addCounter(CounterModel.Counter counter) async {
    var counterEntity = CountersCompanion.insert(
        title: counter.title,
        value: Value(counter.value),
        goal: Value(counter.goal));

    var counterId = await database.insertCounter(counterEntity);

    var currentDate = DateUtils.getUnixTimeStampFromCurrentDate();
    var stat = await database.getCounterStat(counterId, currentDate);

    if (stat == null) {
      var statsEntity = StatsCompanion.insert(
          counterId: Value(counterId),
          date: DateUtils.getUnixTimeStampFromCurrentDate(),
          value: counter.value);

      await database.insertStat(statsEntity);
    } else {
      stat = Stat(date: stat.date, value: counter.value, id: stat.id);
      await database.updateStat(stat);
    }
  }

  Future updateCounter(CounterModel.Counter counter) async {
    var counterEntity = Counter(
        id: counter.id,
        title: counter.title,
        value: counter.value,
        goal: counter.goal);

    await database.updateCounter(counterEntity);

    var stat = await database.getCounterStat(
        counter.id, DateUtils.getUnixTimeStampFromCurrentDate());

    if (stat != null) {
      stat = Stat(
          id: stat.id,
          value: counter.value,
          counterId: stat.counterId,
          date: stat.date);
      await database.updateStat(stat);
    } else {
      var statsEntity = StatsCompanion.insert(
          counterId: Value(counter.id),
          date: DateUtils.getUnixTimeStampFromCurrentDate(),
          value: counter.value);

      await database.insertStat(statsEntity);
    }
  }

  Future<List<StatModel.Stat>> getCounterStats(int counterId) async {
    var statEntities = await database.getCounterStats(counterId);
    return statEntities
        .map((entity) => new StatModel.Stat(
            counterId: entity.counterId,
            value: entity.value,
            date: entity.date,
            id: entity.id))
        .toList();
  }
}
