import '../../../../core/data/util/parsing.dart';
import '../../domain/entity/office_asset.dart';
import '../datasource/remote/dto/response/office_assets_dto.dart';

class OfficeAssetsMapper {
  const OfficeAssetsMapper._();

  static OfficeAsset toDomain(OfficeAssetsDto dto) {
    return OfficeAsset(
      id: dto.id ?? 0,
      name: dto.name ?? '',
      assetCode: dto.assetCode ?? '',
      category: dto.category ?? '',
      serialNumber: dto.serialNumber ?? '',
      condition: dto.condition ?? '',
      status: dto.status ?? '',
      receivedOn: DataFormat.parseDate(dto.assignedDate) ?? DateTime.now(),
    );
  }
}
