import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../bloc/wallet_bloc.dart';
import '../../bloc/wallet_state.dart';
import '../widgets/action_buttons_row.dart';
import '../widgets/message_card.dart';
import '../widgets/services_grid.dart';
import '../widgets/wallet_balance_section.dart';
import '../widgets/wallet_tabs.dart';

class WalletHomeScreen extends StatelessWidget {
  const WalletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state is WalletLoading) {
          return Scaffold(
            backgroundColor: AppColors.bgPureWhite,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryBlack),
            ),
          );
        }

        if (state is WalletError) {
          return Scaffold(
            backgroundColor: AppColors.bgPureWhite,
            body: Center(
              child: Text(
                'Error: ${state.message}',
                style: AppTextStyles.text16Regular,
              ),
            ),
          );
        }

        if (state is WalletLoaded) {
          return _buildLoadedContent(context, state);
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildLoadedContent(BuildContext context, WalletLoaded state) {
    return Scaffold(
      backgroundColor: AppColors.bgPureWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageCard(
                  imagePath: 'assets/images/signupmessagecard.png',
                  message: 'Sign up for our free newsletter\nand stay up-to-date.',
                  onTap: () {
                    // Handle newsletter signup
                  },
                ),
                SizedBox(height: 24.h),
                WalletBalanceSection(wallet: state.wallet),
                SizedBox(height: 24.h),
                const ActionButtonsRow(),
                SizedBox(height: 32.h),
                WalletTabs(selectedTab: state.selectedTab),
                SizedBox(height: 24.h),
                ServicesGrid(services: state.services),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
