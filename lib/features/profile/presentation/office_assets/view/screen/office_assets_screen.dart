import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workmate/features/profile/presentation/helper/extention.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/office_asset.dart';
import '../../logic/office_assets_cubit.dart';
import '../../logic/office_assets_state.dart';
import '../widget/asset_image_carousel.dart';

class OfficeAssetsScreen extends StatelessWidget {
  const OfficeAssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: CustomAppBar.simple(
        title: 'office_assets'.tr(),
        showBackButton: true,
        leadingBackgroundColor: context.colors.purple100,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<OfficeAssetsCubit, OfficeAssetsState>(
        listenWhen: (previous, current) {
          return current.error != null && current.error != previous.error;
        },
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<OfficeAssetsCubit>().clearError();
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoadingState(context);
          }

          if (!state.hasAssets) {
            return _buildEmptyState(context);
          }

          return _buildContent(context, state);
        },
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colors.purple500,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.box,
              size: 80,
              color: context.colors.gray400,
            ),
            const SizedBox(height: 16),
            Text(
              'no_assets_assigned'.tr(),
              style: context.textTheme.titleMediumFont.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'no_assets_description'.tr(),
              style: context.textTheme.bodyMediumFont.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () => context.read<OfficeAssetsCubit>().refresh(),
              icon: const Icon(Icons.refresh),
              label: Text('retry'.tr()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, OfficeAssetsState state) {
    final cubit = context.read<OfficeAssetsCubit>();
    final asset = state.currentAsset!;

    return RefreshIndicator(
      onRefresh: () => cubit.refresh(),
      color: context.colors.purple500,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: context.colors.gray200.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, state),
              const SizedBox(height: 16),

              AssetImageCarousel(
                assets: state.assets,
                currentIndex: state.currentIndex,
                onPageChanged: cubit.onAssetChanged,
              ),
              const SizedBox(height: 16),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.05, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: _buildAssetDetails(context, asset),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, OfficeAssetsState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'assets_information'.tr(),
              style: context.textTheme.titleMediumFont.copyWith(
                color: context.colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'your_office_assets'.tr(),
              style: context.textTheme.bodySmallFont.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),

        if (state.hasMultipleAssets)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: context.colors.purple100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${state.currentIndex + 1}/${state.totalAssets}',
              style: context.textTheme.labelMediumFont.copyWith(
                color: context.colors.purple600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAssetDetails(BuildContext context, OfficeAsset asset) {
    return Column(
      key: ValueKey(asset.id),
      children: [
        _buildReadOnlyField(
          context,
          label: 'asset_name'.tr(),
          value: asset.fullName,
          icon: Iconsax.mobile,
        ),
        const SizedBox(height: 16),

        _buildReadOnlyField(
          context,
          label: 'brand'.tr(),
          value: asset.brand ?? '-',
          icon: Iconsax.tag,
        ),
        const SizedBox(height: 16),

        _buildWarrantyField(context, asset),
        const SizedBox(height: 16),

        _buildReadOnlyField(
          context,
          label: 'buying_date'.tr(),
          value: asset.formattedReceivedDate,
          icon: Iconsax.receipt_edit,
        ),
        const SizedBox(height: 16),

        _buildReadOnlyField(
          context,
          label: 'received_on'.tr(),
          value: asset.formattedReceivedDate,
          icon: Iconsax.calendar,
          // suffixIcon: Icon(
          //   Iconsax.arrow_down_1,
          //   size: 16,
          //   color: context.colors.gray400,
          // ),
        ),

          const SizedBox(height: 16),
          _buildReadOnlyField(
            context,
            label: 'serial_number'.tr(),
            value: asset.serialNumber,
            icon: Iconsax.barcode,
          ),

        if (asset.description != null && asset.description!.isNotEmpty) ...[
          const SizedBox(height: 16),
          _buildReadOnlyField(
            context,
            label: 'description'.tr(),
            value: asset.description!,
            icon: Iconsax.document_text,
          ),
        ],
      ],
    );
  }

  Widget _buildReadOnlyField(BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: context.colors.gray50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.colors.gray200),
          ),
          child: Row(
            children: [
              Icon(icon, color: context.colors.gray400, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value.isNotEmpty ? value : '-',
                  style: context.textTheme.bodyMediumFont.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
              Icon(
                Iconsax.arrow_down_1,
                color: context.colors.gray400,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildReadOnlyField(
  //     BuildContext context, {
  //       required String label,
  //       required String value,
  //       required IconData icon,
  //       Widget? suffixIcon,
  //     }) {
  //   return CustomInputField(
  //     initialValue: value,
  //     onChanged: (value) => {},
  //     label: label,
  //     labelColor: context.colors.gray600,
  //     isReadOnly: true,
  //     enabled: false,
  //     radius: 12,
  //     prefixIcon: Icon(
  //       icon,
  //       size: 20,
  //       color: context.colors.purple500,
  //     ),
  //     suffixIcon: suffixIcon,
  //   );
  // }

  Widget _buildWarrantyField(BuildContext context, OfficeAsset asset) {
    return CustomInputField(
      initialValue: asset.warrantyStatus.toDisplayString(),
      label: 'warranty_status'.tr(),
      labelColor: context.colors.gray600,
      isReadOnly: true,
      enabled: false,
      radius: 12,
      contentPaddingHorizontal: 16,
      contentPaddingVertical: 14,
      filledColor: context.colors.purple50,
      enabledColor: context.colors.purple100,
      borderColor: context.colors.purple100,
      prefixIcon: Icon(
        Iconsax.shield_tick,
        size: 20,
        color: context.colors.purple500,
      ),
      //suffixIcon: WarrantyBadge(status: asset.warrantyStatus),
    );
  }
}