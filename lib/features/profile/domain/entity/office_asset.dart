import 'package:equatable/equatable.dart';

enum WarrantyStatus {
  active,
  expired,
  off;
}

class OfficeAsset extends Equatable {
  final int id;
  final String name;
  final String? brand;
  final String? model;
  final String serialNumber;
  final String? assetCode;
  final WarrantyStatus warrantyStatus;
  final String? condition;
  final String? status;
  final DateTime? warrantyExpireDate;
  final DateTime receivedOn;
  final String? imageUrl;
  final String? description;
  final String? category;

  const OfficeAsset({
    required this.id,
    required this.name,
    required this.serialNumber,
    required this.receivedOn,
    this.brand,
    this.model,
    this.assetCode,
    this.warrantyStatus = WarrantyStatus.off,
    this.warrantyExpireDate,
    this.imageUrl,
    this.description,
    this.category,
    this.condition,
    this.status,
  });

  static const months =[
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  /// Formatted received date: "14 September 2020"
  String get formattedReceivedDate {
    return '${receivedOn.day} ${months[receivedOn.month - 1]} ${receivedOn.year}';
  }

  String get fullName {
    if (model != null && model!.isNotEmpty) {
      return '$name $model';
    }
    return name;
  }

  @override
  List<Object?> get props => [
    id,
    name,
    brand,
    model,
    serialNumber,
    warrantyStatus,
    warrantyExpireDate,
    receivedOn,
    imageUrl,
    description,
    category,
    condition,
    status,
  ];
}