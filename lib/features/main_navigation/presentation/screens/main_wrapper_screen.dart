import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_nav_bar.dart';

class MainWrapperScreen extends StatelessWidget {
  const MainWrapperScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _onTabTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}