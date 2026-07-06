import 'package:easy_localization/easy_localization.dart';

import '../../domain/entity/gender.dart';
import '../../domain/entity/office_asset.dart';

extension GenderExtension on Gender {
  String toDisplayString() {
    switch (this) {
      case Gender.male:
        return 'male'.tr();
      case Gender.female:
        return 'female'.tr();
      case Gender.unspecified:
        return 'unspecified'.tr();
    }
  }
}

extension WarrantyStatusExtension on WarrantyStatus{
  String toDisplayString() {
    switch (this) {
      case WarrantyStatus.active:
        return 'active'.tr();
      case WarrantyStatus.expired:
        return 'expired'.tr();
      case WarrantyStatus.off:
        return 'off'.tr();
    }
  }
}