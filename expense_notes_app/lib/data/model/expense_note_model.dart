class ExpenseNoteModel {
  final String uuid;
  final String title;
  final String userId;
  final double totalAmount;
  final String status;
  final String syncStatus;
  final DateTime creationDate;
  final DateTime updateDate;
  final String? receiptPhotoPath;
  final double? latitude;
  final double? longitude;
  final double? locationAccuracy;
  final DateTime? locationTimestamp;

  ExpenseNoteModel({
    required this.uuid,
    required this.title,
    required this.userId,
    this.totalAmount = 0.0,
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

  factory ExpenseNoteModel.fromMap(Map<String, dynamic> map) {
    return ExpenseNoteModel(
      uuid: map['uuid'],
      title: map['title'],
      userId: map['user_id'],
      totalAmount: 0.0,
      status: map['status'],
      syncStatus: map['sync_status'],
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creation_date']),
      updateDate: DateTime.fromMillisecondsSinceEpoch(map['update_date']),
      receiptPhotoPath: map['receipt_photo_path'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      locationAccuracy: map['location_accuracy'],
      locationTimestamp: map['location_timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['location_timestamp'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'user_id': userId,
      'total_amount': totalAmount,
      'status': status,
      'sync_status': syncStatus,
      'creation_date': creationDate.millisecondsSinceEpoch,
      'update_date': updateDate.millisecondsSinceEpoch,
      'receipt_photo_path': receiptPhotoPath,
      'latitude': latitude,
      'longitude': longitude,
      'location_accuracy': locationAccuracy,
      'location_timestamp':
          locationTimestamp?.millisecondsSinceEpoch, // Handle null case
    };
  }

  ExpenseNoteModel copyWith({double? totalAmount}) {
    return ExpenseNoteModel(
      uuid: uuid,
      title: title,
      userId: userId,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status,
      syncStatus: syncStatus,
      creationDate: creationDate,
      updateDate: updateDate,
      receiptPhotoPath: receiptPhotoPath,
      latitude: latitude,
      longitude: longitude,
      locationAccuracy: locationAccuracy,
      locationTimestamp: locationTimestamp,
    );
  }
}
