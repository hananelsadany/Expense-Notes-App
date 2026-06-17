import 'expense_line_model.dart';
import 'package:drift/drift.dart';
import '../database/app_database.dart';

class ExpenseNoteModel {
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
  final double totalAmount;
  final List<ExpenseLineModel> lines;

  const ExpenseNoteModel({
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
    this.totalAmount = 0.0,
    this.lines = const [],
  });

  factory ExpenseNoteModel.fromJson(Map<String, dynamic> json) {
    final lines = (json['lines'] as List? ?? [])
        .map((l) => ExpenseLineModel.fromJson(l))
        .toList();

    final total = lines.fold(0.0, (sum, l) => sum + l.lineTotal);

    return ExpenseNoteModel(
      uuid: json['uuid'],
      title: json['title'],
      userId: json['user_id'],
      status: json['status'],
      syncStatus: json['sync_status'],
      creationDate: DateTime.parse(json['creation_date']),
      updateDate: DateTime.parse(json['update_date']),
      receiptPhotoPath: json['receipt_photo_path'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locationAccuracy: (json['location_accuracy'] as num?)?.toDouble(),
      locationTimestamp: json['location_timestamp'] != null
          ? DateTime.parse(json['location_timestamp'])
          : null,
      totalAmount: total,
      lines: lines,
    );
  }

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'title': title,
    'user_id': userId,
    'status': status,
    'sync_status': syncStatus,
    'creation_date': creationDate.toIso8601String(),
    'update_date': updateDate.toIso8601String(),
    'receipt_photo_path': receiptPhotoPath,
    'latitude': latitude,
    'longitude': longitude,
    'location_accuracy': locationAccuracy,
    'location_timestamp': locationTimestamp?.toIso8601String(),
    'lines': lines.map((l) => l.toJson()).toList(),
  };

  ExpenseNoteModel copyWith({
    String? uuid,
    String? title,
    String? userId,
    String? status,
    String? syncStatus,
    DateTime? creationDate,
    DateTime? updateDate,
    String? receiptPhotoPath,
    double? latitude,
    double? longitude,
    double? locationAccuracy,
    DateTime? locationTimestamp,
    double? totalAmount,
    List<ExpenseLineModel>? lines,
  }) {
    return ExpenseNoteModel(
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
      totalAmount: totalAmount ?? this.totalAmount,
      lines: lines ?? this.lines,
    );
  }

  ExpenseNotesCompanion toCompanion() {
    return ExpenseNotesCompanion(
      uuid: Value(uuid),
      title: Value(title),
      userId: Value(userId),
      status: Value(status),
      syncStatus: Value(syncStatus),
      creationDate: Value(creationDate),
      updateDate: Value(updateDate),
      receiptPhotoPath: Value(receiptPhotoPath),
      latitude: Value(latitude),
      longitude: Value(longitude),
      locationAccuracy: Value(locationAccuracy),
      locationTimestamp: Value(locationTimestamp),
    );
  }
}
