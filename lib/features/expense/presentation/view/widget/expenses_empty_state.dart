import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/components/empty_state_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../domain/entity/expense_category.dart';

class ExpensesEmptyState extends StatelessWidget {
  final ExpenseStatus? status;

  const ExpensesEmptyState({super.key, this.status});

  String get _title {
    return switch (status) {
      ExpenseStatus.pending => 'No expenses under review',
      ExpenseStatus.approved => 'No approved expenses yet',
      ExpenseStatus.rejected => 'No rejected expenses',
      null => 'No expenses found',
    };
  }

  String get _description {
    return switch (status) {
      ExpenseStatus.pending =>
      'Submit a new expense claim using the button below.',
      ExpenseStatus.approved =>
      'Your approved expenses will appear here.',
      ExpenseStatus.rejected =>
      'Your rejected expenses will appear here.',
      null => 'Your expense claims will appear here.',
    };
  }

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      imgPath: AppAssets.emptyExpenseState,
      imgtitle: _title,
      imgDescription: _description,
    );
  }
}