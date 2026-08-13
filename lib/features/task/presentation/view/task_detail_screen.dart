import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../core/presentation/design_system/components/custom_chat_bar_message.dart';
import '../../../../core/presentation/design_system/components/custom_chips.dart';
import '../../../../core/presentation/design_system/model/task_model.dart';
import '../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../model/task_detail_model.dart';
import '../login/task_detail_cubit.dart';
import '../login/task_detail_state.dart';
import 'comment_card.dart'; // ✅ FIXED

class TaskDetailScreen extends StatefulWidget {
  final TaskModel task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  final TextEditingController commentController = TextEditingController();
  final PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    commentController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray50,
      appBar: CustomAppBar.simple(
        title: 'task_details'.tr(),
        showBackButton: true,
        onBackPressed: () => Navigator.pop(context),
        backgroundColor: context.colors.surface,
        leadingBackgroundColor: context.colors.purple50,
      ),
      body: BlocConsumer<TaskDetailCubit, TaskDetailState>(
        listenWhen: (prev, curr) =>
        (curr.apiError != null && prev.apiError != curr.apiError) ||
            (curr.commentError != null &&
                prev.commentError != curr.commentError),
        listener: (context, state) {
          final message = state.commentError ?? state.apiError;
          if (message == null) return;
          SnackBarHelper.showError(context, message);
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.apiError != null && state.taskDetail == null) {
            return _ErrorView(message: state.apiError!);
          }
          if (state.taskDetail == null) return const SizedBox.shrink();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _TaskDetailCard(
              detail: state.taskDetail!,
              currentIndex: _currentIndex,
              pageController: pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              commentController: commentController,
              isSubmittingComment: state.isSubmittingComment,
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────

class _TaskDetailCard extends StatelessWidget {
  final TaskDetailModel detail;
  final int currentIndex;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final TextEditingController commentController;
  final bool isSubmittingComment;

  const _TaskDetailCard({
    required this.detail,
    required this.currentIndex,
    required this.pageController,
    required this.onPageChanged,
    required this.commentController,
    required this.isSubmittingComment,
  });

  @override
  Widget build(BuildContext context) {
    final task = detail.task;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleStatusRow(task: task),
          _DateText(date: task.date),
          const SizedBox(height: 16),

          if (detail.imageUrls.isNotEmpty) ...[
            _ImageCarousel(
              imageUrls: detail.imageUrls,
              currentIndex: currentIndex,
              pageController: pageController,
              onPageChanged: onPageChanged,
            ),
            const SizedBox(height: 10),
            _Thumbnails(
              imageUrls: detail.imageUrls,
              onTap: (i) => pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            ),
            const SizedBox(height: 16),
          ],

          _DescriptionCard(description: detail.description),
          const SizedBox(height: 16),
          _PriorityDifficultyRow(task: task, difficulty: detail.difficulty),
          Divider(height: 32, color: context.colors.gray200, thickness: 1.5),
          _AssigneeSection(detail: detail),
          const SizedBox(height: 16),

          Text(
            'comment_section'.tr(),
            style: context.textTheme.labelMediumFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),

          if (detail.comments.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: detail.comments.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, i) => CommentCard(comment: detail.comments[i]), // ✅ FIXED
            ),

          const SizedBox(height: 16),

          if (isSubmittingComment)
            const Center(child: CircularProgressIndicator())
          else
            CustomChatBarMessage(
              messageController: commentController,
              hintText: 'write_a_comment'.tr(),
              onSend: (text) {
                context.read<TaskDetailCubit>().submitComment(
                  detail.task.id,
                  text,
                );
                commentController.clear();
              },
              onRecord: () {},
            ),
        ],
      ),
    );
  }
}

// ── Title + Status chip ──────────────────────────────────────

class _TitleStatusRow extends StatelessWidget {
  final TaskModel task;
  const _TitleStatusRow({required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            task.title,
            style: context.textTheme.titleMediumFont.copyWith(
              color: context.colors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        CustomChips(
          title: task.status.name,
          color: task.status.colorStatus(context),
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          borderRadius: BorderRadius.circular(100),
          image: AppAssets.kProperty,
        ),
      ],
    );
  }
}

// ── Date ─────────────────────────────────────────────────────

class _DateText extends StatelessWidget {
  final String date;
  const _DateText({required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${'created'.tr()} $date',
      style: context.textTheme.labelMediumFont.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }
}

// ── Image carousel ───────────────────────────────────────────

class _ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final int currentIndex;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const _ImageCarousel({
    required this.imageUrls,
    required this.currentIndex,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 250,
            child: PageView.builder(
              controller: pageController,
              itemCount: imageUrls.length,
              onPageChanged: onPageChanged,
              itemBuilder: (_, i) => CachedNetworkImage(
                imageUrl: imageUrls[i],
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    Container(color: context.colors.gray200),
                errorWidget: (_, __, ___) =>
                const Icon(Icons.broken_image, size: 48),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageUrls.length, (i) {
              final active = i == currentIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: active ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active
                      ? context.colors.purple500
                      : context.colors.purple200,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ── Thumbnails ───────────────────────────────────────────────

class _Thumbnails extends StatelessWidget {
  final List<String> imageUrls;
  final ValueChanged<int> onTap;

  const _Thumbnails({required this.imageUrls, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) => GestureDetector(
          onTap: () => onTap(i),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrls[i],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Description ──────────────────────────────────────────────

class _DescriptionCard extends StatelessWidget {
  final String description;
  const _DescriptionCard({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.gray50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'description'.tr(),
            style: context.textTheme.labelMediumFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: context.textTheme.bodyMediumFont.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Priority + Difficulty ────────────────────────────────────

class _PriorityDifficultyRow extends StatelessWidget {
  final TaskModel task;
  final String difficulty;

  const _PriorityDifficultyRow({
    required this.task,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'priority'.tr(),
                style: context.textTheme.labelMediumFont.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              CustomChips(
                title: task.priority.name,
                color: task.priority.colorTaskPriority(context),
                style: context.textTheme.labelMediumFont.copyWith(
                  color: context.colors.white,
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                borderRadius: BorderRadius.circular(100),
                image: AppAssets.kProperty,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'difficulty'.tr(),
                style: context.textTheme.labelMediumFont.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(AppAssets.goodEmoji, width: 24, height: 24),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      difficulty,
                      style: context.textTheme.labelMediumFont.copyWith(
                        color: context.colors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Assignee — uses CustomAppBar.profile inline ──────────────

class _AssigneeSection extends StatelessWidget {
  final TaskDetailModel detail;
  const _AssigneeSection({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'assignee'.tr(),
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        CustomAppBar.profile(
          profileName: detail.assigneeName,
          profileJobTitle: detail.assigneeJobTitle,
          profileAvatarUrl: detail.assigneeAvatarUrl,
          backgroundColor: Colors.transparent,
          showBackButton: false,
        ),
      ],
    );
  }
}

// ── Error ────────────────────────────────────────────────────

class _ErrorView extends StatelessWidget {
  final String message;
  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(message, style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}