import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/presentation/design_system/theme/color/app_constant_colors.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../../core/presentation/routes/route_names.dart';


Widget buildAlreadyHaveAnAccount(BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "already_have_account".tr(),
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: GestureDetector(
            onTap: (){
              context.go(RouteNames.login);
            },
            child: Text(
              "sign_in_here".tr(),
              style: context.textTheme.labelMediumFont.copyWith(
                color: AppConstantColors.purple500,
              ),
            ),
          ),
        ),
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
