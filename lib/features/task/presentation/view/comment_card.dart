import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/presentation/design_system/model/comment_model.dart';
import '../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class CommentCard extends StatelessWidget {
  final CommentModel comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: comment.commenterImage,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              placeholder: (_, __) =>
                  Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
              errorWidget: (_, __, ___) =>
                  Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      comment.commenterName ?? comment.idCommenter,
                      style: context.textTheme.labelMediumFont.copyWith(
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    comment.dateComment,
                    style: context.textTheme.labelSmallFont.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
              if ((comment.commenterPosition ?? '').isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  comment.commenterPosition!,
                  style: context.textTheme.labelSmallFont.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ],
              const SizedBox(height: 4),
              Text(
                comment.commentMassage,
                style: context.textTheme.bodyMediumFont.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}