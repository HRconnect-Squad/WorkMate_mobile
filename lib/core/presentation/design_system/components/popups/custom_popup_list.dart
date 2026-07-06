import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../theme/helper/theme_extention.dart';
import '../custom_primary_button.dart';
import '../selectable_chip.dart';

class CustomPopupList extends StatefulWidget {
  const CustomPopupList({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,
    this.onCancel,
    this.onConfirm,
  });

  final String title;
  final String subtitle;
  final List<String> options;
  final Function? onCancel, onConfirm;

  @override
  State<CustomPopupList> createState() => _CustomPopupListState();
}

class _CustomPopupListState extends State<CustomPopupList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      widget.title,
                      style: context.textTheme.headLineSmallFont.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  SliverToBoxAdapter(
                    child: Text(
                      widget.subtitle,
                      style: context.textTheme.labelLargeFont.copyWith(
                        color: context.colors.gray500,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  SliverList.separated(
                    itemCount: widget.options.length,
                    itemBuilder: (context, index) => SelectableCheckChip(
                      label: widget.options[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 90)),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomPrimaryButton(
                        buttonText: "cancel".tr(),
                        buttonType: ButtonType.outlined,
                        height: 48,
                        borderRadius: 30,
                        textStyle: context.textTheme.labelLargeFont,
                        onPressed: () => widget.onCancel,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomPrimaryButton(
                        buttonText: "select".tr(),
                        buttonType: ButtonType.filled,
                        height: 48,
                        borderRadius: 30,
                        textStyle: context.textTheme.labelLargeFont,
                        onPressed: () => widget.onConfirm,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
