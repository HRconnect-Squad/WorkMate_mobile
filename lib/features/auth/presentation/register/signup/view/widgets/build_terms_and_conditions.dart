import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/features/auth/presentation/register/signup/view/widgets/terms_popup.dart';
import '../../../../../../../core/presentation/design_system/components/check_box.dart';
import '../../../../../../../core/presentation/design_system/theme/color/app_constant_colors.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

Widget buildTermsAndConditions(BuildContext context, SignUpState state) {
  final cubit = context.read<SignUpCubit>();

  final defaultStyle = context.textTheme.labelMediumFont.copyWith(
    color: context.colors.textPrimary,
  );

  final linkStyle = defaultStyle.copyWith(
    color: AppConstantColors.purple500,
  );

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomCheckbox(
        size: 16,
        isChecked: state.isCheckedTermsAndConditions,
        onChanged: cubit.onTermsToggled,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text.rich(
          TextSpan(
            style: defaultStyle,
            children: [
              TextSpan(text: 'agree_with'.tr()),
              TextSpan(
                text: 'terms_conditions'.tr(),
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _showTermsPopup(context, cubit),
              ),
              TextSpan(text: 'and'.tr()),
              TextSpan(
                text: 'privacy_policy'.tr(),
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _showTermsPopup(context, cubit),
              )

            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

void _showTermsPopup(BuildContext context, SignUpCubit cubit) {
  PopupHelper.show(
    context: context,
    popup: TermsPopup(
      onAgree: () {
        cubit.onTermsToggled(true);
      },
    ),
  );
}