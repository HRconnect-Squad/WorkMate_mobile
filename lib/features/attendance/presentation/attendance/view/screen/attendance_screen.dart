import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/attendance_history_card.dart';
import '../../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/attendance_screen_cubit.dart';
import '../../logic/attendance_screen_state.dart';
import '../widget/attendance_history_empty_state.dart';
import '../widget/clock_in_banner.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AttendanceScreenCubit>();

    return BlocListener<AttendanceScreenCubit, AttendanceScreenState>(
      listenWhen: (previous, current) =>
          current.apiError != null && current.apiError != previous.apiError,
      listener: (context, state) {
        SnackBarHelper.showError(context, state.apiError!);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: context.colors.gray100,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<AttendanceScreenCubit, AttendanceScreenState>(
                  buildWhen: (previous, current) =>
                      previous.attendanceStatus != current.attendanceStatus ||
                      previous.payPeriodWorkingHours !=
                          current.payPeriodWorkingHours,
                  builder: (context, state) {
                    return ClockInBanner(
                      attendanceScreenCubit: cubit,
                      attendanceScreenState: state,

                      onClockInPressed: () {
                        context.push(RouteNames.clockInMap);
                      },

                      onClockOutPressed: () {
                        cubit.clockOutAttendance();
                      },

                      onBreakPressed: () {
                        cubit.startAttendanceBreak();
                      },

                      onBackToWorkPressed: () async {
                        cubit.endAttendanceBreak();
                      },
                    );
                  },
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                sliver: BlocBuilder<AttendanceScreenCubit, AttendanceScreenState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading ||
                      previous.historyAttendanceCard !=
                          current.historyAttendanceCard,
                  builder: (context, state) => _buildHistorySliver(context, state),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistorySliver(
    BuildContext context,
    AttendanceScreenState state,
  ) {
    if (state.isLoading) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.historyAttendanceCard.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: const AttendanceHistoryEmptyState(),
      );
    }

    return SliverList.separated(
      itemCount: state.historyAttendanceCard.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final card = state.historyAttendanceCard[index];
        return AttendanceHistoryCard(
          historyCardModel: HistoryCardModel(
            id: card.id,
            date: card.date,
            headerIcon: Iconsax.calendar_1,
            headerIconColor: context.colors.purple500,
            infoItems: card.infoItems,
          ),
          onTap: () {
            context.pushNamed(
              RouteNames.attendanceDetailsName,
              pathParameters: {'id': card.id},
            );
          },
        );
      },
    );
  }
}
