import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/change_password_cubit.dart';
import '../../logic/change_password_state.dart';

class ChangePasswordFormContent extends StatelessWidget {
  const ChangePasswordFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        final cubit = context.read<ChangePasswordCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _PasswordField(
              label: 'current_password'.tr(),
              hint: 'enter_current_password'.tr(),
              errorText: state.currentPasswordError,
              obscure: state.obscureCurrentPassword,
              enabled: !state.isLoading,
              onChanged: cubit.onCurrentPasswordChanged,
              onToggleObscure: cubit.toggleCurrentPasswordVisibility,
            ),
            const SizedBox(height: 16),

            _PasswordField(
              label: 'new_password'.tr(),
              hint: 'enter_new_password'.tr(),
              errorText: state.newPasswordError,
              obscure: state.obscureNewPassword,
              enabled: !state.isLoading,
              onChanged: cubit.onNewPasswordChanged,
              onToggleObscure: cubit.toggleNewPasswordVisibility,
            ),
            const SizedBox(height: 16),

            _PasswordField(
              label: 'confirm_new_password'.tr(),
              hint: 'enter_confirm_password'.tr(),
              errorText: state.confirmPasswordError,
              obscure: state.obscureConfirmPassword,
              enabled: !state.isLoading,
              onChanged: cubit.onConfirmPasswordChanged,
              onToggleObscure: cubit.toggleConfirmPasswordVisibility,
            ),

            const SizedBox(height: 12),
            _buildPasswordHint(context),
          ],
        );
      },
    );
  }

  Widget _buildPasswordHint(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.info_circle,
          size: 16,
          color: context.colors.gray400,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'password_requirements'.tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.gray500,
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final String? errorText;
  final bool obscure;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final VoidCallback onToggleObscure;

  const _PasswordField({
    required this.label,
    required this.hint,
    this.errorText,
    required this.obscure,
    required this.enabled,
    required this.onChanged,
    required this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmallFont.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colors.gray600,
          ),
        ),
        const SizedBox(height: 8),
        CustomInputField(
          enabled: enabled,
          isObscureText: obscure,
          onChanged: onChanged,
          borderColor: errorText != null
              ? context.colors.error
              : context.colors.gray300,
          filledColor: context.colors.white,
          hintKey: hint,
          labelHintStyle: context.colors.gray400,
          enabledColor: context.colors.gray300,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 14,
          prefixIcon: Icon(
            Iconsax.lock,
            color: context.colors.purple400,
            size: 20,
          ),
          suffixIcon: IconButton(
            onPressed: enabled ? onToggleObscure : null,
            icon: Icon(
              obscure ? Iconsax.eye_slash : Iconsax.eye,
              color: context.colors.gray400,
              size: 20,
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }
}