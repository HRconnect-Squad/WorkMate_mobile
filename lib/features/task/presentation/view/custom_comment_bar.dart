import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';


class CustomCommentBar extends StatelessWidget {
  final TextEditingController commentController;
  final String? avatarUrl;
  final String? hintText;
  final ValueChanged<String>? onSend;

  const CustomCommentBar({
    super.key,
    required this.commentController,
    this.avatarUrl,
    this.hintText,
    this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _avatar(context),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 6, top: 6, bottom: 6),
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.colors.gray200),
            ),
            child: Row(
              children: [
                Expanded(child: _commentTextField(context)),
                const SizedBox(width: 8),
                _sendButton(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _avatar(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      child: ClipOval(
        child: (avatarUrl == null || avatarUrl!.isEmpty)
            ? Image.asset(AppAssets.placeHolderProfile, width: 44, height: 44, fit: BoxFit.cover)
            : CachedNetworkImage(
          imageUrl: avatarUrl!,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          placeholder: (_, __) => Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
          errorWidget: (_, __, ___) => Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _commentTextField(BuildContext context) {
    return CustomInputField(
      hintKey: hintText ?? 'write_a_comment'.tr(),
      controller: commentController,
      filledColor: Colors.transparent,
      contentPaddingHorizontal: 0,
      contentPaddingVertical: 12,
      focusAndErrorColor: Colors.transparent,
      evaluation: false,
    );
  }

  Widget _sendButton(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: commentController,
      builder: (context, value, _) {
        final hasText = value.text.trim().isNotEmpty;
        return SizedBox(
          width: 40,
          height: 40,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: hasText ? () => onSend?.call(value.text.trim()) : null,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.gray400,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Iconsax.send_1, color: context.colors.white, size: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}