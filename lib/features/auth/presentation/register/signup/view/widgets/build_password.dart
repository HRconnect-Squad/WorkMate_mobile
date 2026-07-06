import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

Widget buildPasswordField(
    BuildContext context,
    SignUpState state,
    SignUpCubit cubit,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'password'.tr(),
        style: context.textTheme.bodySmallFont.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      const SizedBox(height: 4),
      CustomInputField(
        initialValue: state.password,
        onChanged: cubit.onPasswordChanged,
        enabled: !state.isLoading,
        keyboardType: TextInputType.visiblePassword,
        isObscureText: state.isObscurePassword,
        hintKey: 'password_hint'.tr(),
        borderColor: state.passwordError != null
            ? context.colors.error
            : context.colors.gray400,
        filledColor: context.colors.white,
        labelHintStyle: context.colors.gray400,
        enabledColor: context.colors.gray400,
        radius: 8,
        contentPaddingHorizontal: 16,
        contentPaddingVertical: 16,
        prefixIcon: Icon(
          Iconsax.lock,
          color: context.colors.purple500,
        ),
        suffixIcon: IconButton(
          onPressed: cubit.togglePasswordVisibility,
          icon: Icon(
            state.isObscurePassword ? Iconsax.eye_slash : Iconsax.eye,
            color: context.colors.purple500,
          ),
        ),
      ),
      if (state.passwordError != null) ...[
        const SizedBox(height: 8),
        Text(
          state.passwordError!,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.error,
          ),
        ),
      ],
    ],
  );
}

Widget buildConfirmPasswordField(
    BuildContext context,
    SignUpState state,
    SignUpCubit cubit,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'confirm_password'.tr(),
        style: context.textTheme.bodySmallFont.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      const SizedBox(height: 4),
      CustomInputField(
        initialValue: state.confirmPassword,
        onChanged: cubit.onConfirmPasswordChanged,
        enabled: !state.isLoading,
        keyboardType: TextInputType.visiblePassword,
        isObscureText: state.isObscureConfirmPassword,
        hintKey: 'password_hint'.tr(),
        borderColor: state.confirmPasswordError != null
            ? context.colors.error
            : context.colors.gray400,
        filledColor: context.colors.white,
        labelHintStyle: context.colors.gray400,
        enabledColor: context.colors.gray400,
        radius: 8,
        contentPaddingHorizontal: 16,
        contentPaddingVertical: 16,
        prefixIcon: Icon(
          Iconsax.lock,
          color: context.colors.purple500,
        ),
        suffixIcon: IconButton(
          onPressed: cubit.toggleConfirmPasswordVisibility,
          icon: Icon(
            state.isObscureConfirmPassword ? Iconsax.eye_slash : Iconsax.eye,
            color: context.colors.purple500,
          ),
        ),
      ),
      if (state.confirmPasswordError != null) ...[
        const SizedBox(height: 8),
        Text(
          state.confirmPasswordError!,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.error,
          ),
        ),
      ],
    ],
  );
}