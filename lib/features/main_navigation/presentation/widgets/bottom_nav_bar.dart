import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static final List<_NavItem> _items = [
    _NavItem(
      icon: Iconsax.home,
      activeIcon: Iconsax.home_15,
      label: "home".tr(),
    ),
    _NavItem(
      icon: Iconsax.calendar_2,
      activeIcon: Iconsax.calendar_25,
      label: "attendant".tr(),
    ),
     _NavItem(
      icon: Iconsax.note_text,
      activeIcon: Iconsax.note_text5,
      label: "task".tr()
    ),
     _NavItem(
      icon: Iconsax.receipt_2,
      activeIcon: Iconsax.receipt_25,
      label: "expense".tr()
    ),
     _NavItem(
      icon: Iconsax.layer,
      activeIcon: Iconsax.layer5,
      label: "leave".tr()
    )
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.bottomNavBarBgColor,
        selectedItemColor: colors.pureWhite,
        unselectedItemColor: colors.pureWhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: _items
            .map((item) => _buildNavItem(context,item))
            .toList(),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      BuildContext context,
      _NavItem item
      ) {
    return BottomNavigationBarItem(
      icon: Icon(item.icon),
      activeIcon: _ActiveIcon(
        icon: item.activeIcon,
        color: context.colors.pureWhite,
      ),
      label: item.label,

    );
  }
}

class _ActiveIcon extends StatelessWidget {
  const _ActiveIcon({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(height: 8),
        Container(
          width: 12,
          height: 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
     required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;

}