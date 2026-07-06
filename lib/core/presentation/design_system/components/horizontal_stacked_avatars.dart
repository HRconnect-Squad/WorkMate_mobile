import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class HorizontalStackedAvatars extends StatelessWidget {
  final List<String> commenterImage;

  const HorizontalStackedAvatars({super.key, required this.commenterImage});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 12.0;
    const double overlap = 6.0;
    final double step = avatarRadius * 2 - overlap;
    return SizedBox(
      width: (avatarRadius * 2 * 3) - (overlap * 2),
      height: avatarRadius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: List.generate(
          commenterImage.length < 3 ? commenterImage.length : 3,
          (index) {
            return Positioned.directional(
              textDirection: Directionality.of(context),
              start: step * index,
              child: FunCircleAvatar(
                imageUrl: commenterImage[index],
                radius: avatarRadius,
                borderWidth: 1.0,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FunCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double borderWidth;

  const FunCircleAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 12.0,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.white, width: borderWidth),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) =>
            Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
        errorWidget: (context, url, error) =>
            Image.asset(AppAssets.placeHolderProfile, fit: BoxFit.cover),
      ),
    );
  }
}
