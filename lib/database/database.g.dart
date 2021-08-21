// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Group extends DataClass implements Insertable<Group> {
  final int id;
  final String name;
  Group({@required this.id, @required this.name});
  factory Group.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Group(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Group copyWith({int id, String name}) => Group(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Group && other.id == this.id && other.name == this.name);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<int> id;
  final Value<String> name;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GroupsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<Group> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GroupsCompanion copyWith({Value<int> id, Value<String> name}) {
    return GroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  final GeneratedDatabase _db;
  final String _alias;
  $GroupsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 64);
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $GroupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'groups';
  @override
  final String actualTableName = 'groups';
  @override
  VerificationContext validateIntegrity(Insertable<Group> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Group.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(_db, alias);
  }
}

class Counter extends DataClass implements Insertable<Counter> {
  final int id;
  final int groupId;
  final String title;
  final double value;
  final double goal;
  final double increment;
  Counter(
      {@required this.id,
      this.groupId,
      @required this.title,
      @required this.value,
      this.goal,
      this.increment});
  factory Counter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Counter(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      groupId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}group_id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      value:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      goal: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}goal']),
      increment: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}increment']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<double>(value);
    }
    if (!nullToAbsent || goal != null) {
      map['goal'] = Variable<double>(goal);
    }
    if (!nullToAbsent || increment != null) {
      map['increment'] = Variable<double>(increment);
    }
    return map;
  }

  CountersCompanion toCompanion(bool nullToAbsent) {
    return CountersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      goal: goal == null && nullToAbsent ? const Value.absent() : Value(goal),
      increment: increment == null && nullToAbsent
          ? const Value.absent()
          : Value(increment),
    );
  }

  factory Counter.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Counter(
      id: serializer.fromJson<int>(json['id']),
      groupId: serializer.fromJson<int>(json['groupId']),
      title: serializer.fromJson<String>(json['title']),
      value: serializer.fromJson<double>(json['value']),
      goal: serializer.fromJson<double>(json['goal']),
      increment: serializer.fromJson<double>(json['increment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupId': serializer.toJson<int>(groupId),
      'title': serializer.toJson<String>(title),
      'value': serializer.toJson<double>(value),
      'goal': serializer.toJson<double>(goal),
      'increment': serializer.toJson<double>(increment),
    };
  }

  Counter copyWith(
          {int id,
          int groupId,
          String title,
          double value,
          double goal,
          double increment}) =>
      Counter(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        title: title ?? this.title,
        value: value ?? this.value,
        goal: goal ?? this.goal,
        increment: increment ?? this.increment,
      );
  @override
  String toString() {
    return (StringBuffer('Counter(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('title: $title, ')
          ..write('value: $value, ')
          ..write('goal: $goal, ')
          ..write('increment: $increment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          groupId.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  value.hashCode, $mrjc(goal.hashCode, increment.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Counter &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.title == this.title &&
          other.value == this.value &&
          other.goal == this.goal &&
          other.increment == this.increment);
}

class CountersCompanion extends UpdateCompanion<Counter> {
  final Value<int> id;
  final Value<int> groupId;
  final Value<String> title;
  final Value<double> value;
  final Value<double> goal;
  final Value<double> increment;
  const CountersCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.title = const Value.absent(),
    this.value = const Value.absent(),
    this.goal = const Value.absent(),
    this.increment = const Value.absent(),
  });
  CountersCompanion.insert({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    @required String title,
    this.value = const Value.absent(),
    this.goal = const Value.absent(),
    this.increment = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Counter> custom({
    Expression<int> id,
    Expression<int> groupId,
    Expression<String> title,
    Expression<double> value,
    Expression<double> goal,
    Expression<double> increment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (title != null) 'title': title,
      if (value != null) 'value': value,
      if (goal != null) 'goal': goal,
      if (increment != null) 'increment': increment,
    });
  }

  CountersCompanion copyWith(
      {Value<int> id,
      Value<int> groupId,
      Value<String> title,
      Value<double> value,
      Value<double> goal,
      Value<double> increment}) {
    return CountersCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      title: title ?? this.title,
      value: value ?? this.value,
      goal: goal ?? this.goal,
      increment: increment ?? this.increment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (goal.present) {
      map['goal'] = Variable<double>(goal.value);
    }
    if (increment.present) {
      map['increment'] = Variable<double>(increment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountersCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('title: $title, ')
          ..write('value: $value, ')
          ..write('goal: $goal, ')
          ..write('increment: $increment')
          ..write(')'))
        .toString();
  }
}

class $CountersTable extends Counters with TableInfo<$CountersTable, Counter> {
  final GeneratedDatabase _db;
  final String _alias;
  $CountersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedIntColumn _groupId;
  @override
  GeneratedIntColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedIntColumn _constructGroupId() {
    return GeneratedIntColumn('group_id', $tableName, true,
        $customConstraints: 'REFERENCES groups(id)');
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, maxTextLength: 64);
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedRealColumn _value;
  @override
  GeneratedRealColumn get value => _value ??= _constructValue();
  GeneratedRealColumn _constructValue() {
    return GeneratedRealColumn('value', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _goalMeta = const VerificationMeta('goal');
  GeneratedRealColumn _goal;
  @override
  GeneratedRealColumn get goal => _goal ??= _constructGoal();
  GeneratedRealColumn _constructGoal() {
    return GeneratedRealColumn('goal', $tableName, true,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _incrementMeta = const VerificationMeta('increment');
  GeneratedRealColumn _increment;
  @override
  GeneratedRealColumn get increment => _increment ??= _constructIncrement();
  GeneratedRealColumn _constructIncrement() {
    return GeneratedRealColumn('increment', $tableName, true,
        defaultValue: const Constant(1));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, groupId, title, value, goal, increment];
  @override
  $CountersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'counters';
  @override
  final String actualTableName = 'counters';
  @override
  VerificationContext validateIntegrity(Insertable<Counter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id'], _groupIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    if (data.containsKey('goal')) {
      context.handle(
          _goalMeta, goal.isAcceptableOrUnknown(data['goal'], _goalMeta));
    }
    if (data.containsKey('increment')) {
      context.handle(_incrementMeta,
          increment.isAcceptableOrUnknown(data['increment'], _incrementMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Counter map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Counter.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CountersTable createAlias(String alias) {
    return $CountersTable(_db, alias);
  }
}

class Stat extends DataClass implements Insertable<Stat> {
  final int id;
  final int counterId;
  final int date;
  final double value;
  Stat(
      {@required this.id,
      this.counterId,
      @required this.date,
      @required this.value});
  factory Stat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Stat(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      counterId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}counter_id']),
      date: intType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      value:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || counterId != null) {
      map['counter_id'] = Variable<int>(counterId);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<int>(date);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<double>(value);
    }
    return map;
  }

  StatsCompanion toCompanion(bool nullToAbsent) {
    return StatsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      counterId: counterId == null && nullToAbsent
          ? const Value.absent()
          : Value(counterId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Stat(
      id: serializer.fromJson<int>(json['id']),
      counterId: serializer.fromJson<int>(json['counterId']),
      date: serializer.fromJson<int>(json['date']),
      value: serializer.fromJson<double>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'counterId': serializer.toJson<int>(counterId),
      'date': serializer.toJson<int>(date),
      'value': serializer.toJson<double>(value),
    };
  }

  Stat copyWith({int id, int counterId, int date, double value}) => Stat(
        id: id ?? this.id,
        counterId: counterId ?? this.counterId,
        date: date ?? this.date,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('Stat(')
          ..write('id: $id, ')
          ..write('counterId: $counterId, ')
          ..write('date: $date, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(counterId.hashCode, $mrjc(date.hashCode, value.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Stat &&
          other.id == this.id &&
          other.counterId == this.counterId &&
          other.date == this.date &&
          other.value == this.value);
}

class StatsCompanion extends UpdateCompanion<Stat> {
  final Value<int> id;
  final Value<int> counterId;
  final Value<int> date;
  final Value<double> value;
  const StatsCompanion({
    this.id = const Value.absent(),
    this.counterId = const Value.absent(),
    this.date = const Value.absent(),
    this.value = const Value.absent(),
  });
  StatsCompanion.insert({
    this.id = const Value.absent(),
    this.counterId = const Value.absent(),
    @required int date,
    @required double value,
  })  : date = Value(date),
        value = Value(value);
  static Insertable<Stat> custom({
    Expression<int> id,
    Expression<int> counterId,
    Expression<int> date,
    Expression<double> value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (counterId != null) 'counter_id': counterId,
      if (date != null) 'date': date,
      if (value != null) 'value': value,
    });
  }

  StatsCompanion copyWith(
      {Value<int> id,
      Value<int> counterId,
      Value<int> date,
      Value<double> value}) {
    return StatsCompanion(
      id: id ?? this.id,
      counterId: counterId ?? this.counterId,
      date: date ?? this.date,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (counterId.present) {
      map['counter_id'] = Variable<int>(counterId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsCompanion(')
          ..write('id: $id, ')
          ..write('counterId: $counterId, ')
          ..write('date: $date, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $StatsTable extends Stats with TableInfo<$StatsTable, Stat> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _counterIdMeta = const VerificationMeta('counterId');
  GeneratedIntColumn _counterId;
  @override
  GeneratedIntColumn get counterId => _counterId ??= _constructCounterId();
  GeneratedIntColumn _constructCounterId() {
    return GeneratedIntColumn('counter_id', $tableName, true,
        $customConstraints: 'REFERENCES groups(id)');
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedIntColumn _date;
  @override
  GeneratedIntColumn get date => _date ??= _constructDate();
  GeneratedIntColumn _constructDate() {
    return GeneratedIntColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedRealColumn _value;
  @override
  GeneratedRealColumn get value => _value ??= _constructValue();
  GeneratedRealColumn _constructValue() {
    return GeneratedRealColumn(
      'value',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, counterId, date, value];
  @override
  $StatsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'stats';
  @override
  final String actualTableName = 'stats';
  @override
  VerificationContext validateIntegrity(Insertable<Stat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('counter_id')) {
      context.handle(_counterIdMeta,
          counterId.isAcceptableOrUnknown(data['counter_id'], _counterIdMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stat map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Stat.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatsTable createAlias(String alias) {
    return $StatsTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $GroupsTable _groups;
  $GroupsTable get groups => _groups ??= $GroupsTable(this);
  $CountersTable _counters;
  $CountersTable get counters => _counters ??= $CountersTable(this);
  $StatsTable _stats;
  $StatsTable get stats => _stats ??= $StatsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [groups, counters, stats];
}
