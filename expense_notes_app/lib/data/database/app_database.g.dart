// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ExpenseNotesTable extends ExpenseNotes
    with TableInfo<$ExpenseNotesTable, ExpenseNote> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseNotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
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
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creationDateMeta = const VerificationMeta(
    'creationDate',
  );
  @override
  late final GeneratedColumn<DateTime> creationDate = GeneratedColumn<DateTime>(
    'creation_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updateDateMeta = const VerificationMeta(
    'updateDate',
  );
  @override
  late final GeneratedColumn<DateTime> updateDate = GeneratedColumn<DateTime>(
    'update_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receiptPhotoPathMeta = const VerificationMeta(
    'receiptPhotoPath',
  );
  @override
  late final GeneratedColumn<String> receiptPhotoPath = GeneratedColumn<String>(
    'receipt_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationAccuracyMeta = const VerificationMeta(
    'locationAccuracy',
  );
  @override
  late final GeneratedColumn<double> locationAccuracy = GeneratedColumn<double>(
    'location_accuracy',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationTimestampMeta = const VerificationMeta(
    'locationTimestamp',
  );
  @override
  late final GeneratedColumn<DateTime> locationTimestamp =
      GeneratedColumn<DateTime>(
        'location_timestamp',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    title,
    userId,
    status,
    syncStatus,
    creationDate,
    updateDate,
    receiptPhotoPath,
    latitude,
    longitude,
    locationAccuracy,
    locationTimestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseNote> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_syncStatusMeta);
    }
    if (data.containsKey('creation_date')) {
      context.handle(
        _creationDateMeta,
        creationDate.isAcceptableOrUnknown(
          data['creation_date']!,
          _creationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('update_date')) {
      context.handle(
        _updateDateMeta,
        updateDate.isAcceptableOrUnknown(data['update_date']!, _updateDateMeta),
      );
    } else if (isInserting) {
      context.missing(_updateDateMeta);
    }
    if (data.containsKey('receipt_photo_path')) {
      context.handle(
        _receiptPhotoPathMeta,
        receiptPhotoPath.isAcceptableOrUnknown(
          data['receipt_photo_path']!,
          _receiptPhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('location_accuracy')) {
      context.handle(
        _locationAccuracyMeta,
        locationAccuracy.isAcceptableOrUnknown(
          data['location_accuracy']!,
          _locationAccuracyMeta,
        ),
      );
    }
    if (data.containsKey('location_timestamp')) {
      context.handle(
        _locationTimestampMeta,
        locationTimestamp.isAcceptableOrUnknown(
          data['location_timestamp']!,
          _locationTimestampMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ExpenseNote map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseNote(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      creationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creation_date'],
      )!,
      updateDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}update_date'],
      )!,
      receiptPhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_photo_path'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      locationAccuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}location_accuracy'],
      ),
      locationTimestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}location_timestamp'],
      ),
    );
  }

  @override
  $ExpenseNotesTable createAlias(String alias) {
    return $ExpenseNotesTable(attachedDatabase, alias);
  }
}

