import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workmate/core/presentation/design_system/components/app_bar.dart';
import '../../../../core/presentation/routes/route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.profile(
        showBackButton: false,
        profileAvatarUrl: "",
        onProfilePressed: () => context.push(RouteNames.profile),
        isVerified: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       context.push(RouteNames.profile);
        //     },
        //     icon: const Icon(Icons.person, color: Colors.purple),
        //     style: IconButton.styleFrom(
        //       backgroundColor: context.colors.purple100,
        //       shape: const CircleBorder(),
        //       padding: const EdgeInsets.all(8),
        //     ),
        //   ),
        //   const SizedBox(width: 8),
        //   IconButton(
        //     onPressed: () {
        //       _showLogoutDialog(context);
        //     },
        //     icon: const Icon(Icons.logout, color: Colors.red),
        //     style: IconButton.styleFrom(
        //       backgroundColor: context.colors.purple100,
        //       shape: const CircleBorder(),
        //       padding: const EdgeInsets.all(8),
        //     ),
        //   ),
        // ],
        profileName: 'Test',
        profileJobTitle: 'Mobile developer',
      ),
      body: const Center(child: Text("Welcome Back!")),
    );
  }

}
