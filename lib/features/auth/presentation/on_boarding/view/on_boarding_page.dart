import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../core/presentation/routes/route_names.dart';
import '../logic/on_boarding_cubit.dart';
import '../logic/on_boarding_state.dart';
import '../model/on_boarding.dart';
import '../widget/OnboardingDotsIndicator.dart';
import '../widget/onboarding_final_content.dart';
import '../widget/onboarding_page_content.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final PageController _pageController;

  static final List<OnboardingItem> _introItems = [
    OnboardingItem(
      image: AppAssets.kOnBoargingOne,
      title: 'on_boarding_title_one'.tr(),
      subTitle: 'on_boarding_subtitle_one'.tr(),
    ),
    OnboardingItem(
      image: AppAssets.kOnBoargingTwo,
      title: 'on_boarding_title_two'.tr(),
      subTitle: 'on_boarding_subtitle_two'.tr(),
    ),
    OnboardingItem(
      image: AppAssets.kOnBoargingThree,
      title: 'on_boarding_title_three'.tr(),
      subTitle: 'on_boarding_subtitle_three'.tr(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _precacheImages();
  }

  void _precacheImages() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      for (final item in _introItems) {
        precacheImage(AssetImage(item.image), context);
      }
      precacheImage(const AssetImage(AppAssets.kOnBoargingFinal), context);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<OnboardingCubit, OnboardingState>(
            listenWhen: (prev, curr) => prev.currentIndex != curr.currentIndex,
            listener: _onPageIndexChanged,
          ),
          BlocListener<OnboardingCubit, OnboardingState>(
            listenWhen: (prev, curr) =>
            !prev.shouldNavigate && curr.shouldNavigate,
            listener: _onNavigateToAuth,
          ),
          BlocListener<OnboardingCubit, OnboardingState>(
            listenWhen: (prev, curr) =>
            curr.status == OnboardingStatus.error &&
                curr.errorMessage != null &&
                curr.errorMessage != prev.errorMessage,
            listener: (context, state) =>
                SnackBarHelper.showError(context, state.errorMessage!),
          ),
        ],
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged:
                    context.read<OnboardingCubit>().onPageChanged,
                    children: [
                      ..._introItems.map(
                            (item) => OnboardingPageContent(item: item),
                      ),
                      const OnboardingFinalContent(),
                    ],
                  ),
                ),

                _buildDotsIndicator(state),

                _buildButtons(context, state),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onPageIndexChanged(BuildContext context, OnboardingState state) {
    final currentPage = _pageController.page?.round() ?? 0;
    if (currentPage != state.currentIndex) {
      _pageController.animateToPage(
        state.currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onNavigateToAuth(BuildContext context, OnboardingState state) {
    context.read<OnboardingCubit>().onNavigationHandled();

    final route = state.destination == AuthDestination.login
        ? RouteNames.login
        : RouteNames.register;
    context.go(route);
  }

  Widget _buildDotsIndicator(OnboardingState state) {
    if (state.isFinalPage) {
      return const SizedBox(height: 28);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: OnboardingDotsIndicator(
        currentIndex: state.currentIndex,
        itemCount: _introItems.length,
      ),
    );
  }

  Widget _buildButtons(BuildContext context, OnboardingState state) {
    final cubit = context.read<OnboardingCubit>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(34, 0, 34, 24),
      child: state.isFinalPage
          ? _buildAuthButtons(cubit, state)
          : _buildNavigationButtons(cubit),
    );
  }

  Widget _buildAuthButtons(OnboardingCubit cubit, OnboardingState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPrimaryButton.gradient(
          buttonText: 'sign_in'.tr(),
          textStyle: context.textTheme.labelLargeFont,
          isLoading: state.isLoading,
          isEnabled: !state.isLoading,
          onPressed: cubit.onSignInPressed,
        ),
        const SizedBox(height: 16),
        CustomPrimaryButton.outlined(
          buttonText: 'register'.tr(),
          textStyle: context.textTheme.labelLargeFont.copyWith(
            color: ExtensionColors.kButtonBackgroundPrimary,
          ),
          isEnabled: !state.isLoading,
          onPressed: cubit.onRegisterPressed,
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(OnboardingCubit cubit) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPrimaryButton.gradient(
          buttonText: 'next'.tr(),
          textStyle: context.textTheme.labelLargeFont,
          onPressed: cubit.onNextPressed,
        ),
        const SizedBox(height: 16),
        CustomPrimaryButton.outlined(
          buttonText: 'skip'.tr(),
          textStyle: context.textTheme.labelLargeFont.copyWith(
            color: ExtensionColors.kButtonBackgroundPrimary,
          ),
          onPressed: cubit.onSkipPressed,
        ),
      ],
    );
  }
}
