import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

Widget buildEmailField(
    BuildContext context,
    SignUpState state,
    SignUpCubit cubit,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'email_label'.tr(),
        style: context.textTheme.bodySmallFont.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
      const SizedBox(height: 4),
      CustomInputField(
        initialValue: state.email,
        onChanged: cubit.onEmailChanged,
        enabled: !state.isLoading,
        keyboardType: TextInputType.emailAddress,
        hintKey: 'email_hint'.tr(),
        borderColor: state.emailError != null
            ? context.colors.error
            : context.colors.gray400,
        filledColor: context.colors.white,
        labelHintStyle: context.colors.gray400,
        enabledColor: context.colors.gray400,
        radius: 8,
        contentPaddingHorizontal: 16,
        contentPaddingVertical: 16,
        prefixIcon: Icon(
          Iconsax.sms,
          color: context.colors.purple500,
        ),
      ),
      if (state.emailError != null) ...[
        const SizedBox(height: 8),
        Text(
          state.emailError!,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.error,
          ),
        ),
      ],
    ],
  );
}