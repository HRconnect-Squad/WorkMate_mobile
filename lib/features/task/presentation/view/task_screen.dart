import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/presentation/design_system/components/custom_status_bar.dart';
import '../../../../core/presentation/design_system/components/header_banner.dart';
import '../../../../core/presentation/design_system/components/property_good_poor.dart';
import '../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../core/presentation/design_system/components/task_card.dart';
import '../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../core/presentation/routes/route_names.dart';
import '../login/task_cubit.dart';
import '../login/task_state.dart';
import 'card_empty_state.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.gray50,
        body: BlocConsumer<TaskCubit, TaskState>(
          listenWhen: (prev, curr) =>
          curr.apiError != null && prev.apiError != curr.apiError,
          listener: (context, state) {
            SnackBarHelper.showError(context, state.apiError!);
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height * 0.37,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: height * 0.22,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ExtensionColors.kButtonBackgroundPrimary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        HeaderBanner(
                          title: 'challenges_awaiting'.tr(),
                          subtitle: 'let_tackle_your_todo_list'.tr(),
                          image: AppAssets.kTaskScreenBanner,
                          paddingRight: 24,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 12,
                          right: 12,
                          child: SummaryCard(
                            cardMargin: EdgeInsets.zero,
                            title: 'summary_of_your_work'.tr(),
                            subtitle: 'your_current_task_progress'.tr(),
                            items: [
                              StateItemModel(
                                label: 'todo'.tr(),
                                value: state.todoCount.toString(),
                                icon: SvgPicture.asset(AppAssets.todo,
                                    height: 22, width: 22),
                              ),
                              StateItemModel(
                                label: 'in_progress'.tr(),
                                value: state.inProgressCount.toString(),
                                icon: SvgPicture.asset(AppAssets.inProgress,
                                    height: 22, width: 22),
                              ),
                              StateItemModel(
                                label: 'done'.tr(),
                                value: state.doneCount.toString(),
                                icon: SvgPicture.asset(AppAssets.done,
                                    height: 22, width: 22),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PropertyGoodPoor(status: BurnoutStatus.good),
                        const SizedBox(height: 15),
                        TaskStatusBarFactory.create(
                          selected: state.selectedStatus,
                          onChanged: (val) =>
                              context.read<TaskCubit>().onStatusChanged(val),
                          allCount: state.todoCount,
                          inProgressCount: state.inProgressCount,
                          finishCount: state.doneCount,
                        ),
                        const SizedBox(height: 10),
                        _TaskListSection(state: state),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TaskListSection extends StatelessWidget {
  final TaskState state;
  const _TaskListSection({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.filteredTasks.isEmpty) {
      return CardEmptyState(
        title: 'today_task'.tr(),
        subtitle: 'task_sub'.tr(),
        imgPath: AppAssets.noTasksAssigned,
        imgtitle: 'no_task'.tr(),
        imgDescription: 'no_task_des'.tr(),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.filteredTasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final task = state.filteredTasks[index];
        return GestureDetector(
          onTap: () =>context.pushNamed(
            RouteNames.taskDetail,
            extra: task,
          ),
          child: TaskCardItem(taskState: task),
        );
      },
    );
  }
}