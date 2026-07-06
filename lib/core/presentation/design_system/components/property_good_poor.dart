import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/extention_colors.dart';
import '../theme/helper/theme_extention.dart';

enum BurnoutStatus {
  good,
  okay,
  poor,
  bad;

  String get label => switch (this) {
    good => "property_good".tr(),
    okay => "property_okay".tr(),
    poor => "property_poor".tr(),
    bad => "property_bad".tr(),
  };

  String get emojiPath => switch (this) {
    good => AppAssets.goodEmoji,
    okay => AppAssets.okayEmoji,
    poor => AppAssets.poorEmoji,
    bad => AppAssets.badEmoji,
  };

  double get value => switch (this) {
    good => 0.25,
    okay => 0.45,
    poor => 0.85,
    bad => 1.0,
  };
}

class PropertyGoodPoor extends StatelessWidget {
  final BurnoutStatus status;

  const PropertyGoodPoor({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = context.colors;
    final textStyle = context.textTheme;

    final statusColor = switch (status) {
      BurnoutStatus.bad => ExtensionColors.bad,
      BurnoutStatus.poor => ExtensionColors.poor,
      BurnoutStatus.okay => ExtensionColors.okay,
      BurnoutStatus.good => ExtensionColors.good,
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text("property_label".tr(), style: textStyle.labelLargeFont),
              SizedBox(width: 4),
              Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  status.label,
                  style: textStyle.labelMediumFont.copyWith(
                    color: color.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 12),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "property_des1".tr(),
                    style: textStyle.bodySmallFont.copyWith(
                      color: color.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: "property_des2".tr(),
                    style: textStyle.bodySmallFont.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: "property_des3".tr(),
                    style: textStyle.bodySmallFont.copyWith(
                      color: color.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildProgressBar(context, statusColor),
        ],
      ),
    );
  }

  Widget buildProgressBar(BuildContext context, Color statusColor) {
    final color = context.colors;

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.gray100,
        border: Border.all(color: color.gray200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(status.emojiPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                activeTrackColor: statusColor,
                inactiveTrackColor: color.stroke,

                overlayShape: SliderComponentShape.noThumb,
                trackHeight: 2,
              ),
              child: Slider(value: status.value, onChanged: (value) {}),
            ),
          ),
        ],
      ),
    );
  }
}
