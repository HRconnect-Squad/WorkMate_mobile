import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../core/presentation/design_system/components/home_banner.dart';
import '../../../../core/presentation/design_system/components/today_meeting.dart';
import '../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../core/presentation/routes/route_names.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import '../mapper/home_mapper.dart';
import 'widget/home_tasks_section.dart';
import 'widget/meeting_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (prev, curr) =>
          curr.error != null && prev.error != curr.error,
      listener: (context, state) => SnackBarHelper.showError(context, state.error!),
      builder: (context, state) {
        final profile = state.profile;
        return Scaffold(
          backgroundColor: context.colors.gray50,
          appBar: CustomAppBar.profile(
            showBackButton: false,
            profileName: profile?.fullName ?? '',
            profileJobTitle: profile?.jobTitle ?? '',
            profileAvatarUrl: profile?.profileImage,
            isVerified: profile?.isActive ?? false,
            chatUnreadCount: state.unreadMessages,
            bellUnreadCount: state.unreadNotifications,
            onProfilePressed: () => context.push(RouteNames.profile),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state.isLoading && state.profile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().refresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.gray200
            ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: HomeBanner(
                  title: 'my_work_summary',
                  subtitle: 'work_summary_subtitle',
                  image: AppAssets.workSummary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: TodayMeeting(
                    meetings: state.meetings.map(HomeMapper.toMeetingModel).toList(),
                    onJoin: (meeting) => openMeetingLink(context, meeting.joinLink),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                    decoration: BoxDecoration(
                      color: context.colors.surfaceLow,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: HomeTasksSection(tasks: state.tasks, taskCount: state.taskCount)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
