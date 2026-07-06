class OfficeAssetsDto {
  final int? id;
  final String? name;
  final String? assetCode;
  final String? category;
  final String? serialNumber;
  final String? condition;
  final String? status;
  final String? assignedDate;

  const OfficeAssetsDto({
    this.id,
    this.name,
    this.assetCode,
    this.category,
    this.serialNumber,
    this.condition,
    this.status,
    this.assignedDate,
  });

  factory OfficeAssetsDto.fromJson(Map<String, dynamic> json) {
    return OfficeAssetsDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      assetCode: json['asset_code'] as String?,
      category: json['category'] as String?,
      serialNumber: json['serial_number'] as String?,
      condition: json['condition'] as String?,
      status: json['status'] as String?,
      assignedDate: json['assigned_date'] as String?,
    );
  }


}