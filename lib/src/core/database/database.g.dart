// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LegalCasesTable extends LegalCases
    with TableInfo<$LegalCasesTable, LegalCase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LegalCasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _caseNumberMeta = const VerificationMeta(
    'caseNumber',
  );
  @override
  late final GeneratedColumn<String> caseNumber = GeneratedColumn<String>(
    'case_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caseTypeMeta = const VerificationMeta(
    'caseType',
  );
  @override
  late final GeneratedColumn<String> caseType = GeneratedColumn<String>(
    'case_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courtMeta = const VerificationMeta('court');
  @override
  late final GeneratedColumn<String> court = GeneratedColumn<String>(
    'court',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jurisdictionMeta = const VerificationMeta(
    'jurisdiction',
  );
  @override
  late final GeneratedColumn<String> jurisdiction = GeneratedColumn<String>(
    'jurisdiction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedEndDateMeta = const VerificationMeta(
    'expectedEndDate',
  );
  @override
  late final GeneratedColumn<DateTime> expectedEndDate =
      GeneratedColumn<DateTime>(
        'expected_end_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    caseNumber,
    caseType,
    area,
    court,
    jurisdiction,
    status,
    priority,
    startDate,
    expectedEndDate,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'legal_cases';
  @override
  VerificationContext validateIntegrity(
    Insertable<LegalCase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('case_number')) {
      context.handle(
        _caseNumberMeta,
        caseNumber.isAcceptableOrUnknown(data['case_number']!, _caseNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_caseNumberMeta);
    }
    if (data.containsKey('case_type')) {
      context.handle(
        _caseTypeMeta,
        caseType.isAcceptableOrUnknown(data['case_type']!, _caseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_caseTypeMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('court')) {
      context.handle(
        _courtMeta,
        court.isAcceptableOrUnknown(data['court']!, _courtMeta),
      );
    } else if (isInserting) {
      context.missing(_courtMeta);
    }
    if (data.containsKey('jurisdiction')) {
      context.handle(
        _jurisdictionMeta,
        jurisdiction.isAcceptableOrUnknown(
          data['jurisdiction']!,
          _jurisdictionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jurisdictionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('expected_end_date')) {
      context.handle(
        _expectedEndDateMeta,
        expectedEndDate.isAcceptableOrUnknown(
          data['expected_end_date']!,
          _expectedEndDateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LegalCase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LegalCase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      caseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_number'],
      )!,
      caseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}case_type'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      )!,
      court: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}court'],
      )!,
      jurisdiction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jurisdiction'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      expectedEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expected_end_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LegalCasesTable createAlias(String alias) {
    return $LegalCasesTable(attachedDatabase, alias);
  }
}

class LegalCase extends DataClass implements Insertable<LegalCase> {
  final int id;
  final String caseNumber;
  final String caseType;
  final String area;
  final String court;
  final String jurisdiction;
  final String status;
  final String priority;
  final DateTime startDate;
  final DateTime? expectedEndDate;
  final DateTime createdAt;
  const LegalCase({
    required this.id,
    required this.caseNumber,
    required this.caseType,
    required this.area,
    required this.court,
    required this.jurisdiction,
    required this.status,
    required this.priority,
    required this.startDate,
    this.expectedEndDate,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['case_number'] = Variable<String>(caseNumber);
    map['case_type'] = Variable<String>(caseType);
    map['area'] = Variable<String>(area);
    map['court'] = Variable<String>(court);
    map['jurisdiction'] = Variable<String>(jurisdiction);
    map['status'] = Variable<String>(status);
    map['priority'] = Variable<String>(priority);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || expectedEndDate != null) {
      map['expected_end_date'] = Variable<DateTime>(expectedEndDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LegalCasesCompanion toCompanion(bool nullToAbsent) {
    return LegalCasesCompanion(
      id: Value(id),
      caseNumber: Value(caseNumber),
      caseType: Value(caseType),
      area: Value(area),
      court: Value(court),
      jurisdiction: Value(jurisdiction),
      status: Value(status),
      priority: Value(priority),
      startDate: Value(startDate),
      expectedEndDate: expectedEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedEndDate),
      createdAt: Value(createdAt),
    );
  }

  factory LegalCase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LegalCase(
      id: serializer.fromJson<int>(json['id']),
      caseNumber: serializer.fromJson<String>(json['caseNumber']),
      caseType: serializer.fromJson<String>(json['caseType']),
      area: serializer.fromJson<String>(json['area']),
      court: serializer.fromJson<String>(json['court']),
      jurisdiction: serializer.fromJson<String>(json['jurisdiction']),
      status: serializer.fromJson<String>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      expectedEndDate: serializer.fromJson<DateTime?>(json['expectedEndDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'caseNumber': serializer.toJson<String>(caseNumber),
      'caseType': serializer.toJson<String>(caseType),
      'area': serializer.toJson<String>(area),
      'court': serializer.toJson<String>(court),
      'jurisdiction': serializer.toJson<String>(jurisdiction),
      'status': serializer.toJson<String>(status),
      'priority': serializer.toJson<String>(priority),
      'startDate': serializer.toJson<DateTime>(startDate),
      'expectedEndDate': serializer.toJson<DateTime?>(expectedEndDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LegalCase copyWith({
    int? id,
    String? caseNumber,
    String? caseType,
    String? area,
    String? court,
    String? jurisdiction,
    String? status,
    String? priority,
    DateTime? startDate,
    Value<DateTime?> expectedEndDate = const Value.absent(),
    DateTime? createdAt,
  }) => LegalCase(
    id: id ?? this.id,
    caseNumber: caseNumber ?? this.caseNumber,
    caseType: caseType ?? this.caseType,
    area: area ?? this.area,
    court: court ?? this.court,
    jurisdiction: jurisdiction ?? this.jurisdiction,
    status: status ?? this.status,
    priority: priority ?? this.priority,
    startDate: startDate ?? this.startDate,
    expectedEndDate: expectedEndDate.present
        ? expectedEndDate.value
        : this.expectedEndDate,
    createdAt: createdAt ?? this.createdAt,
  );
  LegalCase copyWithCompanion(LegalCasesCompanion data) {
    return LegalCase(
      id: data.id.present ? data.id.value : this.id,
      caseNumber: data.caseNumber.present
          ? data.caseNumber.value
          : this.caseNumber,
      caseType: data.caseType.present ? data.caseType.value : this.caseType,
      area: data.area.present ? data.area.value : this.area,
      court: data.court.present ? data.court.value : this.court,
      jurisdiction: data.jurisdiction.present
          ? data.jurisdiction.value
          : this.jurisdiction,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      expectedEndDate: data.expectedEndDate.present
          ? data.expectedEndDate.value
          : this.expectedEndDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LegalCase(')
          ..write('id: $id, ')
          ..write('caseNumber: $caseNumber, ')
          ..write('caseType: $caseType, ')
          ..write('area: $area, ')
          ..write('court: $court, ')
          ..write('jurisdiction: $jurisdiction, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('startDate: $startDate, ')
          ..write('expectedEndDate: $expectedEndDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    caseNumber,
    caseType,
    area,
    court,
    jurisdiction,
    status,
    priority,
    startDate,
    expectedEndDate,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LegalCase &&
          other.id == this.id &&
          other.caseNumber == this.caseNumber &&
          other.caseType == this.caseType &&
          other.area == this.area &&
          other.court == this.court &&
          other.jurisdiction == this.jurisdiction &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.startDate == this.startDate &&
          other.expectedEndDate == this.expectedEndDate &&
          other.createdAt == this.createdAt);
}

class LegalCasesCompanion extends UpdateCompanion<LegalCase> {
  final Value<int> id;
  final Value<String> caseNumber;
  final Value<String> caseType;
  final Value<String> area;
  final Value<String> court;
  final Value<String> jurisdiction;
  final Value<String> status;
  final Value<String> priority;
  final Value<DateTime> startDate;
  final Value<DateTime?> expectedEndDate;
  final Value<DateTime> createdAt;
  const LegalCasesCompanion({
    this.id = const Value.absent(),
    this.caseNumber = const Value.absent(),
    this.caseType = const Value.absent(),
    this.area = const Value.absent(),
    this.court = const Value.absent(),
    this.jurisdiction = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.startDate = const Value.absent(),
    this.expectedEndDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LegalCasesCompanion.insert({
    this.id = const Value.absent(),
    required String caseNumber,
    required String caseType,
    required String area,
    required String court,
    required String jurisdiction,
    required String status,
    required String priority,
    required DateTime startDate,
    this.expectedEndDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : caseNumber = Value(caseNumber),
       caseType = Value(caseType),
       area = Value(area),
       court = Value(court),
       jurisdiction = Value(jurisdiction),
       status = Value(status),
       priority = Value(priority),
       startDate = Value(startDate);
  static Insertable<LegalCase> custom({
    Expression<int>? id,
    Expression<String>? caseNumber,
    Expression<String>? caseType,
    Expression<String>? area,
    Expression<String>? court,
    Expression<String>? jurisdiction,
    Expression<String>? status,
    Expression<String>? priority,
    Expression<DateTime>? startDate,
    Expression<DateTime>? expectedEndDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (caseNumber != null) 'case_number': caseNumber,
      if (caseType != null) 'case_type': caseType,
      if (area != null) 'area': area,
      if (court != null) 'court': court,
      if (jurisdiction != null) 'jurisdiction': jurisdiction,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (startDate != null) 'start_date': startDate,
      if (expectedEndDate != null) 'expected_end_date': expectedEndDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LegalCasesCompanion copyWith({
    Value<int>? id,
    Value<String>? caseNumber,
    Value<String>? caseType,
    Value<String>? area,
    Value<String>? court,
    Value<String>? jurisdiction,
    Value<String>? status,
    Value<String>? priority,
    Value<DateTime>? startDate,
    Value<DateTime?>? expectedEndDate,
    Value<DateTime>? createdAt,
  }) {
    return LegalCasesCompanion(
      id: id ?? this.id,
      caseNumber: caseNumber ?? this.caseNumber,
      caseType: caseType ?? this.caseType,
      area: area ?? this.area,
      court: court ?? this.court,
      jurisdiction: jurisdiction ?? this.jurisdiction,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      startDate: startDate ?? this.startDate,
      expectedEndDate: expectedEndDate ?? this.expectedEndDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (caseNumber.present) {
      map['case_number'] = Variable<String>(caseNumber.value);
    }
    if (caseType.present) {
      map['case_type'] = Variable<String>(caseType.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (court.present) {
      map['court'] = Variable<String>(court.value);
    }
    if (jurisdiction.present) {
      map['jurisdiction'] = Variable<String>(jurisdiction.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (expectedEndDate.present) {
      map['expected_end_date'] = Variable<DateTime>(expectedEndDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LegalCasesCompanion(')
          ..write('id: $id, ')
          ..write('caseNumber: $caseNumber, ')
          ..write('caseType: $caseType, ')
          ..write('area: $area, ')
          ..write('court: $court, ')
          ..write('jurisdiction: $jurisdiction, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('startDate: $startDate, ')
          ..write('expectedEndDate: $expectedEndDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MainPartiesTable extends MainParties
    with TableInfo<$MainPartiesTable, MainParty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MainPartiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _legalCaseIdMeta = const VerificationMeta(
    'legalCaseId',
  );
  @override
  late final GeneratedColumn<int> legalCaseId = GeneratedColumn<int>(
    'legal_case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES legal_cases (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxIdMeta = const VerificationMeta('taxId');
  @override
  late final GeneratedColumn<String> taxId = GeneratedColumn<String>(
    'tax_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, legalCaseId, name, role, taxId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'main_parties';
  @override
  VerificationContext validateIntegrity(
    Insertable<MainParty> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('legal_case_id')) {
      context.handle(
        _legalCaseIdMeta,
        legalCaseId.isAcceptableOrUnknown(
          data['legal_case_id']!,
          _legalCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_legalCaseIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('tax_id')) {
      context.handle(
        _taxIdMeta,
        taxId.isAcceptableOrUnknown(data['tax_id']!, _taxIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MainParty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MainParty(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      legalCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}legal_case_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      taxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_id'],
      ),
    );
  }

  @override
  $MainPartiesTable createAlias(String alias) {
    return $MainPartiesTable(attachedDatabase, alias);
  }
}

class MainParty extends DataClass implements Insertable<MainParty> {
  final int id;
  final int legalCaseId;
  final String name;
  final String role;
  final String? taxId;
  const MainParty({
    required this.id,
    required this.legalCaseId,
    required this.name,
    required this.role,
    this.taxId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['legal_case_id'] = Variable<int>(legalCaseId);
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || taxId != null) {
      map['tax_id'] = Variable<String>(taxId);
    }
    return map;
  }

  MainPartiesCompanion toCompanion(bool nullToAbsent) {
    return MainPartiesCompanion(
      id: Value(id),
      legalCaseId: Value(legalCaseId),
      name: Value(name),
      role: Value(role),
      taxId: taxId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxId),
    );
  }

  factory MainParty.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MainParty(
      id: serializer.fromJson<int>(json['id']),
      legalCaseId: serializer.fromJson<int>(json['legalCaseId']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      taxId: serializer.fromJson<String?>(json['taxId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'legalCaseId': serializer.toJson<int>(legalCaseId),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'taxId': serializer.toJson<String?>(taxId),
    };
  }

  MainParty copyWith({
    int? id,
    int? legalCaseId,
    String? name,
    String? role,
    Value<String?> taxId = const Value.absent(),
  }) => MainParty(
    id: id ?? this.id,
    legalCaseId: legalCaseId ?? this.legalCaseId,
    name: name ?? this.name,
    role: role ?? this.role,
    taxId: taxId.present ? taxId.value : this.taxId,
  );
  MainParty copyWithCompanion(MainPartiesCompanion data) {
    return MainParty(
      id: data.id.present ? data.id.value : this.id,
      legalCaseId: data.legalCaseId.present
          ? data.legalCaseId.value
          : this.legalCaseId,
      name: data.name.present ? data.name.value : this.name,
      role: data.role.present ? data.role.value : this.role,
      taxId: data.taxId.present ? data.taxId.value : this.taxId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MainParty(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('taxId: $taxId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, legalCaseId, name, role, taxId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MainParty &&
          other.id == this.id &&
          other.legalCaseId == this.legalCaseId &&
          other.name == this.name &&
          other.role == this.role &&
          other.taxId == this.taxId);
}

class MainPartiesCompanion extends UpdateCompanion<MainParty> {
  final Value<int> id;
  final Value<int> legalCaseId;
  final Value<String> name;
  final Value<String> role;
  final Value<String?> taxId;
  const MainPartiesCompanion({
    this.id = const Value.absent(),
    this.legalCaseId = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.taxId = const Value.absent(),
  });
  MainPartiesCompanion.insert({
    this.id = const Value.absent(),
    required int legalCaseId,
    required String name,
    required String role,
    this.taxId = const Value.absent(),
  }) : legalCaseId = Value(legalCaseId),
       name = Value(name),
       role = Value(role);
  static Insertable<MainParty> custom({
    Expression<int>? id,
    Expression<int>? legalCaseId,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? taxId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (legalCaseId != null) 'legal_case_id': legalCaseId,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (taxId != null) 'tax_id': taxId,
    });
  }

  MainPartiesCompanion copyWith({
    Value<int>? id,
    Value<int>? legalCaseId,
    Value<String>? name,
    Value<String>? role,
    Value<String?>? taxId,
  }) {
    return MainPartiesCompanion(
      id: id ?? this.id,
      legalCaseId: legalCaseId ?? this.legalCaseId,
      name: name ?? this.name,
      role: role ?? this.role,
      taxId: taxId ?? this.taxId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (legalCaseId.present) {
      map['legal_case_id'] = Variable<int>(legalCaseId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (taxId.present) {
      map['tax_id'] = Variable<String>(taxId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MainPartiesCompanion(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('taxId: $taxId')
          ..write(')'))
        .toString();
  }
}

class $OpposingPartiesTable extends OpposingParties
    with TableInfo<$OpposingPartiesTable, OpposingParty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OpposingPartiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _legalCaseIdMeta = const VerificationMeta(
    'legalCaseId',
  );
  @override
  late final GeneratedColumn<int> legalCaseId = GeneratedColumn<int>(
    'legal_case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES legal_cases (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxIdMeta = const VerificationMeta('taxId');
  @override
  late final GeneratedColumn<String> taxId = GeneratedColumn<String>(
    'tax_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, legalCaseId, name, taxId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'opposing_parties';
  @override
  VerificationContext validateIntegrity(
    Insertable<OpposingParty> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('legal_case_id')) {
      context.handle(
        _legalCaseIdMeta,
        legalCaseId.isAcceptableOrUnknown(
          data['legal_case_id']!,
          _legalCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_legalCaseIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('tax_id')) {
      context.handle(
        _taxIdMeta,
        taxId.isAcceptableOrUnknown(data['tax_id']!, _taxIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OpposingParty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OpposingParty(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      legalCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}legal_case_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      taxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_id'],
      ),
    );
  }

  @override
  $OpposingPartiesTable createAlias(String alias) {
    return $OpposingPartiesTable(attachedDatabase, alias);
  }
}

class OpposingParty extends DataClass implements Insertable<OpposingParty> {
  final int id;
  final int legalCaseId;
  final String name;
  final String? taxId;
  const OpposingParty({
    required this.id,
    required this.legalCaseId,
    required this.name,
    this.taxId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['legal_case_id'] = Variable<int>(legalCaseId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || taxId != null) {
      map['tax_id'] = Variable<String>(taxId);
    }
    return map;
  }

  OpposingPartiesCompanion toCompanion(bool nullToAbsent) {
    return OpposingPartiesCompanion(
      id: Value(id),
      legalCaseId: Value(legalCaseId),
      name: Value(name),
      taxId: taxId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxId),
    );
  }

  factory OpposingParty.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OpposingParty(
      id: serializer.fromJson<int>(json['id']),
      legalCaseId: serializer.fromJson<int>(json['legalCaseId']),
      name: serializer.fromJson<String>(json['name']),
      taxId: serializer.fromJson<String?>(json['taxId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'legalCaseId': serializer.toJson<int>(legalCaseId),
      'name': serializer.toJson<String>(name),
      'taxId': serializer.toJson<String?>(taxId),
    };
  }

  OpposingParty copyWith({
    int? id,
    int? legalCaseId,
    String? name,
    Value<String?> taxId = const Value.absent(),
  }) => OpposingParty(
    id: id ?? this.id,
    legalCaseId: legalCaseId ?? this.legalCaseId,
    name: name ?? this.name,
    taxId: taxId.present ? taxId.value : this.taxId,
  );
  OpposingParty copyWithCompanion(OpposingPartiesCompanion data) {
    return OpposingParty(
      id: data.id.present ? data.id.value : this.id,
      legalCaseId: data.legalCaseId.present
          ? data.legalCaseId.value
          : this.legalCaseId,
      name: data.name.present ? data.name.value : this.name,
      taxId: data.taxId.present ? data.taxId.value : this.taxId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OpposingParty(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('name: $name, ')
          ..write('taxId: $taxId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, legalCaseId, name, taxId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OpposingParty &&
          other.id == this.id &&
          other.legalCaseId == this.legalCaseId &&
          other.name == this.name &&
          other.taxId == this.taxId);
}

class OpposingPartiesCompanion extends UpdateCompanion<OpposingParty> {
  final Value<int> id;
  final Value<int> legalCaseId;
  final Value<String> name;
  final Value<String?> taxId;
  const OpposingPartiesCompanion({
    this.id = const Value.absent(),
    this.legalCaseId = const Value.absent(),
    this.name = const Value.absent(),
    this.taxId = const Value.absent(),
  });
  OpposingPartiesCompanion.insert({
    this.id = const Value.absent(),
    required int legalCaseId,
    required String name,
    this.taxId = const Value.absent(),
  }) : legalCaseId = Value(legalCaseId),
       name = Value(name);
  static Insertable<OpposingParty> custom({
    Expression<int>? id,
    Expression<int>? legalCaseId,
    Expression<String>? name,
    Expression<String>? taxId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (legalCaseId != null) 'legal_case_id': legalCaseId,
      if (name != null) 'name': name,
      if (taxId != null) 'tax_id': taxId,
    });
  }

  OpposingPartiesCompanion copyWith({
    Value<int>? id,
    Value<int>? legalCaseId,
    Value<String>? name,
    Value<String?>? taxId,
  }) {
    return OpposingPartiesCompanion(
      id: id ?? this.id,
      legalCaseId: legalCaseId ?? this.legalCaseId,
      name: name ?? this.name,
      taxId: taxId ?? this.taxId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (legalCaseId.present) {
      map['legal_case_id'] = Variable<int>(legalCaseId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (taxId.present) {
      map['tax_id'] = Variable<String>(taxId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OpposingPartiesCompanion(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('name: $name, ')
          ..write('taxId: $taxId')
          ..write(')'))
        .toString();
  }
}

class $LegalRepresentativesTable extends LegalRepresentatives
    with TableInfo<$LegalRepresentativesTable, LegalRepresentative> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LegalRepresentativesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _legalCaseIdMeta = const VerificationMeta(
    'legalCaseId',
  );
  @override
  late final GeneratedColumn<int> legalCaseId = GeneratedColumn<int>(
    'legal_case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES legal_cases (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barNumberMeta = const VerificationMeta(
    'barNumber',
  );
  @override
  late final GeneratedColumn<String> barNumber = GeneratedColumn<String>(
    'bar_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    legalCaseId,
    name,
    barNumber,
    contact,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'legal_representatives';
  @override
  VerificationContext validateIntegrity(
    Insertable<LegalRepresentative> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('legal_case_id')) {
      context.handle(
        _legalCaseIdMeta,
        legalCaseId.isAcceptableOrUnknown(
          data['legal_case_id']!,
          _legalCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_legalCaseIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('bar_number')) {
      context.handle(
        _barNumberMeta,
        barNumber.isAcceptableOrUnknown(data['bar_number']!, _barNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_barNumberMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LegalRepresentative map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LegalRepresentative(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      legalCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}legal_case_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      barNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bar_number'],
      )!,
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      )!,
    );
  }

  @override
  $LegalRepresentativesTable createAlias(String alias) {
    return $LegalRepresentativesTable(attachedDatabase, alias);
  }
}

class LegalRepresentative extends DataClass
    implements Insertable<LegalRepresentative> {
  final int id;
  final int legalCaseId;
  final String name;
  final String barNumber;
  final String contact;
  const LegalRepresentative({
    required this.id,
    required this.legalCaseId,
    required this.name,
    required this.barNumber,
    required this.contact,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['legal_case_id'] = Variable<int>(legalCaseId);
    map['name'] = Variable<String>(name);
    map['bar_number'] = Variable<String>(barNumber);
    map['contact'] = Variable<String>(contact);
    return map;
  }

  LegalRepresentativesCompanion toCompanion(bool nullToAbsent) {
    return LegalRepresentativesCompanion(
      id: Value(id),
      legalCaseId: Value(legalCaseId),
      name: Value(name),
      barNumber: Value(barNumber),
      contact: Value(contact),
    );
  }

  factory LegalRepresentative.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LegalRepresentative(
      id: serializer.fromJson<int>(json['id']),
      legalCaseId: serializer.fromJson<int>(json['legalCaseId']),
      name: serializer.fromJson<String>(json['name']),
      barNumber: serializer.fromJson<String>(json['barNumber']),
      contact: serializer.fromJson<String>(json['contact']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'legalCaseId': serializer.toJson<int>(legalCaseId),
      'name': serializer.toJson<String>(name),
      'barNumber': serializer.toJson<String>(barNumber),
      'contact': serializer.toJson<String>(contact),
    };
  }

  LegalRepresentative copyWith({
    int? id,
    int? legalCaseId,
    String? name,
    String? barNumber,
    String? contact,
  }) => LegalRepresentative(
    id: id ?? this.id,
    legalCaseId: legalCaseId ?? this.legalCaseId,
    name: name ?? this.name,
    barNumber: barNumber ?? this.barNumber,
    contact: contact ?? this.contact,
  );
  LegalRepresentative copyWithCompanion(LegalRepresentativesCompanion data) {
    return LegalRepresentative(
      id: data.id.present ? data.id.value : this.id,
      legalCaseId: data.legalCaseId.present
          ? data.legalCaseId.value
          : this.legalCaseId,
      name: data.name.present ? data.name.value : this.name,
      barNumber: data.barNumber.present ? data.barNumber.value : this.barNumber,
      contact: data.contact.present ? data.contact.value : this.contact,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LegalRepresentative(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('name: $name, ')
          ..write('barNumber: $barNumber, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, legalCaseId, name, barNumber, contact);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LegalRepresentative &&
          other.id == this.id &&
          other.legalCaseId == this.legalCaseId &&
          other.name == this.name &&
          other.barNumber == this.barNumber &&
          other.contact == this.contact);
}

class LegalRepresentativesCompanion
    extends UpdateCompanion<LegalRepresentative> {
  final Value<int> id;
  final Value<int> legalCaseId;
  final Value<String> name;
  final Value<String> barNumber;
  final Value<String> contact;
  const LegalRepresentativesCompanion({
    this.id = const Value.absent(),
    this.legalCaseId = const Value.absent(),
    this.name = const Value.absent(),
    this.barNumber = const Value.absent(),
    this.contact = const Value.absent(),
  });
  LegalRepresentativesCompanion.insert({
    this.id = const Value.absent(),
    required int legalCaseId,
    required String name,
    required String barNumber,
    required String contact,
  }) : legalCaseId = Value(legalCaseId),
       name = Value(name),
       barNumber = Value(barNumber),
       contact = Value(contact);
  static Insertable<LegalRepresentative> custom({
    Expression<int>? id,
    Expression<int>? legalCaseId,
    Expression<String>? name,
    Expression<String>? barNumber,
    Expression<String>? contact,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (legalCaseId != null) 'legal_case_id': legalCaseId,
      if (name != null) 'name': name,
      if (barNumber != null) 'bar_number': barNumber,
      if (contact != null) 'contact': contact,
    });
  }

  LegalRepresentativesCompanion copyWith({
    Value<int>? id,
    Value<int>? legalCaseId,
    Value<String>? name,
    Value<String>? barNumber,
    Value<String>? contact,
  }) {
    return LegalRepresentativesCompanion(
      id: id ?? this.id,
      legalCaseId: legalCaseId ?? this.legalCaseId,
      name: name ?? this.name,
      barNumber: barNumber ?? this.barNumber,
      contact: contact ?? this.contact,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (legalCaseId.present) {
      map['legal_case_id'] = Variable<int>(legalCaseId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (barNumber.present) {
      map['bar_number'] = Variable<String>(barNumber.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LegalRepresentativesCompanion(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('name: $name, ')
          ..write('barNumber: $barNumber, ')
          ..write('contact: $contact')
          ..write(')'))
        .toString();
  }
}

class $CaseDatesTable extends CaseDates
    with TableInfo<$CaseDatesTable, CaseDate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseDatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _legalCaseIdMeta = const VerificationMeta(
    'legalCaseId',
  );
  @override
  late final GeneratedColumn<int> legalCaseId = GeneratedColumn<int>(
    'legal_case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES legal_cases (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _lastMovementDateMeta = const VerificationMeta(
    'lastMovementDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastMovementDate =
      GeneratedColumn<DateTime>(
        'last_movement_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _nextDeadlineMeta = const VerificationMeta(
    'nextDeadline',
  );
  @override
  late final GeneratedColumn<DateTime> nextDeadline = GeneratedColumn<DateTime>(
    'next_deadline',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deadlineDescriptionMeta =
      const VerificationMeta('deadlineDescription');
  @override
  late final GeneratedColumn<String> deadlineDescription =
      GeneratedColumn<String>(
        'deadline_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _hearingDateMeta = const VerificationMeta(
    'hearingDate',
  );
  @override
  late final GeneratedColumn<DateTime> hearingDate = GeneratedColumn<DateTime>(
    'hearing_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hearingTypeMeta = const VerificationMeta(
    'hearingType',
  );
  @override
  late final GeneratedColumn<String> hearingType = GeneratedColumn<String>(
    'hearing_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    legalCaseId,
    lastMovementDate,
    nextDeadline,
    deadlineDescription,
    hearingDate,
    hearingType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_dates';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseDate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('legal_case_id')) {
      context.handle(
        _legalCaseIdMeta,
        legalCaseId.isAcceptableOrUnknown(
          data['legal_case_id']!,
          _legalCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_legalCaseIdMeta);
    }
    if (data.containsKey('last_movement_date')) {
      context.handle(
        _lastMovementDateMeta,
        lastMovementDate.isAcceptableOrUnknown(
          data['last_movement_date']!,
          _lastMovementDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastMovementDateMeta);
    }
    if (data.containsKey('next_deadline')) {
      context.handle(
        _nextDeadlineMeta,
        nextDeadline.isAcceptableOrUnknown(
          data['next_deadline']!,
          _nextDeadlineMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextDeadlineMeta);
    }
    if (data.containsKey('deadline_description')) {
      context.handle(
        _deadlineDescriptionMeta,
        deadlineDescription.isAcceptableOrUnknown(
          data['deadline_description']!,
          _deadlineDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_deadlineDescriptionMeta);
    }
    if (data.containsKey('hearing_date')) {
      context.handle(
        _hearingDateMeta,
        hearingDate.isAcceptableOrUnknown(
          data['hearing_date']!,
          _hearingDateMeta,
        ),
      );
    }
    if (data.containsKey('hearing_type')) {
      context.handle(
        _hearingTypeMeta,
        hearingType.isAcceptableOrUnknown(
          data['hearing_type']!,
          _hearingTypeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseDate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseDate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      legalCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}legal_case_id'],
      )!,
      lastMovementDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_movement_date'],
      )!,
      nextDeadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_deadline'],
      )!,
      deadlineDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deadline_description'],
      )!,
      hearingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hearing_date'],
      ),
      hearingType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hearing_type'],
      ),
    );
  }

  @override
  $CaseDatesTable createAlias(String alias) {
    return $CaseDatesTable(attachedDatabase, alias);
  }
}

class CaseDate extends DataClass implements Insertable<CaseDate> {
  final int id;
  final int legalCaseId;
  final DateTime lastMovementDate;
  final DateTime nextDeadline;
  final String deadlineDescription;
  final DateTime? hearingDate;
  final String? hearingType;
  const CaseDate({
    required this.id,
    required this.legalCaseId,
    required this.lastMovementDate,
    required this.nextDeadline,
    required this.deadlineDescription,
    this.hearingDate,
    this.hearingType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['legal_case_id'] = Variable<int>(legalCaseId);
    map['last_movement_date'] = Variable<DateTime>(lastMovementDate);
    map['next_deadline'] = Variable<DateTime>(nextDeadline);
    map['deadline_description'] = Variable<String>(deadlineDescription);
    if (!nullToAbsent || hearingDate != null) {
      map['hearing_date'] = Variable<DateTime>(hearingDate);
    }
    if (!nullToAbsent || hearingType != null) {
      map['hearing_type'] = Variable<String>(hearingType);
    }
    return map;
  }

  CaseDatesCompanion toCompanion(bool nullToAbsent) {
    return CaseDatesCompanion(
      id: Value(id),
      legalCaseId: Value(legalCaseId),
      lastMovementDate: Value(lastMovementDate),
      nextDeadline: Value(nextDeadline),
      deadlineDescription: Value(deadlineDescription),
      hearingDate: hearingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(hearingDate),
      hearingType: hearingType == null && nullToAbsent
          ? const Value.absent()
          : Value(hearingType),
    );
  }

  factory CaseDate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseDate(
      id: serializer.fromJson<int>(json['id']),
      legalCaseId: serializer.fromJson<int>(json['legalCaseId']),
      lastMovementDate: serializer.fromJson<DateTime>(json['lastMovementDate']),
      nextDeadline: serializer.fromJson<DateTime>(json['nextDeadline']),
      deadlineDescription: serializer.fromJson<String>(
        json['deadlineDescription'],
      ),
      hearingDate: serializer.fromJson<DateTime?>(json['hearingDate']),
      hearingType: serializer.fromJson<String?>(json['hearingType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'legalCaseId': serializer.toJson<int>(legalCaseId),
      'lastMovementDate': serializer.toJson<DateTime>(lastMovementDate),
      'nextDeadline': serializer.toJson<DateTime>(nextDeadline),
      'deadlineDescription': serializer.toJson<String>(deadlineDescription),
      'hearingDate': serializer.toJson<DateTime?>(hearingDate),
      'hearingType': serializer.toJson<String?>(hearingType),
    };
  }

  CaseDate copyWith({
    int? id,
    int? legalCaseId,
    DateTime? lastMovementDate,
    DateTime? nextDeadline,
    String? deadlineDescription,
    Value<DateTime?> hearingDate = const Value.absent(),
    Value<String?> hearingType = const Value.absent(),
  }) => CaseDate(
    id: id ?? this.id,
    legalCaseId: legalCaseId ?? this.legalCaseId,
    lastMovementDate: lastMovementDate ?? this.lastMovementDate,
    nextDeadline: nextDeadline ?? this.nextDeadline,
    deadlineDescription: deadlineDescription ?? this.deadlineDescription,
    hearingDate: hearingDate.present ? hearingDate.value : this.hearingDate,
    hearingType: hearingType.present ? hearingType.value : this.hearingType,
  );
  CaseDate copyWithCompanion(CaseDatesCompanion data) {
    return CaseDate(
      id: data.id.present ? data.id.value : this.id,
      legalCaseId: data.legalCaseId.present
          ? data.legalCaseId.value
          : this.legalCaseId,
      lastMovementDate: data.lastMovementDate.present
          ? data.lastMovementDate.value
          : this.lastMovementDate,
      nextDeadline: data.nextDeadline.present
          ? data.nextDeadline.value
          : this.nextDeadline,
      deadlineDescription: data.deadlineDescription.present
          ? data.deadlineDescription.value
          : this.deadlineDescription,
      hearingDate: data.hearingDate.present
          ? data.hearingDate.value
          : this.hearingDate,
      hearingType: data.hearingType.present
          ? data.hearingType.value
          : this.hearingType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseDate(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('lastMovementDate: $lastMovementDate, ')
          ..write('nextDeadline: $nextDeadline, ')
          ..write('deadlineDescription: $deadlineDescription, ')
          ..write('hearingDate: $hearingDate, ')
          ..write('hearingType: $hearingType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    legalCaseId,
    lastMovementDate,
    nextDeadline,
    deadlineDescription,
    hearingDate,
    hearingType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseDate &&
          other.id == this.id &&
          other.legalCaseId == this.legalCaseId &&
          other.lastMovementDate == this.lastMovementDate &&
          other.nextDeadline == this.nextDeadline &&
          other.deadlineDescription == this.deadlineDescription &&
          other.hearingDate == this.hearingDate &&
          other.hearingType == this.hearingType);
}

class CaseDatesCompanion extends UpdateCompanion<CaseDate> {
  final Value<int> id;
  final Value<int> legalCaseId;
  final Value<DateTime> lastMovementDate;
  final Value<DateTime> nextDeadline;
  final Value<String> deadlineDescription;
  final Value<DateTime?> hearingDate;
  final Value<String?> hearingType;
  const CaseDatesCompanion({
    this.id = const Value.absent(),
    this.legalCaseId = const Value.absent(),
    this.lastMovementDate = const Value.absent(),
    this.nextDeadline = const Value.absent(),
    this.deadlineDescription = const Value.absent(),
    this.hearingDate = const Value.absent(),
    this.hearingType = const Value.absent(),
  });
  CaseDatesCompanion.insert({
    this.id = const Value.absent(),
    required int legalCaseId,
    required DateTime lastMovementDate,
    required DateTime nextDeadline,
    required String deadlineDescription,
    this.hearingDate = const Value.absent(),
    this.hearingType = const Value.absent(),
  }) : legalCaseId = Value(legalCaseId),
       lastMovementDate = Value(lastMovementDate),
       nextDeadline = Value(nextDeadline),
       deadlineDescription = Value(deadlineDescription);
  static Insertable<CaseDate> custom({
    Expression<int>? id,
    Expression<int>? legalCaseId,
    Expression<DateTime>? lastMovementDate,
    Expression<DateTime>? nextDeadline,
    Expression<String>? deadlineDescription,
    Expression<DateTime>? hearingDate,
    Expression<String>? hearingType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (legalCaseId != null) 'legal_case_id': legalCaseId,
      if (lastMovementDate != null) 'last_movement_date': lastMovementDate,
      if (nextDeadline != null) 'next_deadline': nextDeadline,
      if (deadlineDescription != null)
        'deadline_description': deadlineDescription,
      if (hearingDate != null) 'hearing_date': hearingDate,
      if (hearingType != null) 'hearing_type': hearingType,
    });
  }

  CaseDatesCompanion copyWith({
    Value<int>? id,
    Value<int>? legalCaseId,
    Value<DateTime>? lastMovementDate,
    Value<DateTime>? nextDeadline,
    Value<String>? deadlineDescription,
    Value<DateTime?>? hearingDate,
    Value<String?>? hearingType,
  }) {
    return CaseDatesCompanion(
      id: id ?? this.id,
      legalCaseId: legalCaseId ?? this.legalCaseId,
      lastMovementDate: lastMovementDate ?? this.lastMovementDate,
      nextDeadline: nextDeadline ?? this.nextDeadline,
      deadlineDescription: deadlineDescription ?? this.deadlineDescription,
      hearingDate: hearingDate ?? this.hearingDate,
      hearingType: hearingType ?? this.hearingType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (legalCaseId.present) {
      map['legal_case_id'] = Variable<int>(legalCaseId.value);
    }
    if (lastMovementDate.present) {
      map['last_movement_date'] = Variable<DateTime>(lastMovementDate.value);
    }
    if (nextDeadline.present) {
      map['next_deadline'] = Variable<DateTime>(nextDeadline.value);
    }
    if (deadlineDescription.present) {
      map['deadline_description'] = Variable<String>(deadlineDescription.value);
    }
    if (hearingDate.present) {
      map['hearing_date'] = Variable<DateTime>(hearingDate.value);
    }
    if (hearingType.present) {
      map['hearing_type'] = Variable<String>(hearingType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseDatesCompanion(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('lastMovementDate: $lastMovementDate, ')
          ..write('nextDeadline: $nextDeadline, ')
          ..write('deadlineDescription: $deadlineDescription, ')
          ..write('hearingDate: $hearingDate, ')
          ..write('hearingType: $hearingType')
          ..write(')'))
        .toString();
  }
}

class $CaseMovementsTable extends CaseMovements
    with TableInfo<$CaseMovementsTable, CaseMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _legalCaseIdMeta = const VerificationMeta(
    'legalCaseId',
  );
  @override
  late final GeneratedColumn<int> legalCaseId = GeneratedColumn<int>(
    'legal_case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES legal_cases (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _movementDateMeta = const VerificationMeta(
    'movementDate',
  );
  @override
  late final GeneratedColumn<DateTime> movementDate = GeneratedColumn<DateTime>(
    'movement_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _responsibleMeta = const VerificationMeta(
    'responsible',
  );
  @override
  late final GeneratedColumn<String> responsible = GeneratedColumn<String>(
    'responsible',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    legalCaseId,
    movementDate,
    description,
    responsible,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_movements';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseMovement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('legal_case_id')) {
      context.handle(
        _legalCaseIdMeta,
        legalCaseId.isAcceptableOrUnknown(
          data['legal_case_id']!,
          _legalCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_legalCaseIdMeta);
    }
    if (data.containsKey('movement_date')) {
      context.handle(
        _movementDateMeta,
        movementDate.isAcceptableOrUnknown(
          data['movement_date']!,
          _movementDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_movementDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('responsible')) {
      context.handle(
        _responsibleMeta,
        responsible.isAcceptableOrUnknown(
          data['responsible']!,
          _responsibleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_responsibleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseMovement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      legalCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}legal_case_id'],
      )!,
      movementDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}movement_date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      responsible: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}responsible'],
      )!,
    );
  }

  @override
  $CaseMovementsTable createAlias(String alias) {
    return $CaseMovementsTable(attachedDatabase, alias);
  }
}

class CaseMovement extends DataClass implements Insertable<CaseMovement> {
  final int id;
  final int legalCaseId;
  final DateTime movementDate;
  final String description;
  final String responsible;
  const CaseMovement({
    required this.id,
    required this.legalCaseId,
    required this.movementDate,
    required this.description,
    required this.responsible,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['legal_case_id'] = Variable<int>(legalCaseId);
    map['movement_date'] = Variable<DateTime>(movementDate);
    map['description'] = Variable<String>(description);
    map['responsible'] = Variable<String>(responsible);
    return map;
  }

  CaseMovementsCompanion toCompanion(bool nullToAbsent) {
    return CaseMovementsCompanion(
      id: Value(id),
      legalCaseId: Value(legalCaseId),
      movementDate: Value(movementDate),
      description: Value(description),
      responsible: Value(responsible),
    );
  }

  factory CaseMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseMovement(
      id: serializer.fromJson<int>(json['id']),
      legalCaseId: serializer.fromJson<int>(json['legalCaseId']),
      movementDate: serializer.fromJson<DateTime>(json['movementDate']),
      description: serializer.fromJson<String>(json['description']),
      responsible: serializer.fromJson<String>(json['responsible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'legalCaseId': serializer.toJson<int>(legalCaseId),
      'movementDate': serializer.toJson<DateTime>(movementDate),
      'description': serializer.toJson<String>(description),
      'responsible': serializer.toJson<String>(responsible),
    };
  }

  CaseMovement copyWith({
    int? id,
    int? legalCaseId,
    DateTime? movementDate,
    String? description,
    String? responsible,
  }) => CaseMovement(
    id: id ?? this.id,
    legalCaseId: legalCaseId ?? this.legalCaseId,
    movementDate: movementDate ?? this.movementDate,
    description: description ?? this.description,
    responsible: responsible ?? this.responsible,
  );
  CaseMovement copyWithCompanion(CaseMovementsCompanion data) {
    return CaseMovement(
      id: data.id.present ? data.id.value : this.id,
      legalCaseId: data.legalCaseId.present
          ? data.legalCaseId.value
          : this.legalCaseId,
      movementDate: data.movementDate.present
          ? data.movementDate.value
          : this.movementDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      responsible: data.responsible.present
          ? data.responsible.value
          : this.responsible,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseMovement(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('movementDate: $movementDate, ')
          ..write('description: $description, ')
          ..write('responsible: $responsible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, legalCaseId, movementDate, description, responsible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseMovement &&
          other.id == this.id &&
          other.legalCaseId == this.legalCaseId &&
          other.movementDate == this.movementDate &&
          other.description == this.description &&
          other.responsible == this.responsible);
}

class CaseMovementsCompanion extends UpdateCompanion<CaseMovement> {
  final Value<int> id;
  final Value<int> legalCaseId;
  final Value<DateTime> movementDate;
  final Value<String> description;
  final Value<String> responsible;
  const CaseMovementsCompanion({
    this.id = const Value.absent(),
    this.legalCaseId = const Value.absent(),
    this.movementDate = const Value.absent(),
    this.description = const Value.absent(),
    this.responsible = const Value.absent(),
  });
  CaseMovementsCompanion.insert({
    this.id = const Value.absent(),
    required int legalCaseId,
    required DateTime movementDate,
    required String description,
    required String responsible,
  }) : legalCaseId = Value(legalCaseId),
       movementDate = Value(movementDate),
       description = Value(description),
       responsible = Value(responsible);
  static Insertable<CaseMovement> custom({
    Expression<int>? id,
    Expression<int>? legalCaseId,
    Expression<DateTime>? movementDate,
    Expression<String>? description,
    Expression<String>? responsible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (legalCaseId != null) 'legal_case_id': legalCaseId,
      if (movementDate != null) 'movement_date': movementDate,
      if (description != null) 'description': description,
      if (responsible != null) 'responsible': responsible,
    });
  }

  CaseMovementsCompanion copyWith({
    Value<int>? id,
    Value<int>? legalCaseId,
    Value<DateTime>? movementDate,
    Value<String>? description,
    Value<String>? responsible,
  }) {
    return CaseMovementsCompanion(
      id: id ?? this.id,
      legalCaseId: legalCaseId ?? this.legalCaseId,
      movementDate: movementDate ?? this.movementDate,
      description: description ?? this.description,
      responsible: responsible ?? this.responsible,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (legalCaseId.present) {
      map['legal_case_id'] = Variable<int>(legalCaseId.value);
    }
    if (movementDate.present) {
      map['movement_date'] = Variable<DateTime>(movementDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (responsible.present) {
      map['responsible'] = Variable<String>(responsible.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseMovementsCompanion(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('movementDate: $movementDate, ')
          ..write('description: $description, ')
          ..write('responsible: $responsible')
          ..write(')'))
        .toString();
  }
}

class $CaseDocumentsTable extends CaseDocuments
    with TableInfo<$CaseDocumentsTable, CaseDocument> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaseDocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _legalCaseIdMeta = const VerificationMeta(
    'legalCaseId',
  );
  @override
  late final GeneratedColumn<int> legalCaseId = GeneratedColumn<int>(
    'legal_case_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES legal_cases (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _documentTypeMeta = const VerificationMeta(
    'documentType',
  );
  @override
  late final GeneratedColumn<String> documentType = GeneratedColumn<String>(
    'document_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentDateMeta = const VerificationMeta(
    'documentDate',
  );
  @override
  late final GeneratedColumn<DateTime> documentDate = GeneratedColumn<DateTime>(
    'document_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    legalCaseId,
    documentType,
    documentDate,
    notes,
    filePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'case_documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<CaseDocument> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('legal_case_id')) {
      context.handle(
        _legalCaseIdMeta,
        legalCaseId.isAcceptableOrUnknown(
          data['legal_case_id']!,
          _legalCaseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_legalCaseIdMeta);
    }
    if (data.containsKey('document_type')) {
      context.handle(
        _documentTypeMeta,
        documentType.isAcceptableOrUnknown(
          data['document_type']!,
          _documentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_documentTypeMeta);
    }
    if (data.containsKey('document_date')) {
      context.handle(
        _documentDateMeta,
        documentDate.isAcceptableOrUnknown(
          data['document_date']!,
          _documentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_documentDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CaseDocument map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CaseDocument(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      legalCaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}legal_case_id'],
      )!,
      documentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document_type'],
      )!,
      documentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}document_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
    );
  }

  @override
  $CaseDocumentsTable createAlias(String alias) {
    return $CaseDocumentsTable(attachedDatabase, alias);
  }
}

class CaseDocument extends DataClass implements Insertable<CaseDocument> {
  final int id;
  final int legalCaseId;
  final String documentType;
  final DateTime documentDate;
  final String? notes;
  final String filePath;
  const CaseDocument({
    required this.id,
    required this.legalCaseId,
    required this.documentType,
    required this.documentDate,
    this.notes,
    required this.filePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['legal_case_id'] = Variable<int>(legalCaseId);
    map['document_type'] = Variable<String>(documentType);
    map['document_date'] = Variable<DateTime>(documentDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['file_path'] = Variable<String>(filePath);
    return map;
  }

  CaseDocumentsCompanion toCompanion(bool nullToAbsent) {
    return CaseDocumentsCompanion(
      id: Value(id),
      legalCaseId: Value(legalCaseId),
      documentType: Value(documentType),
      documentDate: Value(documentDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      filePath: Value(filePath),
    );
  }

  factory CaseDocument.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CaseDocument(
      id: serializer.fromJson<int>(json['id']),
      legalCaseId: serializer.fromJson<int>(json['legalCaseId']),
      documentType: serializer.fromJson<String>(json['documentType']),
      documentDate: serializer.fromJson<DateTime>(json['documentDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      filePath: serializer.fromJson<String>(json['filePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'legalCaseId': serializer.toJson<int>(legalCaseId),
      'documentType': serializer.toJson<String>(documentType),
      'documentDate': serializer.toJson<DateTime>(documentDate),
      'notes': serializer.toJson<String?>(notes),
      'filePath': serializer.toJson<String>(filePath),
    };
  }

  CaseDocument copyWith({
    int? id,
    int? legalCaseId,
    String? documentType,
    DateTime? documentDate,
    Value<String?> notes = const Value.absent(),
    String? filePath,
  }) => CaseDocument(
    id: id ?? this.id,
    legalCaseId: legalCaseId ?? this.legalCaseId,
    documentType: documentType ?? this.documentType,
    documentDate: documentDate ?? this.documentDate,
    notes: notes.present ? notes.value : this.notes,
    filePath: filePath ?? this.filePath,
  );
  CaseDocument copyWithCompanion(CaseDocumentsCompanion data) {
    return CaseDocument(
      id: data.id.present ? data.id.value : this.id,
      legalCaseId: data.legalCaseId.present
          ? data.legalCaseId.value
          : this.legalCaseId,
      documentType: data.documentType.present
          ? data.documentType.value
          : this.documentType,
      documentDate: data.documentDate.present
          ? data.documentDate.value
          : this.documentDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CaseDocument(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('documentType: $documentType, ')
          ..write('documentDate: $documentDate, ')
          ..write('notes: $notes, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, legalCaseId, documentType, documentDate, notes, filePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CaseDocument &&
          other.id == this.id &&
          other.legalCaseId == this.legalCaseId &&
          other.documentType == this.documentType &&
          other.documentDate == this.documentDate &&
          other.notes == this.notes &&
          other.filePath == this.filePath);
}

class CaseDocumentsCompanion extends UpdateCompanion<CaseDocument> {
  final Value<int> id;
  final Value<int> legalCaseId;
  final Value<String> documentType;
  final Value<DateTime> documentDate;
  final Value<String?> notes;
  final Value<String> filePath;
  const CaseDocumentsCompanion({
    this.id = const Value.absent(),
    this.legalCaseId = const Value.absent(),
    this.documentType = const Value.absent(),
    this.documentDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.filePath = const Value.absent(),
  });
  CaseDocumentsCompanion.insert({
    this.id = const Value.absent(),
    required int legalCaseId,
    required String documentType,
    required DateTime documentDate,
    this.notes = const Value.absent(),
    required String filePath,
  }) : legalCaseId = Value(legalCaseId),
       documentType = Value(documentType),
       documentDate = Value(documentDate),
       filePath = Value(filePath);
  static Insertable<CaseDocument> custom({
    Expression<int>? id,
    Expression<int>? legalCaseId,
    Expression<String>? documentType,
    Expression<DateTime>? documentDate,
    Expression<String>? notes,
    Expression<String>? filePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (legalCaseId != null) 'legal_case_id': legalCaseId,
      if (documentType != null) 'document_type': documentType,
      if (documentDate != null) 'document_date': documentDate,
      if (notes != null) 'notes': notes,
      if (filePath != null) 'file_path': filePath,
    });
  }

  CaseDocumentsCompanion copyWith({
    Value<int>? id,
    Value<int>? legalCaseId,
    Value<String>? documentType,
    Value<DateTime>? documentDate,
    Value<String?>? notes,
    Value<String>? filePath,
  }) {
    return CaseDocumentsCompanion(
      id: id ?? this.id,
      legalCaseId: legalCaseId ?? this.legalCaseId,
      documentType: documentType ?? this.documentType,
      documentDate: documentDate ?? this.documentDate,
      notes: notes ?? this.notes,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (legalCaseId.present) {
      map['legal_case_id'] = Variable<int>(legalCaseId.value);
    }
    if (documentType.present) {
      map['document_type'] = Variable<String>(documentType.value);
    }
    if (documentDate.present) {
      map['document_date'] = Variable<DateTime>(documentDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaseDocumentsCompanion(')
          ..write('id: $id, ')
          ..write('legalCaseId: $legalCaseId, ')
          ..write('documentType: $documentType, ')
          ..write('documentDate: $documentDate, ')
          ..write('notes: $notes, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LegalCasesTable legalCases = $LegalCasesTable(this);
  late final $MainPartiesTable mainParties = $MainPartiesTable(this);
  late final $OpposingPartiesTable opposingParties = $OpposingPartiesTable(
    this,
  );
  late final $LegalRepresentativesTable legalRepresentatives =
      $LegalRepresentativesTable(this);
  late final $CaseDatesTable caseDates = $CaseDatesTable(this);
  late final $CaseMovementsTable caseMovements = $CaseMovementsTable(this);
  late final $CaseDocumentsTable caseDocuments = $CaseDocumentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    legalCases,
    mainParties,
    opposingParties,
    legalRepresentatives,
    caseDates,
    caseMovements,
    caseDocuments,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'legal_cases',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('main_parties', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'legal_cases',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('opposing_parties', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'legal_cases',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('legal_representatives', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'legal_cases',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('case_dates', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'legal_cases',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('case_movements', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'legal_cases',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('case_documents', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$LegalCasesTableCreateCompanionBuilder =
    LegalCasesCompanion Function({
      Value<int> id,
      required String caseNumber,
      required String caseType,
      required String area,
      required String court,
      required String jurisdiction,
      required String status,
      required String priority,
      required DateTime startDate,
      Value<DateTime?> expectedEndDate,
      Value<DateTime> createdAt,
    });
typedef $$LegalCasesTableUpdateCompanionBuilder =
    LegalCasesCompanion Function({
      Value<int> id,
      Value<String> caseNumber,
      Value<String> caseType,
      Value<String> area,
      Value<String> court,
      Value<String> jurisdiction,
      Value<String> status,
      Value<String> priority,
      Value<DateTime> startDate,
      Value<DateTime?> expectedEndDate,
      Value<DateTime> createdAt,
    });

final class $$LegalCasesTableReferences
    extends BaseReferences<_$AppDatabase, $LegalCasesTable, LegalCase> {
  $$LegalCasesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MainPartiesTable, List<MainParty>>
  _mainPartiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mainParties,
    aliasName: $_aliasNameGenerator(
      db.legalCases.id,
      db.mainParties.legalCaseId,
    ),
  );

  $$MainPartiesTableProcessedTableManager get mainPartiesRefs {
    final manager = $$MainPartiesTableTableManager(
      $_db,
      $_db.mainParties,
    ).filter((f) => f.legalCaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_mainPartiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OpposingPartiesTable, List<OpposingParty>>
  _opposingPartiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.opposingParties,
    aliasName: $_aliasNameGenerator(
      db.legalCases.id,
      db.opposingParties.legalCaseId,
    ),
  );

  $$OpposingPartiesTableProcessedTableManager get opposingPartiesRefs {
    final manager = $$OpposingPartiesTableTableManager(
      $_db,
      $_db.opposingParties,
    ).filter((f) => f.legalCaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _opposingPartiesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $LegalRepresentativesTable,
    List<LegalRepresentative>
  >
  _legalRepresentativesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.legalRepresentatives,
        aliasName: $_aliasNameGenerator(
          db.legalCases.id,
          db.legalRepresentatives.legalCaseId,
        ),
      );

  $$LegalRepresentativesTableProcessedTableManager
  get legalRepresentativesRefs {
    final manager = $$LegalRepresentativesTableTableManager(
      $_db,
      $_db.legalRepresentatives,
    ).filter((f) => f.legalCaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _legalRepresentativesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CaseDatesTable, List<CaseDate>>
  _caseDatesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.caseDates,
    aliasName: $_aliasNameGenerator(db.legalCases.id, db.caseDates.legalCaseId),
  );

  $$CaseDatesTableProcessedTableManager get caseDatesRefs {
    final manager = $$CaseDatesTableTableManager(
      $_db,
      $_db.caseDates,
    ).filter((f) => f.legalCaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_caseDatesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CaseMovementsTable, List<CaseMovement>>
  _caseMovementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.caseMovements,
    aliasName: $_aliasNameGenerator(
      db.legalCases.id,
      db.caseMovements.legalCaseId,
    ),
  );

  $$CaseMovementsTableProcessedTableManager get caseMovementsRefs {
    final manager = $$CaseMovementsTableTableManager(
      $_db,
      $_db.caseMovements,
    ).filter((f) => f.legalCaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_caseMovementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CaseDocumentsTable, List<CaseDocument>>
  _caseDocumentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.caseDocuments,
    aliasName: $_aliasNameGenerator(
      db.legalCases.id,
      db.caseDocuments.legalCaseId,
    ),
  );

  $$CaseDocumentsTableProcessedTableManager get caseDocumentsRefs {
    final manager = $$CaseDocumentsTableTableManager(
      $_db,
      $_db.caseDocuments,
    ).filter((f) => f.legalCaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_caseDocumentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LegalCasesTableFilterComposer
    extends Composer<_$AppDatabase, $LegalCasesTable> {
  $$LegalCasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseNumber => $composableBuilder(
    column: $table.caseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caseType => $composableBuilder(
    column: $table.caseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get court => $composableBuilder(
    column: $table.court,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jurisdiction => $composableBuilder(
    column: $table.jurisdiction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expectedEndDate => $composableBuilder(
    column: $table.expectedEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> mainPartiesRefs(
    Expression<bool> Function($$MainPartiesTableFilterComposer f) f,
  ) {
    final $$MainPartiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mainParties,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MainPartiesTableFilterComposer(
            $db: $db,
            $table: $db.mainParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> opposingPartiesRefs(
    Expression<bool> Function($$OpposingPartiesTableFilterComposer f) f,
  ) {
    final $$OpposingPartiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.opposingParties,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OpposingPartiesTableFilterComposer(
            $db: $db,
            $table: $db.opposingParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> legalRepresentativesRefs(
    Expression<bool> Function($$LegalRepresentativesTableFilterComposer f) f,
  ) {
    final $$LegalRepresentativesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.legalRepresentatives,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalRepresentativesTableFilterComposer(
            $db: $db,
            $table: $db.legalRepresentatives,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> caseDatesRefs(
    Expression<bool> Function($$CaseDatesTableFilterComposer f) f,
  ) {
    final $$CaseDatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caseDates,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaseDatesTableFilterComposer(
            $db: $db,
            $table: $db.caseDates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> caseMovementsRefs(
    Expression<bool> Function($$CaseMovementsTableFilterComposer f) f,
  ) {
    final $$CaseMovementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caseMovements,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaseMovementsTableFilterComposer(
            $db: $db,
            $table: $db.caseMovements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> caseDocumentsRefs(
    Expression<bool> Function($$CaseDocumentsTableFilterComposer f) f,
  ) {
    final $$CaseDocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caseDocuments,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaseDocumentsTableFilterComposer(
            $db: $db,
            $table: $db.caseDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LegalCasesTableOrderingComposer
    extends Composer<_$AppDatabase, $LegalCasesTable> {
  $$LegalCasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseNumber => $composableBuilder(
    column: $table.caseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caseType => $composableBuilder(
    column: $table.caseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get court => $composableBuilder(
    column: $table.court,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jurisdiction => $composableBuilder(
    column: $table.jurisdiction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expectedEndDate => $composableBuilder(
    column: $table.expectedEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LegalCasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LegalCasesTable> {
  $$LegalCasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get caseNumber => $composableBuilder(
    column: $table.caseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get caseType =>
      $composableBuilder(column: $table.caseType, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get court =>
      $composableBuilder(column: $table.court, builder: (column) => column);

  GeneratedColumn<String> get jurisdiction => $composableBuilder(
    column: $table.jurisdiction,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get expectedEndDate => $composableBuilder(
    column: $table.expectedEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> mainPartiesRefs<T extends Object>(
    Expression<T> Function($$MainPartiesTableAnnotationComposer a) f,
  ) {
    final $$MainPartiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mainParties,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MainPartiesTableAnnotationComposer(
            $db: $db,
            $table: $db.mainParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> opposingPartiesRefs<T extends Object>(
    Expression<T> Function($$OpposingPartiesTableAnnotationComposer a) f,
  ) {
    final $$OpposingPartiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.opposingParties,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OpposingPartiesTableAnnotationComposer(
            $db: $db,
            $table: $db.opposingParties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> legalRepresentativesRefs<T extends Object>(
    Expression<T> Function($$LegalRepresentativesTableAnnotationComposer a) f,
  ) {
    final $$LegalRepresentativesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.legalRepresentatives,
          getReferencedColumn: (t) => t.legalCaseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LegalRepresentativesTableAnnotationComposer(
                $db: $db,
                $table: $db.legalRepresentatives,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> caseDatesRefs<T extends Object>(
    Expression<T> Function($$CaseDatesTableAnnotationComposer a) f,
  ) {
    final $$CaseDatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caseDates,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaseDatesTableAnnotationComposer(
            $db: $db,
            $table: $db.caseDates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> caseMovementsRefs<T extends Object>(
    Expression<T> Function($$CaseMovementsTableAnnotationComposer a) f,
  ) {
    final $$CaseMovementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caseMovements,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaseMovementsTableAnnotationComposer(
            $db: $db,
            $table: $db.caseMovements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> caseDocumentsRefs<T extends Object>(
    Expression<T> Function($$CaseDocumentsTableAnnotationComposer a) f,
  ) {
    final $$CaseDocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caseDocuments,
      getReferencedColumn: (t) => t.legalCaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaseDocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.caseDocuments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LegalCasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LegalCasesTable,
          LegalCase,
          $$LegalCasesTableFilterComposer,
          $$LegalCasesTableOrderingComposer,
          $$LegalCasesTableAnnotationComposer,
          $$LegalCasesTableCreateCompanionBuilder,
          $$LegalCasesTableUpdateCompanionBuilder,
          (LegalCase, $$LegalCasesTableReferences),
          LegalCase,
          PrefetchHooks Function({
            bool mainPartiesRefs,
            bool opposingPartiesRefs,
            bool legalRepresentativesRefs,
            bool caseDatesRefs,
            bool caseMovementsRefs,
            bool caseDocumentsRefs,
          })
        > {
  $$LegalCasesTableTableManager(_$AppDatabase db, $LegalCasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LegalCasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LegalCasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LegalCasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> caseNumber = const Value.absent(),
                Value<String> caseType = const Value.absent(),
                Value<String> area = const Value.absent(),
                Value<String> court = const Value.absent(),
                Value<String> jurisdiction = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> expectedEndDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LegalCasesCompanion(
                id: id,
                caseNumber: caseNumber,
                caseType: caseType,
                area: area,
                court: court,
                jurisdiction: jurisdiction,
                status: status,
                priority: priority,
                startDate: startDate,
                expectedEndDate: expectedEndDate,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String caseNumber,
                required String caseType,
                required String area,
                required String court,
                required String jurisdiction,
                required String status,
                required String priority,
                required DateTime startDate,
                Value<DateTime?> expectedEndDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => LegalCasesCompanion.insert(
                id: id,
                caseNumber: caseNumber,
                caseType: caseType,
                area: area,
                court: court,
                jurisdiction: jurisdiction,
                status: status,
                priority: priority,
                startDate: startDate,
                expectedEndDate: expectedEndDate,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LegalCasesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                mainPartiesRefs = false,
                opposingPartiesRefs = false,
                legalRepresentativesRefs = false,
                caseDatesRefs = false,
                caseMovementsRefs = false,
                caseDocumentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (mainPartiesRefs) db.mainParties,
                    if (opposingPartiesRefs) db.opposingParties,
                    if (legalRepresentativesRefs) db.legalRepresentatives,
                    if (caseDatesRefs) db.caseDates,
                    if (caseMovementsRefs) db.caseMovements,
                    if (caseDocumentsRefs) db.caseDocuments,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (mainPartiesRefs)
                        await $_getPrefetchedData<
                          LegalCase,
                          $LegalCasesTable,
                          MainParty
                        >(
                          currentTable: table,
                          referencedTable: $$LegalCasesTableReferences
                              ._mainPartiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LegalCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).mainPartiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.legalCaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (opposingPartiesRefs)
                        await $_getPrefetchedData<
                          LegalCase,
                          $LegalCasesTable,
                          OpposingParty
                        >(
                          currentTable: table,
                          referencedTable: $$LegalCasesTableReferences
                              ._opposingPartiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LegalCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).opposingPartiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.legalCaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (legalRepresentativesRefs)
                        await $_getPrefetchedData<
                          LegalCase,
                          $LegalCasesTable,
                          LegalRepresentative
                        >(
                          currentTable: table,
                          referencedTable: $$LegalCasesTableReferences
                              ._legalRepresentativesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LegalCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).legalRepresentativesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.legalCaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (caseDatesRefs)
                        await $_getPrefetchedData<
                          LegalCase,
                          $LegalCasesTable,
                          CaseDate
                        >(
                          currentTable: table,
                          referencedTable: $$LegalCasesTableReferences
                              ._caseDatesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LegalCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).caseDatesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.legalCaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (caseMovementsRefs)
                        await $_getPrefetchedData<
                          LegalCase,
                          $LegalCasesTable,
                          CaseMovement
                        >(
                          currentTable: table,
                          referencedTable: $$LegalCasesTableReferences
                              ._caseMovementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LegalCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).caseMovementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.legalCaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (caseDocumentsRefs)
                        await $_getPrefetchedData<
                          LegalCase,
                          $LegalCasesTable,
                          CaseDocument
                        >(
                          currentTable: table,
                          referencedTable: $$LegalCasesTableReferences
                              ._caseDocumentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LegalCasesTableReferences(
                                db,
                                table,
                                p0,
                              ).caseDocumentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.legalCaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LegalCasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LegalCasesTable,
      LegalCase,
      $$LegalCasesTableFilterComposer,
      $$LegalCasesTableOrderingComposer,
      $$LegalCasesTableAnnotationComposer,
      $$LegalCasesTableCreateCompanionBuilder,
      $$LegalCasesTableUpdateCompanionBuilder,
      (LegalCase, $$LegalCasesTableReferences),
      LegalCase,
      PrefetchHooks Function({
        bool mainPartiesRefs,
        bool opposingPartiesRefs,
        bool legalRepresentativesRefs,
        bool caseDatesRefs,
        bool caseMovementsRefs,
        bool caseDocumentsRefs,
      })
    >;
typedef $$MainPartiesTableCreateCompanionBuilder =
    MainPartiesCompanion Function({
      Value<int> id,
      required int legalCaseId,
      required String name,
      required String role,
      Value<String?> taxId,
    });
typedef $$MainPartiesTableUpdateCompanionBuilder =
    MainPartiesCompanion Function({
      Value<int> id,
      Value<int> legalCaseId,
      Value<String> name,
      Value<String> role,
      Value<String?> taxId,
    });

final class $$MainPartiesTableReferences
    extends BaseReferences<_$AppDatabase, $MainPartiesTable, MainParty> {
  $$MainPartiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LegalCasesTable _legalCaseIdTable(_$AppDatabase db) =>
      db.legalCases.createAlias(
        $_aliasNameGenerator(db.mainParties.legalCaseId, db.legalCases.id),
      );

  $$LegalCasesTableProcessedTableManager get legalCaseId {
    final $_column = $_itemColumn<int>('legal_case_id')!;

    final manager = $$LegalCasesTableTableManager(
      $_db,
      $_db.legalCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_legalCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MainPartiesTableFilterComposer
    extends Composer<_$AppDatabase, $MainPartiesTable> {
  $$MainPartiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnFilters(column),
  );

  $$LegalCasesTableFilterComposer get legalCaseId {
    final $$LegalCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableFilterComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MainPartiesTableOrderingComposer
    extends Composer<_$AppDatabase, $MainPartiesTable> {
  $$MainPartiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnOrderings(column),
  );

  $$LegalCasesTableOrderingComposer get legalCaseId {
    final $$LegalCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableOrderingComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MainPartiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MainPartiesTable> {
  $$MainPartiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get taxId =>
      $composableBuilder(column: $table.taxId, builder: (column) => column);

  $$LegalCasesTableAnnotationComposer get legalCaseId {
    final $$LegalCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MainPartiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MainPartiesTable,
          MainParty,
          $$MainPartiesTableFilterComposer,
          $$MainPartiesTableOrderingComposer,
          $$MainPartiesTableAnnotationComposer,
          $$MainPartiesTableCreateCompanionBuilder,
          $$MainPartiesTableUpdateCompanionBuilder,
          (MainParty, $$MainPartiesTableReferences),
          MainParty,
          PrefetchHooks Function({bool legalCaseId})
        > {
  $$MainPartiesTableTableManager(_$AppDatabase db, $MainPartiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MainPartiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MainPartiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MainPartiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> legalCaseId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String?> taxId = const Value.absent(),
              }) => MainPartiesCompanion(
                id: id,
                legalCaseId: legalCaseId,
                name: name,
                role: role,
                taxId: taxId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int legalCaseId,
                required String name,
                required String role,
                Value<String?> taxId = const Value.absent(),
              }) => MainPartiesCompanion.insert(
                id: id,
                legalCaseId: legalCaseId,
                name: name,
                role: role,
                taxId: taxId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MainPartiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({legalCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (legalCaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.legalCaseId,
                                referencedTable: $$MainPartiesTableReferences
                                    ._legalCaseIdTable(db),
                                referencedColumn: $$MainPartiesTableReferences
                                    ._legalCaseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MainPartiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MainPartiesTable,
      MainParty,
      $$MainPartiesTableFilterComposer,
      $$MainPartiesTableOrderingComposer,
      $$MainPartiesTableAnnotationComposer,
      $$MainPartiesTableCreateCompanionBuilder,
      $$MainPartiesTableUpdateCompanionBuilder,
      (MainParty, $$MainPartiesTableReferences),
      MainParty,
      PrefetchHooks Function({bool legalCaseId})
    >;
typedef $$OpposingPartiesTableCreateCompanionBuilder =
    OpposingPartiesCompanion Function({
      Value<int> id,
      required int legalCaseId,
      required String name,
      Value<String?> taxId,
    });
typedef $$OpposingPartiesTableUpdateCompanionBuilder =
    OpposingPartiesCompanion Function({
      Value<int> id,
      Value<int> legalCaseId,
      Value<String> name,
      Value<String?> taxId,
    });

final class $$OpposingPartiesTableReferences
    extends
        BaseReferences<_$AppDatabase, $OpposingPartiesTable, OpposingParty> {
  $$OpposingPartiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LegalCasesTable _legalCaseIdTable(_$AppDatabase db) =>
      db.legalCases.createAlias(
        $_aliasNameGenerator(db.opposingParties.legalCaseId, db.legalCases.id),
      );

  $$LegalCasesTableProcessedTableManager get legalCaseId {
    final $_column = $_itemColumn<int>('legal_case_id')!;

    final manager = $$LegalCasesTableTableManager(
      $_db,
      $_db.legalCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_legalCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OpposingPartiesTableFilterComposer
    extends Composer<_$AppDatabase, $OpposingPartiesTable> {
  $$OpposingPartiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnFilters(column),
  );

  $$LegalCasesTableFilterComposer get legalCaseId {
    final $$LegalCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableFilterComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OpposingPartiesTableOrderingComposer
    extends Composer<_$AppDatabase, $OpposingPartiesTable> {
  $$OpposingPartiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnOrderings(column),
  );

  $$LegalCasesTableOrderingComposer get legalCaseId {
    final $$LegalCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableOrderingComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OpposingPartiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OpposingPartiesTable> {
  $$OpposingPartiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get taxId =>
      $composableBuilder(column: $table.taxId, builder: (column) => column);

  $$LegalCasesTableAnnotationComposer get legalCaseId {
    final $$LegalCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OpposingPartiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OpposingPartiesTable,
          OpposingParty,
          $$OpposingPartiesTableFilterComposer,
          $$OpposingPartiesTableOrderingComposer,
          $$OpposingPartiesTableAnnotationComposer,
          $$OpposingPartiesTableCreateCompanionBuilder,
          $$OpposingPartiesTableUpdateCompanionBuilder,
          (OpposingParty, $$OpposingPartiesTableReferences),
          OpposingParty,
          PrefetchHooks Function({bool legalCaseId})
        > {
  $$OpposingPartiesTableTableManager(
    _$AppDatabase db,
    $OpposingPartiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OpposingPartiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OpposingPartiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OpposingPartiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> legalCaseId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> taxId = const Value.absent(),
              }) => OpposingPartiesCompanion(
                id: id,
                legalCaseId: legalCaseId,
                name: name,
                taxId: taxId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int legalCaseId,
                required String name,
                Value<String?> taxId = const Value.absent(),
              }) => OpposingPartiesCompanion.insert(
                id: id,
                legalCaseId: legalCaseId,
                name: name,
                taxId: taxId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OpposingPartiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({legalCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (legalCaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.legalCaseId,
                                referencedTable:
                                    $$OpposingPartiesTableReferences
                                        ._legalCaseIdTable(db),
                                referencedColumn:
                                    $$OpposingPartiesTableReferences
                                        ._legalCaseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OpposingPartiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OpposingPartiesTable,
      OpposingParty,
      $$OpposingPartiesTableFilterComposer,
      $$OpposingPartiesTableOrderingComposer,
      $$OpposingPartiesTableAnnotationComposer,
      $$OpposingPartiesTableCreateCompanionBuilder,
      $$OpposingPartiesTableUpdateCompanionBuilder,
      (OpposingParty, $$OpposingPartiesTableReferences),
      OpposingParty,
      PrefetchHooks Function({bool legalCaseId})
    >;
typedef $$LegalRepresentativesTableCreateCompanionBuilder =
    LegalRepresentativesCompanion Function({
      Value<int> id,
      required int legalCaseId,
      required String name,
      required String barNumber,
      required String contact,
    });
typedef $$LegalRepresentativesTableUpdateCompanionBuilder =
    LegalRepresentativesCompanion Function({
      Value<int> id,
      Value<int> legalCaseId,
      Value<String> name,
      Value<String> barNumber,
      Value<String> contact,
    });

final class $$LegalRepresentativesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LegalRepresentativesTable,
          LegalRepresentative
        > {
  $$LegalRepresentativesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LegalCasesTable _legalCaseIdTable(_$AppDatabase db) =>
      db.legalCases.createAlias(
        $_aliasNameGenerator(
          db.legalRepresentatives.legalCaseId,
          db.legalCases.id,
        ),
      );

  $$LegalCasesTableProcessedTableManager get legalCaseId {
    final $_column = $_itemColumn<int>('legal_case_id')!;

    final manager = $$LegalCasesTableTableManager(
      $_db,
      $_db.legalCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_legalCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LegalRepresentativesTableFilterComposer
    extends Composer<_$AppDatabase, $LegalRepresentativesTable> {
  $$LegalRepresentativesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barNumber => $composableBuilder(
    column: $table.barNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  $$LegalCasesTableFilterComposer get legalCaseId {
    final $$LegalCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableFilterComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LegalRepresentativesTableOrderingComposer
    extends Composer<_$AppDatabase, $LegalRepresentativesTable> {
  $$LegalRepresentativesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barNumber => $composableBuilder(
    column: $table.barNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  $$LegalCasesTableOrderingComposer get legalCaseId {
    final $$LegalCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableOrderingComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LegalRepresentativesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LegalRepresentativesTable> {
  $$LegalRepresentativesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get barNumber =>
      $composableBuilder(column: $table.barNumber, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  $$LegalCasesTableAnnotationComposer get legalCaseId {
    final $$LegalCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LegalRepresentativesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LegalRepresentativesTable,
          LegalRepresentative,
          $$LegalRepresentativesTableFilterComposer,
          $$LegalRepresentativesTableOrderingComposer,
          $$LegalRepresentativesTableAnnotationComposer,
          $$LegalRepresentativesTableCreateCompanionBuilder,
          $$LegalRepresentativesTableUpdateCompanionBuilder,
          (LegalRepresentative, $$LegalRepresentativesTableReferences),
          LegalRepresentative,
          PrefetchHooks Function({bool legalCaseId})
        > {
  $$LegalRepresentativesTableTableManager(
    _$AppDatabase db,
    $LegalRepresentativesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LegalRepresentativesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LegalRepresentativesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$LegalRepresentativesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> legalCaseId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> barNumber = const Value.absent(),
                Value<String> contact = const Value.absent(),
              }) => LegalRepresentativesCompanion(
                id: id,
                legalCaseId: legalCaseId,
                name: name,
                barNumber: barNumber,
                contact: contact,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int legalCaseId,
                required String name,
                required String barNumber,
                required String contact,
              }) => LegalRepresentativesCompanion.insert(
                id: id,
                legalCaseId: legalCaseId,
                name: name,
                barNumber: barNumber,
                contact: contact,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LegalRepresentativesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({legalCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (legalCaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.legalCaseId,
                                referencedTable:
                                    $$LegalRepresentativesTableReferences
                                        ._legalCaseIdTable(db),
                                referencedColumn:
                                    $$LegalRepresentativesTableReferences
                                        ._legalCaseIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LegalRepresentativesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LegalRepresentativesTable,
      LegalRepresentative,
      $$LegalRepresentativesTableFilterComposer,
      $$LegalRepresentativesTableOrderingComposer,
      $$LegalRepresentativesTableAnnotationComposer,
      $$LegalRepresentativesTableCreateCompanionBuilder,
      $$LegalRepresentativesTableUpdateCompanionBuilder,
      (LegalRepresentative, $$LegalRepresentativesTableReferences),
      LegalRepresentative,
      PrefetchHooks Function({bool legalCaseId})
    >;
typedef $$CaseDatesTableCreateCompanionBuilder =
    CaseDatesCompanion Function({
      Value<int> id,
      required int legalCaseId,
      required DateTime lastMovementDate,
      required DateTime nextDeadline,
      required String deadlineDescription,
      Value<DateTime?> hearingDate,
      Value<String?> hearingType,
    });
typedef $$CaseDatesTableUpdateCompanionBuilder =
    CaseDatesCompanion Function({
      Value<int> id,
      Value<int> legalCaseId,
      Value<DateTime> lastMovementDate,
      Value<DateTime> nextDeadline,
      Value<String> deadlineDescription,
      Value<DateTime?> hearingDate,
      Value<String?> hearingType,
    });

final class $$CaseDatesTableReferences
    extends BaseReferences<_$AppDatabase, $CaseDatesTable, CaseDate> {
  $$CaseDatesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LegalCasesTable _legalCaseIdTable(_$AppDatabase db) =>
      db.legalCases.createAlias(
        $_aliasNameGenerator(db.caseDates.legalCaseId, db.legalCases.id),
      );

  $$LegalCasesTableProcessedTableManager get legalCaseId {
    final $_column = $_itemColumn<int>('legal_case_id')!;

    final manager = $$LegalCasesTableTableManager(
      $_db,
      $_db.legalCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_legalCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CaseDatesTableFilterComposer
    extends Composer<_$AppDatabase, $CaseDatesTable> {
  $$CaseDatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastMovementDate => $composableBuilder(
    column: $table.lastMovementDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDeadline => $composableBuilder(
    column: $table.nextDeadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deadlineDescription => $composableBuilder(
    column: $table.deadlineDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hearingDate => $composableBuilder(
    column: $table.hearingDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hearingType => $composableBuilder(
    column: $table.hearingType,
    builder: (column) => ColumnFilters(column),
  );

  $$LegalCasesTableFilterComposer get legalCaseId {
    final $$LegalCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableFilterComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseDatesTableOrderingComposer
    extends Composer<_$AppDatabase, $CaseDatesTable> {
  $$CaseDatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastMovementDate => $composableBuilder(
    column: $table.lastMovementDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDeadline => $composableBuilder(
    column: $table.nextDeadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deadlineDescription => $composableBuilder(
    column: $table.deadlineDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hearingDate => $composableBuilder(
    column: $table.hearingDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hearingType => $composableBuilder(
    column: $table.hearingType,
    builder: (column) => ColumnOrderings(column),
  );

  $$LegalCasesTableOrderingComposer get legalCaseId {
    final $$LegalCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableOrderingComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseDatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaseDatesTable> {
  $$CaseDatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get lastMovementDate => $composableBuilder(
    column: $table.lastMovementDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextDeadline => $composableBuilder(
    column: $table.nextDeadline,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deadlineDescription => $composableBuilder(
    column: $table.deadlineDescription,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get hearingDate => $composableBuilder(
    column: $table.hearingDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hearingType => $composableBuilder(
    column: $table.hearingType,
    builder: (column) => column,
  );

  $$LegalCasesTableAnnotationComposer get legalCaseId {
    final $$LegalCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseDatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseDatesTable,
          CaseDate,
          $$CaseDatesTableFilterComposer,
          $$CaseDatesTableOrderingComposer,
          $$CaseDatesTableAnnotationComposer,
          $$CaseDatesTableCreateCompanionBuilder,
          $$CaseDatesTableUpdateCompanionBuilder,
          (CaseDate, $$CaseDatesTableReferences),
          CaseDate,
          PrefetchHooks Function({bool legalCaseId})
        > {
  $$CaseDatesTableTableManager(_$AppDatabase db, $CaseDatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseDatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseDatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseDatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> legalCaseId = const Value.absent(),
                Value<DateTime> lastMovementDate = const Value.absent(),
                Value<DateTime> nextDeadline = const Value.absent(),
                Value<String> deadlineDescription = const Value.absent(),
                Value<DateTime?> hearingDate = const Value.absent(),
                Value<String?> hearingType = const Value.absent(),
              }) => CaseDatesCompanion(
                id: id,
                legalCaseId: legalCaseId,
                lastMovementDate: lastMovementDate,
                nextDeadline: nextDeadline,
                deadlineDescription: deadlineDescription,
                hearingDate: hearingDate,
                hearingType: hearingType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int legalCaseId,
                required DateTime lastMovementDate,
                required DateTime nextDeadline,
                required String deadlineDescription,
                Value<DateTime?> hearingDate = const Value.absent(),
                Value<String?> hearingType = const Value.absent(),
              }) => CaseDatesCompanion.insert(
                id: id,
                legalCaseId: legalCaseId,
                lastMovementDate: lastMovementDate,
                nextDeadline: nextDeadline,
                deadlineDescription: deadlineDescription,
                hearingDate: hearingDate,
                hearingType: hearingType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CaseDatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({legalCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (legalCaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.legalCaseId,
                                referencedTable: $$CaseDatesTableReferences
                                    ._legalCaseIdTable(db),
                                referencedColumn: $$CaseDatesTableReferences
                                    ._legalCaseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CaseDatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaseDatesTable,
      CaseDate,
      $$CaseDatesTableFilterComposer,
      $$CaseDatesTableOrderingComposer,
      $$CaseDatesTableAnnotationComposer,
      $$CaseDatesTableCreateCompanionBuilder,
      $$CaseDatesTableUpdateCompanionBuilder,
      (CaseDate, $$CaseDatesTableReferences),
      CaseDate,
      PrefetchHooks Function({bool legalCaseId})
    >;
typedef $$CaseMovementsTableCreateCompanionBuilder =
    CaseMovementsCompanion Function({
      Value<int> id,
      required int legalCaseId,
      required DateTime movementDate,
      required String description,
      required String responsible,
    });
typedef $$CaseMovementsTableUpdateCompanionBuilder =
    CaseMovementsCompanion Function({
      Value<int> id,
      Value<int> legalCaseId,
      Value<DateTime> movementDate,
      Value<String> description,
      Value<String> responsible,
    });

final class $$CaseMovementsTableReferences
    extends BaseReferences<_$AppDatabase, $CaseMovementsTable, CaseMovement> {
  $$CaseMovementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LegalCasesTable _legalCaseIdTable(_$AppDatabase db) =>
      db.legalCases.createAlias(
        $_aliasNameGenerator(db.caseMovements.legalCaseId, db.legalCases.id),
      );

  $$LegalCasesTableProcessedTableManager get legalCaseId {
    final $_column = $_itemColumn<int>('legal_case_id')!;

    final manager = $$LegalCasesTableTableManager(
      $_db,
      $_db.legalCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_legalCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CaseMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $CaseMovementsTable> {
  $$CaseMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get movementDate => $composableBuilder(
    column: $table.movementDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responsible => $composableBuilder(
    column: $table.responsible,
    builder: (column) => ColumnFilters(column),
  );

  $$LegalCasesTableFilterComposer get legalCaseId {
    final $$LegalCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableFilterComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $CaseMovementsTable> {
  $$CaseMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get movementDate => $composableBuilder(
    column: $table.movementDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responsible => $composableBuilder(
    column: $table.responsible,
    builder: (column) => ColumnOrderings(column),
  );

  $$LegalCasesTableOrderingComposer get legalCaseId {
    final $$LegalCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableOrderingComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaseMovementsTable> {
  $$CaseMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get movementDate => $composableBuilder(
    column: $table.movementDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get responsible => $composableBuilder(
    column: $table.responsible,
    builder: (column) => column,
  );

  $$LegalCasesTableAnnotationComposer get legalCaseId {
    final $$LegalCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseMovementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseMovementsTable,
          CaseMovement,
          $$CaseMovementsTableFilterComposer,
          $$CaseMovementsTableOrderingComposer,
          $$CaseMovementsTableAnnotationComposer,
          $$CaseMovementsTableCreateCompanionBuilder,
          $$CaseMovementsTableUpdateCompanionBuilder,
          (CaseMovement, $$CaseMovementsTableReferences),
          CaseMovement,
          PrefetchHooks Function({bool legalCaseId})
        > {
  $$CaseMovementsTableTableManager(_$AppDatabase db, $CaseMovementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseMovementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> legalCaseId = const Value.absent(),
                Value<DateTime> movementDate = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> responsible = const Value.absent(),
              }) => CaseMovementsCompanion(
                id: id,
                legalCaseId: legalCaseId,
                movementDate: movementDate,
                description: description,
                responsible: responsible,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int legalCaseId,
                required DateTime movementDate,
                required String description,
                required String responsible,
              }) => CaseMovementsCompanion.insert(
                id: id,
                legalCaseId: legalCaseId,
                movementDate: movementDate,
                description: description,
                responsible: responsible,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CaseMovementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({legalCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (legalCaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.legalCaseId,
                                referencedTable: $$CaseMovementsTableReferences
                                    ._legalCaseIdTable(db),
                                referencedColumn: $$CaseMovementsTableReferences
                                    ._legalCaseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CaseMovementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaseMovementsTable,
      CaseMovement,
      $$CaseMovementsTableFilterComposer,
      $$CaseMovementsTableOrderingComposer,
      $$CaseMovementsTableAnnotationComposer,
      $$CaseMovementsTableCreateCompanionBuilder,
      $$CaseMovementsTableUpdateCompanionBuilder,
      (CaseMovement, $$CaseMovementsTableReferences),
      CaseMovement,
      PrefetchHooks Function({bool legalCaseId})
    >;
typedef $$CaseDocumentsTableCreateCompanionBuilder =
    CaseDocumentsCompanion Function({
      Value<int> id,
      required int legalCaseId,
      required String documentType,
      required DateTime documentDate,
      Value<String?> notes,
      required String filePath,
    });
typedef $$CaseDocumentsTableUpdateCompanionBuilder =
    CaseDocumentsCompanion Function({
      Value<int> id,
      Value<int> legalCaseId,
      Value<String> documentType,
      Value<DateTime> documentDate,
      Value<String?> notes,
      Value<String> filePath,
    });

final class $$CaseDocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $CaseDocumentsTable, CaseDocument> {
  $$CaseDocumentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LegalCasesTable _legalCaseIdTable(_$AppDatabase db) =>
      db.legalCases.createAlias(
        $_aliasNameGenerator(db.caseDocuments.legalCaseId, db.legalCases.id),
      );

  $$LegalCasesTableProcessedTableManager get legalCaseId {
    final $_column = $_itemColumn<int>('legal_case_id')!;

    final manager = $$LegalCasesTableTableManager(
      $_db,
      $_db.legalCases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_legalCaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CaseDocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $CaseDocumentsTable> {
  $$CaseDocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get documentDate => $composableBuilder(
    column: $table.documentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  $$LegalCasesTableFilterComposer get legalCaseId {
    final $$LegalCasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableFilterComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseDocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CaseDocumentsTable> {
  $$CaseDocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get documentDate => $composableBuilder(
    column: $table.documentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  $$LegalCasesTableOrderingComposer get legalCaseId {
    final $$LegalCasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableOrderingComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseDocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaseDocumentsTable> {
  $$CaseDocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get documentDate => $composableBuilder(
    column: $table.documentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  $$LegalCasesTableAnnotationComposer get legalCaseId {
    final $$LegalCasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.legalCaseId,
      referencedTable: $db.legalCases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LegalCasesTableAnnotationComposer(
            $db: $db,
            $table: $db.legalCases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaseDocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaseDocumentsTable,
          CaseDocument,
          $$CaseDocumentsTableFilterComposer,
          $$CaseDocumentsTableOrderingComposer,
          $$CaseDocumentsTableAnnotationComposer,
          $$CaseDocumentsTableCreateCompanionBuilder,
          $$CaseDocumentsTableUpdateCompanionBuilder,
          (CaseDocument, $$CaseDocumentsTableReferences),
          CaseDocument,
          PrefetchHooks Function({bool legalCaseId})
        > {
  $$CaseDocumentsTableTableManager(_$AppDatabase db, $CaseDocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaseDocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaseDocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaseDocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> legalCaseId = const Value.absent(),
                Value<String> documentType = const Value.absent(),
                Value<DateTime> documentDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> filePath = const Value.absent(),
              }) => CaseDocumentsCompanion(
                id: id,
                legalCaseId: legalCaseId,
                documentType: documentType,
                documentDate: documentDate,
                notes: notes,
                filePath: filePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int legalCaseId,
                required String documentType,
                required DateTime documentDate,
                Value<String?> notes = const Value.absent(),
                required String filePath,
              }) => CaseDocumentsCompanion.insert(
                id: id,
                legalCaseId: legalCaseId,
                documentType: documentType,
                documentDate: documentDate,
                notes: notes,
                filePath: filePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CaseDocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({legalCaseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (legalCaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.legalCaseId,
                                referencedTable: $$CaseDocumentsTableReferences
                                    ._legalCaseIdTable(db),
                                referencedColumn: $$CaseDocumentsTableReferences
                                    ._legalCaseIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CaseDocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaseDocumentsTable,
      CaseDocument,
      $$CaseDocumentsTableFilterComposer,
      $$CaseDocumentsTableOrderingComposer,
      $$CaseDocumentsTableAnnotationComposer,
      $$CaseDocumentsTableCreateCompanionBuilder,
      $$CaseDocumentsTableUpdateCompanionBuilder,
      (CaseDocument, $$CaseDocumentsTableReferences),
      CaseDocument,
      PrefetchHooks Function({bool legalCaseId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LegalCasesTableTableManager get legalCases =>
      $$LegalCasesTableTableManager(_db, _db.legalCases);
  $$MainPartiesTableTableManager get mainParties =>
      $$MainPartiesTableTableManager(_db, _db.mainParties);
  $$OpposingPartiesTableTableManager get opposingParties =>
      $$OpposingPartiesTableTableManager(_db, _db.opposingParties);
  $$LegalRepresentativesTableTableManager get legalRepresentatives =>
      $$LegalRepresentativesTableTableManager(_db, _db.legalRepresentatives);
  $$CaseDatesTableTableManager get caseDates =>
      $$CaseDatesTableTableManager(_db, _db.caseDates);
  $$CaseMovementsTableTableManager get caseMovements =>
      $$CaseMovementsTableTableManager(_db, _db.caseMovements);
  $$CaseDocumentsTableTableManager get caseDocuments =>
      $$CaseDocumentsTableTableManager(_db, _db.caseDocuments);
}
