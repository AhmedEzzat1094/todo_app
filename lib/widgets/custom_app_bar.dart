import "package:flutter/material.dart";
import "package:todo_app/tools/generate_day_info.dart";

import "../styles/app_colors.dart";
import "../styles/app_styles.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        title: const Text(
          "Today",
          style: AppStyles.styleCpureBlackS22W700,
        ),
        subtitle: Row(
          children: [
            Text(generateDayInfo(), style: AppStyles.styleClightGreyishS18W600),
            const SizedBox(
              width: 6,
            ),
            const Icon(
              Icons.calendar_today,
              size: 20,
              color: AppColors.lightGrayish,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 110);
}
