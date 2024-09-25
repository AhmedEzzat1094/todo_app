import 'package:flutter/material.dart';
import 'package:todo_app/styles/app_colors.dart';

class PeriodButton extends StatelessWidget {
  final String globalPeriod;
  final String period;
  final void Function()? onPressed;
  const PeriodButton(
      {super.key,
      required this.period,
      this.onPressed,
      required this.globalPeriod});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: MediaQuery.sizeOf(context).width * 0.075,
      child: MaterialButton(
        textColor: AppColors.offWhite,
        color:
            globalPeriod == period ? AppColors.pureBlack : AppColors.midiumGray,
        onPressed: onPressed,
        child: Text(
          period,
        ),
      ),
    );
  }
}
