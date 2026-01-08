import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/repositories/mock_wallet_repository.dart';
import '../../bloc/wallet_bloc.dart';
import '../../bloc/wallet_event.dart';
import 'wallet_home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  List<PersistentTabConfig> _tabs() {
    return [
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) =>
              WalletBloc(repository: MockWalletRepository())
                ..add(const LoadWalletData()),
          child: const WalletHomeScreen(),
        ),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/icons/bitcoin_wallet.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlack,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/icons/bitcoin_wallet.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF6A6A6A),
              BlendMode.srcIn,
            ),
          ),
          title: 'Wallet',
          textStyle: AppTextStyles.text12Regular,
          activeForegroundColor: AppColors.primaryBlack,
          inactiveForegroundColor: const Color(0xFF6A6A6A),
        ),
      ),
      PersistentTabConfig(
        screen: _buildPlaceholderScreen('Card'),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/icons/card.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlack,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/icons/card.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF6A6A6A),
              BlendMode.srcIn,
            ),
          ),
          title: 'Card',
          textStyle: AppTextStyles.text12Regular,
          activeForegroundColor: AppColors.primaryBlack,
          inactiveForegroundColor: const Color(0xFF6A6A6A),
        ),
      ),
      PersistentTabConfig(
        screen: _buildPlaceholderScreen('Scan & Pay'),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/icons/scan_and_pay.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlack,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/icons/scan_and_pay.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF6A6A6A),
              BlendMode.srcIn,
            ),
          ),
          title: 'Scan & Pay',
          textStyle: AppTextStyles.text12Regular,
          activeForegroundColor: AppColors.primaryBlack,
          inactiveForegroundColor: const Color(0xFF6A6A6A),
        ),
      ),
      PersistentTabConfig(
        screen: _buildPlaceholderScreen('Explore'),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/icons/explore.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlack,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/icons/explore.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF6A6A6A),
              BlendMode.srcIn,
            ),
          ),
          title: 'Explore',
          textStyle: AppTextStyles.text12Regular,
          activeForegroundColor: AppColors.primaryBlack,
          inactiveForegroundColor: const Color(0xFF6A6A6A),
        ),
      ),
      PersistentTabConfig(
        screen: _buildPlaceholderScreen('Reward'),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/icons/reward.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlack,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/icons/reward.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(
              Color(0xFF6A6A6A),
              BlendMode.srcIn,
            ),
          ),
          title: 'Reward',
          textStyle: AppTextStyles.text12SemiBold,
          activeForegroundColor: AppColors.primaryBlack,
          inactiveForegroundColor: AppColors.textLightGray,
        ),
      ),
    ];
  }

  Widget _buildPlaceholderScreen(String title) {
    return Scaffold(
      backgroundColor: AppColors.bgPureWhite,
      body: Center(child: Text(title, style: AppTextStyles.text24Bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: AppColors.bgPureWhite,
        ),
      ),
    );
  }
}
