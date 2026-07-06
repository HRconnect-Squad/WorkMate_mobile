import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/office_asset.dart';

class AssetImageCarousel extends StatefulWidget {
  final List<OfficeAsset> assets;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const AssetImageCarousel({
    super.key,
    required this.assets,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  State<AssetImageCarousel> createState() => _AssetImageCarouselState();
}

class _AssetImageCarouselState extends State<AssetImageCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void didUpdateWidget(AssetImageCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _pageController.animateToPage(
        widget.currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.assets.length,
            onPageChanged: widget.onPageChanged,
            itemBuilder: (context, index) {
              final asset = widget.assets[index];
              return _buildAssetImage(context, asset);
            },
          ),
        ),

        if (widget.assets.length > 1) ...[
          const SizedBox(height: 16),
          _buildPageIndicator(context),
        ],
      ],
    );
  }

  Widget _buildAssetImage(BuildContext context, OfficeAsset asset) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colors.gray200.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: asset.imageUrl ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: context.colors.gray100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.purple500,
                    strokeWidth: 2,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: context.colors.gray100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.devices_other,
                      size: 64,
                      color: context.colors.gray400,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      asset.category ?? 'Asset',
                      style: context.textTheme.bodyMediumFont.copyWith(
                        color: context.colors.gray500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (asset.category != null)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: context.colors.purple500.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    asset.category!,
                    style: context.textTheme.labelSmallFont.copyWith(
                      color: context.colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.assets.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == widget.currentIndex ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == widget.currentIndex
                ? context.colors.purple500
                : context.colors.gray300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}