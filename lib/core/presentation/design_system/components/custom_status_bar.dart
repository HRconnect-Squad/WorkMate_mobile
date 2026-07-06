import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/helper/theme_extention.dart';

enum StatusBarEnum { review, approved, rejected }

class CustomStatusBar extends StatefulWidget {
  final num tapOneCount, tapTwoCount, tapThreeCount;
  final String? tapOne, tapTwo, tapThree;

  const CustomStatusBar({
    super.key,
    required this.tapOneCount,
    required this.tapTwoCount,
    required this.tapThreeCount,
    this.tapOne,
    this.tapTwo,
    this.tapThree,
  });

  @override
  State<CustomStatusBar> createState() => _CustomStatusBarState();
}

class _CustomStatusBarState extends State<CustomStatusBar> {
  StatusBarEnum statusBarEnum = StatusBarEnum.review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _statusBarFunc(
              title: widget.tapOne ?? "reviewbtn".tr(),
              count: widget.tapOneCount,
              type: StatusBarEnum.review,
            ),
          ),
          Expanded(
            child: _statusBarFunc(
              title: widget.tapTwo ?? "approvedbtn".tr(),
              count: widget.tapTwoCount,
              type: StatusBarEnum.approved,
            ),
          ),
          Expanded(
            child: _statusBarFunc(
              title: widget.tapThree ?? "rejectedbtn".tr(),
              count: widget.tapThreeCount,
              type: StatusBarEnum.rejected,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBarFunc({
    required String title,
    required num count,
    required StatusBarEnum type,
  }) {
    bool isSelected = statusBarEnum == type;
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        if (statusBarEnum != type) {
          setState(() {
            statusBarEnum = type;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isSelected ? context.colors.purple500 : context.colors.white,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                title,
                style: context.textTheme.labelMediumFont.copyWith(
                  color: isSelected
                      ? context.colors.white
                      : context.colors.textSecondary,
                ),
              ),
              if (count > 0)
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? context.colors.error500
                          : context.colors.gray300,
                    ),
                    child: Text(
                      count.toString(),
                      style: context.textTheme.labelSmallFont.copyWith(
                        fontSize: 10,
                        color: context.colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
