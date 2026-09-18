import 'package:flutter/cupertino.dart';

import '../../../../../../core/presentation/design_system/components/card_header.dart';
import '../../../../../../core/presentation/design_system/components/empty_state_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class AttendanceHistoryEmptyState extends StatelessWidget {
  const AttendanceHistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(
            title: "Working Period",
            subtitle: "Your working time in this paid period",
          ),

          Expanded(
            child: Center(
              child: EmptyStateCard(
                imgPath: AppAssets.noTasksAssigned,
                imgtitle: "No Working Time Available",
                imgDescription:
                "It looks like you don’t have any working time in this period. "
                    "Don’t worry, this space will be updated as new working time submitted.",
              ),
            ),
          ),
        ],
      ),

    );
  }
}
