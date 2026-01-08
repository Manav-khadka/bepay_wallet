import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/models/wallet_model.dart';
import '../../bloc/wallet_bloc.dart';
import '../../bloc/wallet_event.dart';

class WalletBalanceSection extends StatelessWidget {
  final WalletModel wallet;

  const WalletBalanceSection({
    super.key,
    required this.wallet,
  });

  @override
  Widget build(BuildContext context) {
    final parts = wallet.balance.split('.');
    final wholePart = parts.isNotEmpty ? parts[0] : '0';
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '.00';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Wallet balance', style: AppTextStyles.text14Regular),
            SizedBox(width: 4.w),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.sp,
              color: AppColors.primaryBlack,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                context.read<WalletBloc>().add(const ToggleBalanceVisibility());
              },
              icon: Icon(
                wallet.isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20.sp,
                color: AppColors.primaryBlack,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wallet.isVisible
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wholePart, style: AppTextStyles.text30Bold),
                      Text(
                        decimalPart,
                        style: AppTextStyles.text30Bold.copyWith(
                          color: AppColors.blackWithOpacity,
                        ),
                      ),
                    ],
                  )
                : Text('••••••', style: AppTextStyles.text30Bold),
            SizedBox(width: 8.w),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                children: [
                  Text(wallet.currency, style: AppTextStyles.text14Regular),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16.sp,
                    color: AppColors.primaryBlack,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.access_time,
                    size: 24.sp,
                    color: AppColors.primaryBlack,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.language,
                    size: 24.sp,
                    color: AppColors.primaryBlack,
                  ),
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.cardWidgetBg,
                  child: Icon(
                    Icons.person,
                    color: AppColors.primaryBlack,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