class ExpenseNote extends DataClass implements Insertable<ExpenseNote> {
  final String uuid;
  final String title;
  final String userId;
  final String status;
  final String syncStatus;
  final DateTime creationDate;
  final DateTime updateDate;
  final String? receiptPhotoPath;
  final double? latitude;
  final double? longitude;
  final double? locationAccuracy;
  final DateTime? locationTimestamp;
  const ExpenseNote({
    required this.uuid,
    required this.title,
    required this.userId,
    required this.status,
    required this.syncStatus,
    required this.creationDate,
    required this.updateDate,
    this.receiptPhotoPath,
    this.latitude,
    this.longitude,
    this.locationAccuracy,
    this.locationTimestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['title'] = Variable<String>(title);
    map['user_id'] = Variable<String>(userId);
    map['status'] = Variable<String>(status);
    map['sync_status'] = Variable<String>(syncStatus);
    map['creation_date'] = Variable<DateTime>(creationDate);
    map['update_date'] = Variable<DateTime>(updateDate);
    if (!nullToAbsent || receiptPhotoPath != null) {
      map['receipt_photo_path'] = Variable<String>(receiptPhotoPath);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || locationAccuracy != null) {
      map['location_accuracy'] = Variable<double>(locationAccuracy);
    }
    if (!nullToAbsent || locationTimestamp != null) {
      map['location_timestamp'] = Variable<DateTime>(locationTimestamp);
    }
    return map;
  }

  ExpenseNotesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseNotesCompanion(
      uuid: Value(uuid),
      title: Value(title),
      userId: Value(userId),
      status: Value(status),
      syncStatus: Value(syncStatus),
      creationDate: Value(creationDate),
      updateDate: Value(updateDate),
      receiptPhotoPath: receiptPhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptPhotoPath),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      locationAccuracy: locationAccuracy == null && nullToAbsent
          ? const Value.absent()
          : Value(locationAccuracy),
      locationTimestamp: locationTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(locationTimestamp),
    );
  }

  factory ExpenseNote.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseNote(
      uuid: serializer.fromJson<String>(json['uuid']),
      title: serializer.fromJson<String>(json['title']),
      userId: serializer.fromJson<String>(json['userId']),
      status: serializer.fromJson<String>(json['status']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      updateDate: serializer.fromJson<DateTime>(json['updateDate']),
      receiptPhotoPath: serializer.fromJson<String?>(json['receiptPhotoPath']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      locationAccuracy: serializer.fromJson<double?>(json['locationAccuracy']),
      locationTimestamp: serializer.fromJson<DateTime?>(
        json['locationTimestamp'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'title': serializer.toJson<String>(title),
      'userId': serializer.toJson<String>(userId),
      'status': serializer.toJson<String>(status),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'updateDate': serializer.toJson<DateTime>(updateDate),
      'receiptPhotoPath': serializer.toJson<String?>(receiptPhotoPath),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'locationAccuracy': serializer.toJson<double?>(locationAccuracy),
      'locationTimestamp': serializer.toJson<DateTime?>(locationTimestamp),
    };
  }

  ExpenseNote copyWith({
    String? uuid,
    String? title,
    String? userId,
    String? status,
    String? syncStatus,
    DateTime? creationDate,
    DateTime? updateDate,
    Value<String?> receiptPhotoPath = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<double?> locationAccuracy = const Value.absent(),
    Value<DateTime?> locationTimestamp = const Value.absent(),
  }) => ExpenseNote(
    uuid: uuid ?? this.uuid,
    title: title ?? this.title,
    userId: userId ?? this.userId,
    status: status ?? this.status,
    syncStatus: syncStatus ?? this.syncStatus,
    creationDate: creationDate ?? this.creationDate,
    updateDate: updateDate ?? this.updateDate,
    receiptPhotoPath: receiptPhotoPath.present
        ? receiptPhotoPath.value
        : this.receiptPhotoPath,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    locationAccuracy: locationAccuracy.present
        ? locationAccuracy.value
        : this.locationAccuracy,
    locationTimestamp: locationTimestamp.present
        ? locationTimestamp.value
        : this.locationTimestamp,
  );
  ExpenseNote copyWithCompanion(ExpenseNotesCompanion data) {
    return ExpenseNote(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      title: data.title.present ? data.title.value : this.title,
      userId: data.userId.present ? data.userId.value : this.userId,
      status: data.status.present ? data.status.value : this.status,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      creationDate: data.creationDate.present
          ? data.creationDate.value
          : this.creationDate,
      updateDate: data.updateDate.present
          ? data.updateDate.value
          : this.updateDate,
      receiptPhotoPath: data.receiptPhotoPath.present
          ? data.receiptPhotoPath.value
          : this.receiptPhotoPath,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      locationAccuracy: data.locationAccuracy.present
          ? data.locationAccuracy.value
          : this.locationAccuracy,
      locationTimestamp: data.locationTimestamp.present
          ? data.locationTimestamp.value
          : this.locationTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseNote(')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('userId: $userId, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('creationDate: $creationDate, ')
          ..write('updateDate: $updateDate, ')
          ..write('receiptPhotoPath: $receiptPhotoPath, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationAccuracy: $locationAccuracy, ')
          ..write('locationTimestamp: $locationTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    title,
    userId,
    status,
    syncStatus,
    creationDate,
    updateDate,
    receiptPhotoPath,
    latitude,
    longitude,
    locationAccuracy,
    locationTimestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseNote &&
          other.uuid == this.uuid &&
          other.title == this.title &&
          other.userId == this.userId &&
          other.status == this.status &&
          other.syncStatus == this.syncStatus &&
          other.creationDate == this.creationDate &&
          other.updateDate == this.updateDate &&
          other.receiptPhotoPath == this.receiptPhotoPath &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.locationAccuracy == this.locationAccuracy &&
          other.locationTimestamp == this.locationTimestamp);
}

class ExpenseNotesCompanion extends UpdateCompanion<ExpenseNote> {
  final Value<String> uuid;
  final Value<String> title;
  final Value<String> userId;
  final Value<String> status;
  final Value<String> syncStatus;
  final Value<DateTime> creationDate;
  final Value<DateTime> updateDate;
  final Value<String?> receiptPhotoPath;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double?> locationAccuracy;
  final Value<DateTime?> locationTimestamp;
  final Value<int> rowid;
  const ExpenseNotesCompanion({
    this.uuid = const Value.absent(),
    this.title = const Value.absent(),
    this.userId = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.updateDate = const Value.absent(),
    this.receiptPhotoPath = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationAccuracy = const Value.absent(),
    this.locationTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseNotesCompanion.insert({
    required String uuid,
    required String title,
    required String userId,
    required String status,
    required String syncStatus,
    required DateTime creationDate,
    required DateTime updateDate,
    this.receiptPhotoPath = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationAccuracy = const Value.absent(),
    this.locationTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       title = Value(title),
       userId = Value(userId),
       status = Value(status),
       syncStatus = Value(syncStatus),
       creationDate = Value(creationDate),
       updateDate = Value(updateDate);
  static Insertable<ExpenseNote> custom({
    Expression<String>? uuid,
    Expression<String>? title,
    Expression<String>? userId,
    Expression<String>? status,
    Expression<String>? syncStatus,
    Expression<DateTime>? creationDate,
    Expression<DateTime>? updateDate,
    Expression<String>? receiptPhotoPath,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? locationAccuracy,
    Expression<DateTime>? locationTimestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (title != null) 'title': title,
      if (userId != null) 'user_id': userId,
      if (status != null) 'status': status,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (creationDate != null) 'creation_date': creationDate,
      if (updateDate != null) 'update_date': updateDate,
      if (receiptPhotoPath != null) 'receipt_photo_path': receiptPhotoPath,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (locationAccuracy != null) 'location_accuracy': locationAccuracy,
      if (locationTimestamp != null) 'location_timestamp': locationTimestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseNotesCompanion copyWith({
    Value<String>? uuid,
    Value<String>? title,
    Value<String>? userId,
    Value<String>? status,
    Value<String>? syncStatus,
    Value<DateTime>? creationDate,
    Value<DateTime>? updateDate,
    Value<String?>? receiptPhotoPath,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<double?>? locationAccuracy,
    Value<DateTime?>? locationTimestamp,
    Value<int>? rowid,
  }) {
    return ExpenseNotesCompanion(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      syncStatus: syncStatus ?? this.syncStatus,
      creationDate: creationDate ?? this.creationDate,
      updateDate: updateDate ?? this.updateDate,
      receiptPhotoPath: receiptPhotoPath ?? this.receiptPhotoPath,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationAccuracy: locationAccuracy ?? this.locationAccuracy,
      locationTimestamp: locationTimestamp ?? this.locationTimestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (updateDate.present) {
      map['update_date'] = Variable<DateTime>(updateDate.value);
    }
    if (receiptPhotoPath.present) {
      map['receipt_photo_path'] = Variable<String>(receiptPhotoPath.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (locationAccuracy.present) {
      map['location_accuracy'] = Variable<double>(locationAccuracy.value);
    }
    if (locationTimestamp.present) {
      map['location_timestamp'] = Variable<DateTime>(locationTimestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseNotesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('userId: $userId, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('creationDate: $creationDate, ')
          ..write('updateDate: $updateDate, ')
          ..write('receiptPhotoPath: $receiptPhotoPath, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationAccuracy: $locationAccuracy, ')
          ..write('locationTimestamp: $locationTimestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpenseLinesTable extends ExpenseLines
    with TableInfo<$ExpenseLinesTable, ExpenseLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteUuidMeta = const VerificationMeta(
    'noteUuid',
  );
  @override
  late final GeneratedColumn<String> noteUuid = GeneratedColumn<String>(
    'note_uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
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
  static const VerificationMeta _categoryUuidMeta = const VerificationMeta(
    'categoryUuid',
  );
  @override
  late final GeneratedColumn<String> categoryUuid = GeneratedColumn<String>(
    'category_uuid',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    noteUuid,
    description,
    categoryUuid,
    quantity,
    unitPrice,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseLine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('note_uuid')) {
      context.handle(
        _noteUuidMeta,
        noteUuid.isAcceptableOrUnknown(data['note_uuid']!, _noteUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_noteUuidMeta);
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
    if (data.containsKey('category_uuid')) {
      context.handle(
        _categoryUuidMeta,
        categoryUuid.isAcceptableOrUnknown(
          data['category_uuid']!,
          _categoryUuidMeta,
        ),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ExpenseLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseLine(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      noteUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_uuid'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      categoryUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_uuid'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      )!,
    );
  }

  @override
  $ExpenseLinesTable createAlias(String alias) {
    return $ExpenseLinesTable(attachedDatabase, alias);
  }
}

class ExpenseLine extends DataClass implements Insertable<ExpenseLine> {
  final String uuid;
  final String noteUuid;
  final String description;
  final String? categoryUuid;
  final double quantity;
  final double unitPrice;
  const ExpenseLine({
    required this.uuid,
    required this.noteUuid,
    required this.description,
    this.categoryUuid,
    required this.quantity,
    required this.unitPrice,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['note_uuid'] = Variable<String>(noteUuid);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || categoryUuid != null) {
      map['category_uuid'] = Variable<String>(categoryUuid);
    }
    map['quantity'] = Variable<double>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    return map;
  }

  ExpenseLinesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseLinesCompanion(
      uuid: Value(uuid),
      noteUuid: Value(noteUuid),
      description: Value(description),
      categoryUuid: categoryUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryUuid),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
    );
  }

  factory ExpenseLine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseLine(
      uuid: serializer.fromJson<String>(json['uuid']),
      noteUuid: serializer.fromJson<String>(json['noteUuid']),
      description: serializer.fromJson<String>(json['description']),
      categoryUuid: serializer.fromJson<String?>(json['categoryUuid']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'noteUuid': serializer.toJson<String>(noteUuid),
      'description': serializer.toJson<String>(description),
      'categoryUuid': serializer.toJson<String?>(categoryUuid),
      'quantity': serializer.toJson<double>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
    };
  }

  ExpenseLine copyWith({
    String? uuid,
    String? noteUuid,
    String? description,
    Value<String?> categoryUuid = const Value.absent(),
    double? quantity,
    double? unitPrice,
  }) => ExpenseLine(
    uuid: uuid ?? this.uuid,
    noteUuid: noteUuid ?? this.noteUuid,
    description: description ?? this.description,
    categoryUuid: categoryUuid.present ? categoryUuid.value : this.categoryUuid,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
  );
  ExpenseLine copyWithCompanion(ExpenseLinesCompanion data) {
    return ExpenseLine(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      noteUuid: data.noteUuid.present ? data.noteUuid.value : this.noteUuid,
      description: data.description.present
          ? data.description.value
          : this.description,
      categoryUuid: data.categoryUuid.present
          ? data.categoryUuid.value
          : this.categoryUuid,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseLine(')
          ..write('uuid: $uuid, ')
          ..write('noteUuid: $noteUuid, ')
          ..write('description: $description, ')
          ..write('categoryUuid: $categoryUuid, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    noteUuid,
    description,
    categoryUuid,
    quantity,
    unitPrice,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseLine &&
          other.uuid == this.uuid &&
          other.noteUuid == this.noteUuid &&
          other.description == this.description &&
          other.categoryUuid == this.categoryUuid &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice);
}

class ExpenseLinesCompanion extends UpdateCompanion<ExpenseLine> {
  final Value<String> uuid;
  final Value<String> noteUuid;
  final Value<String> description;
  final Value<String?> categoryUuid;
  final Value<double> quantity;
  final Value<double> unitPrice;
  final Value<int> rowid;
  const ExpenseLinesCompanion({
    this.uuid = const Value.absent(),
    this.noteUuid = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryUuid = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseLinesCompanion.insert({
    required String uuid,
    required String noteUuid,
    required String description,
    this.categoryUuid = const Value.absent(),
    required double quantity,
    required double unitPrice,
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       noteUuid = Value(noteUuid),
       description = Value(description),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice);
  static Insertable<ExpenseLine> custom({
    Expression<String>? uuid,
    Expression<String>? noteUuid,
    Expression<String>? description,
    Expression<String>? categoryUuid,
    Expression<double>? quantity,
    Expression<double>? unitPrice,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (noteUuid != null) 'note_uuid': noteUuid,
      if (description != null) 'description': description,
      if (categoryUuid != null) 'category_uuid': categoryUuid,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseLinesCompanion copyWith({
    Value<String>? uuid,
    Value<String>? noteUuid,
    Value<String>? description,
    Value<String?>? categoryUuid,
    Value<double>? quantity,
    Value<double>? unitPrice,
    Value<int>? rowid,
  }) {
    return ExpenseLinesCompanion(
      uuid: uuid ?? this.uuid,
      noteUuid: noteUuid ?? this.noteUuid,
      description: description ?? this.description,
      categoryUuid: categoryUuid ?? this.categoryUuid,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (noteUuid.present) {
      map['note_uuid'] = Variable<String>(noteUuid.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categoryUuid.present) {
      map['category_uuid'] = Variable<String>(categoryUuid.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseLinesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('noteUuid: $noteUuid, ')
          ..write('description: $description, ')
          ..write('categoryUuid: $categoryUuid, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [uuid, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final String uuid;
  final String name;
  const Category({required this.uuid, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(uuid: Value(uuid), name: Value(name));
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({String? uuid, String? name}) =>
      Category(uuid: uuid ?? this.uuid, name: name ?? this.name);
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('uuid: $uuid, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.uuid == this.uuid && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String uuid,
    required String name,
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? uuid,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExpenseNotesTable expenseNotes = $ExpenseNotesTable(this);
  late final $ExpenseLinesTable expenseLines = $ExpenseLinesTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    expenseNotes,
    expenseLines,
    categories,
  ];
}

typedef $$ExpenseNotesTableCreateCompanionBuilder =
    ExpenseNotesCompanion Function({
      required String uuid,
      required String title,
      required String userId,
      required String status,
      required String syncStatus,
      required DateTime creationDate,
      required DateTime updateDate,
      Value<String?> receiptPhotoPath,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> locationAccuracy,
      Value<DateTime?> locationTimestamp,
      Value<int> rowid,
    });
typedef $$ExpenseNotesTableUpdateCompanionBuilder =
    ExpenseNotesCompanion Function({
      Value<String> uuid,
      Value<String> title,
      Value<String> userId,
      Value<String> status,
      Value<String> syncStatus,
      Value<DateTime> creationDate,
      Value<DateTime> updateDate,
      Value<String?> receiptPhotoPath,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> locationAccuracy,
      Value<DateTime?> locationTimestamp,
      Value<int> rowid,
    });

class $$ExpenseNotesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseNotesTable> {
  $$ExpenseNotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get creationDate => $composableBuilder(
    column: $table.creationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptPhotoPath => $composableBuilder(
    column: $table.receiptPhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get locationAccuracy => $composableBuilder(
    column: $table.locationAccuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get locationTimestamp => $composableBuilder(
    column: $table.locationTimestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpenseNotesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseNotesTable> {
  $$ExpenseNotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get creationDate => $composableBuilder(
    column: $table.creationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptPhotoPath => $composableBuilder(
    column: $table.receiptPhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get locationAccuracy => $composableBuilder(
    column: $table.locationAccuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get locationTimestamp => $composableBuilder(
    column: $table.locationTimestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpenseNotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseNotesTable> {
  $$ExpenseNotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get creationDate => $composableBuilder(
    column: $table.creationDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updateDate => $composableBuilder(
    column: $table.updateDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receiptPhotoPath => $composableBuilder(
    column: $table.receiptPhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get locationAccuracy => $composableBuilder(
    column: $table.locationAccuracy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get locationTimestamp => $composableBuilder(
    column: $table.locationTimestamp,
    builder: (column) => column,
  );
}

class $$ExpenseNotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseNotesTable,
          ExpenseNote,
          $$ExpenseNotesTableFilterComposer,
          $$ExpenseNotesTableOrderingComposer,
          $$ExpenseNotesTableAnnotationComposer,
          $$ExpenseNotesTableCreateCompanionBuilder,
          $$ExpenseNotesTableUpdateCompanionBuilder,
          (
            ExpenseNote,
            BaseReferences<_$AppDatabase, $ExpenseNotesTable, ExpenseNote>,
          ),
          ExpenseNote,
          PrefetchHooks Function()
        > {
  $$ExpenseNotesTableTableManager(_$AppDatabase db, $ExpenseNotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseNotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseNotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseNotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime> creationDate = const Value.absent(),
                Value<DateTime> updateDate = const Value.absent(),
                Value<String?> receiptPhotoPath = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> locationAccuracy = const Value.absent(),
                Value<DateTime?> locationTimestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpenseNotesCompanion(
                uuid: uuid,
                title: title,
                userId: userId,
                status: status,
                syncStatus: syncStatus,
                creationDate: creationDate,
                updateDate: updateDate,
                receiptPhotoPath: receiptPhotoPath,
                latitude: latitude,
                longitude: longitude,
                locationAccuracy: locationAccuracy,
                locationTimestamp: locationTimestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String title,
                required String userId,
                required String status,
                required String syncStatus,
                required DateTime creationDate,
                required DateTime updateDate,
                Value<String?> receiptPhotoPath = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> locationAccuracy = const Value.absent(),
                Value<DateTime?> locationTimestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpenseNotesCompanion.insert(
                uuid: uuid,
                title: title,
                userId: userId,
                status: status,
                syncStatus: syncStatus,
                creationDate: creationDate,
                updateDate: updateDate,
                receiptPhotoPath: receiptPhotoPath,
                latitude: latitude,
                longitude: longitude,
                locationAccuracy: locationAccuracy,
                locationTimestamp: locationTimestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpenseNotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseNotesTable,
      ExpenseNote,
      $$ExpenseNotesTableFilterComposer,
      $$ExpenseNotesTableOrderingComposer,
      $$ExpenseNotesTableAnnotationComposer,
      $$ExpenseNotesTableCreateCompanionBuilder,
      $$ExpenseNotesTableUpdateCompanionBuilder,
      (
        ExpenseNote,
        BaseReferences<_$AppDatabase, $ExpenseNotesTable, ExpenseNote>,
      ),
      ExpenseNote,
      PrefetchHooks Function()
    >;
typedef $$ExpenseLinesTableCreateCompanionBuilder =
    ExpenseLinesCompanion Function({
      required String uuid,
      required String noteUuid,
      required String description,
      Value<String?> categoryUuid,
      required double quantity,
      required double unitPrice,
      Value<int> rowid,
    });
typedef $$ExpenseLinesTableUpdateCompanionBuilder =
    ExpenseLinesCompanion Function({
      Value<String> uuid,
      Value<String> noteUuid,
      Value<String> description,
      Value<String?> categoryUuid,
      Value<double> quantity,
      Value<double> unitPrice,
      Value<int> rowid,
    });

class $$ExpenseLinesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseLinesTable> {
  $$ExpenseLinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteUuid => $composableBuilder(
    column: $table.noteUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryUuid => $composableBuilder(
    column: $table.categoryUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpenseLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseLinesTable> {
  $$ExpenseLinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteUuid => $composableBuilder(
    column: $table.noteUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryUuid => $composableBuilder(
    column: $table.categoryUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpenseLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseLinesTable> {
  $$ExpenseLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get noteUuid =>
      $composableBuilder(column: $table.noteUuid, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryUuid => $composableBuilder(
    column: $table.categoryUuid,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);
}

class $$ExpenseLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseLinesTable,
          ExpenseLine,
          $$ExpenseLinesTableFilterComposer,
          $$ExpenseLinesTableOrderingComposer,
          $$ExpenseLinesTableAnnotationComposer,
          $$ExpenseLinesTableCreateCompanionBuilder,
          $$ExpenseLinesTableUpdateCompanionBuilder,
          (
            ExpenseLine,
            BaseReferences<_$AppDatabase, $ExpenseLinesTable, ExpenseLine>,
          ),
          ExpenseLine,
          PrefetchHooks Function()
        > {
  $$ExpenseLinesTableTableManager(_$AppDatabase db, $ExpenseLinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> noteUuid = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> categoryUuid = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpenseLinesCompanion(
                uuid: uuid,
                noteUuid: noteUuid,
                description: description,
                categoryUuid: categoryUuid,
                quantity: quantity,
                unitPrice: unitPrice,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String noteUuid,
                required String description,
                Value<String?> categoryUuid = const Value.absent(),
                required double quantity,
                required double unitPrice,
                Value<int> rowid = const Value.absent(),
              }) => ExpenseLinesCompanion.insert(
                uuid: uuid,
                noteUuid: noteUuid,
                description: description,
                categoryUuid: categoryUuid,
                quantity: quantity,
                unitPrice: unitPrice,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpenseLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseLinesTable,
      ExpenseLine,
      $$ExpenseLinesTableFilterComposer,
      $$ExpenseLinesTableOrderingComposer,
      $$ExpenseLinesTableAnnotationComposer,
      $$ExpenseLinesTableCreateCompanionBuilder,
      $$ExpenseLinesTableUpdateCompanionBuilder,
      (
        ExpenseLine,
        BaseReferences<_$AppDatabase, $ExpenseLinesTable, ExpenseLine>,
      ),
      ExpenseLine,
      PrefetchHooks Function()
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String uuid,
      required String name,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> uuid,
      Value<String> name,
      Value<int> rowid,
    });

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
          Category,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(uuid: uuid, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String uuid,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                uuid: uuid,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
      Category,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExpenseNotesTableTableManager get expenseNotes =>
      $$ExpenseNotesTableTableManager(_db, _db.expenseNotes);
  $$ExpenseLinesTableTableManager get expenseLines =>
      $$ExpenseLinesTableTableManager(_db, _db.expenseLines);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
}
