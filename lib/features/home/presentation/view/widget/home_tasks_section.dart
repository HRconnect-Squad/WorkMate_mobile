import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/presentation/design_system/components/card_header.dart';
import '../../../../../core/presentation/design_system/components/task_card.dart';
import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../core/presentation/routes/route_names.dart';
import '../../../../task/domain/entity/task_entity.dart';
import '../../../../task/presentation/mapper/task_mapper.dart';

class HomeTasksSection extends StatelessWidget {
  final List<TaskEntity> tasks;
  final int taskCount;

  const HomeTasksSection({
    super.key,
    required this.tasks,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: const TaskCardItem(),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: CardHeader(
              title: 'today_task'.tr(),
              subtitle: 'task_sub'.tr(),
              count: taskCount.toString(),
            ),
          ),
          const SizedBox(height: 12),
          for (final task in tasks) ...[
            _TaskItem(task: task),
            const SizedBox(height: 36),
          ],
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final TaskEntity task;
  const _TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    final model = TaskMapper.toUiHomeTask(task);
    return GestureDetector(
      onTap: () => context.pushNamed(RouteNames.taskDetail, extra: model),
      child: TaskCardItem(taskState: model),
    );
  }
}
