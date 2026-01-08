import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ActionButton(
            icon: Icons.arrow_downward,
            label: 'Receive',
            isBlack: true,
            onTap: () {},
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ActionButton(
            icon: Icons.arrow_upward,
            label: 'Send',
            isBlack: false,
            onTap: () {},
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ActionButton(
            icon: Icons.swap_horiz,
            label: 'Swap',
            isBlack: false,
            onTap: () {},
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ActionButton(
            icon: Icons.credit_card,
            label: 'Buy',
            isBlack: false,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isBlack;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isBlack,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isBlack ? AppColors.primaryBlack : AppColors.cardWidgetBg,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isBlack ? AppColors.bgPureWhite : AppColors.primaryBlack,
              size: 24.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: AppTextStyles.text12Medium.copyWith(
                color: isBlack ? AppColors.bgPureWhite : AppColors.primaryBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
