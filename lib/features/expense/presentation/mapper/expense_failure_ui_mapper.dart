import 'package:easy_localization/easy_localization.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/presentation/mapper/failure_ui_mapper.dart';
import '../../domain/failure/expense_failure.dart';

class ExpenseFailureUiMapper {
  const ExpenseFailureUiMapper._();

  static String map(Failure failure) {
    return switch (failure) {
      ExpenseAlreadyProcessedFailure() => 'expense_already_processed_error'.tr(),
      ExpenseNotFoundFailure() => 'expense_not_found_error'.tr(),
      _ => FailureUiMapper.map(failure),
    };
  }
}