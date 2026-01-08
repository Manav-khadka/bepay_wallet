import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../bloc/wallet_bloc.dart';
import '../../bloc/wallet_event.dart';

class WalletTabs extends StatelessWidget {
  final String selectedTab;

  const WalletTabs({
    super.key,
    required this.selectedTab,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Services', 'Assets', 'Fiat', 'NFT', 'Airdrops'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          final isSelected = selectedTab == tab;
          return Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: GestureDetector(
              onTap: () {
                context.read<WalletBloc>().add(ChangeTab(tab));
              },
              child: Text(
                tab,
                style: isSelected
                    ? AppTextStyles.text16SemiBold.copyWith(
                        fontWeight: FontWeight.w600,
                      )
                    : AppTextStyles.text16SemiBold.copyWith(
                        color: AppColors.textLightGray,
                      ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
