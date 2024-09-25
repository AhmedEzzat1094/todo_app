import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';
import 'custom_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.65,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        isExtended: true,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                    bottom: Radius.circular(5),
                  ),
                ),
                child: const CustomBottomSheet(),
              );
            },
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: AppColors.offWhite,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Add Task",
              style: AppStyles.styleCoffWhiteS20W600,
            )
          ],
        ),
      ),
    );
  }
}
