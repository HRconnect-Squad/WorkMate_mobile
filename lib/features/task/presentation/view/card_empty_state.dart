import 'package:flutter/cupertino.dart';
import '../../../../../../core/presentation/design_system/components/card_header.dart';
import '../../../../../../core/presentation/design_system/components/empty_state_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class CardEmptyState extends StatelessWidget {
  const CardEmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imgPath,
    required this.imgtitle,
    required this.imgDescription,
  });

  final String title;
  final String subtitle;
  final String imgPath;
  final String imgtitle;
  final String imgDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CardHeader(
            title: title,
            subtitle: subtitle,
          ),

          Center(
            child: EmptyStateCard(
              imgPath: imgPath,
              imgtitle: imgtitle,
              imgDescription: imgDescription,
            ),
          ),
        ],
      ),
    );
  }
}