import 'package:moor/moor.dart';

@DataClassName("Group")
class Groups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 64)();
}
