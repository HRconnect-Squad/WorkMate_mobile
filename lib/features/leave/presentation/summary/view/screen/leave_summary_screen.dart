import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../../../domain/entity/leave.dart';
import '../../../../domain/entity/leave_status.dart';
import '../../logic/leave_summary_cubit.dart';
import '../../logic/leave_summary_state.dart';
import '../widget/leave_empty_state.dart';
import '../widget/leave_header.dart';
import '../widget/leave_request_card.dart';
import '../widget/leave_tab_filter.dart';
import 'package:go_router/go_router.dart';

class LeaveSummaryScreen extends StatelessWidget {
  const LeaveSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<LeaveSummaryCubit, LeaveSummaryState>(
        listenWhen: (previous, current) => current.error != null && current.error != previous.error,
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<LeaveSummaryCubit>().clearError();
          }
        },
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                child: _buildBody(context, state),
                ),
                _buildFloatingButton(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, LeaveSummaryState state) {
    final cubit = context.read<LeaveSummaryCubit>();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: LeaveHeader(state: state)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: LeaveTabFilter(
              selectedStatus: state.selectedStatus,
              pendingCount: (state.requestsByStatus[LeaveStatus.pending] ?? []).length,
              rejectedCount: (state.requestsByStatus[LeaveStatus.rejected] ?? []).length,
              onTabChanged: cubit.onTabChanged,
            ),
          ),
        ),
        ..._buildListSection(context, state, cubit),
        //const SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }

  List<Widget> _buildListSection(BuildContext context, LeaveSummaryState state, LeaveSummaryCubit cubit) {
    if (state.isLoadingRequests && !state.hasLoadedCurrentTab) {
      return [const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))];
    }

    if (state.currentRequests.isEmpty) {
      return [SliverFillRemaining(hasScrollBody: false, child: LeaveEmptyState(status: state.selectedStatus))];
    }

    return [
      SliverList.builder(
        itemCount: state.currentRequests.length,
        itemBuilder: (context, index) {
          final request = state.currentRequests[index];
          return LeaveRequestCard(
            request: request,
            onCancel: request.isCancellable ? () => _onCancelTap(context, request) : null,
          );
        },
      ),
    ];
  }

  Widget _buildFloatingButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, -4))],
      ),
      child: SafeArea(
        top: false,
        child: CustomPrimaryButton.gradient(
          height: 48,
          borderRadius: 100,
          buttonText: 'submit_leave'.tr(),
          onPressed: () => _onSubmitLeaveTap(context),
        ),
      ),
    );
  }

  Future<void> _onSubmitLeaveTap(BuildContext context) async {
    final result = await context.push<bool>(RouteNames.submitLeave);
    if (result == true && context.mounted) {
      context.read<LeaveSummaryCubit>().refresh();
    }
  }

  void _onCancelTap(BuildContext context, Leave request) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('cancel_leave_request'.tr()),
        content: Text('cancel_leave_confirmation'.tr()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: Text('no'.tr())),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<LeaveSummaryCubit>().cancelRequest(request.id);
            },
            child: Text('yes_cancel'.tr(), style: TextStyle(color: context.colors.error)),
          ),
        ],
      ),
    );
  }
}