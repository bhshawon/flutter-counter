import 'package:moor/moor.dart';

@DataClassName("Stat")
class Stats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get counterId =>
      integer().nullable().customConstraint('REFERENCES groups(id)')();
  IntColumn get date => integer()();
  RealColumn get value => real()();
}
