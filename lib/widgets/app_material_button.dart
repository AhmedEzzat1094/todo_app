import 'package:flutter/material.dart';
import 'package:todo_app/styles/app_styles.dart';

class AppMaterialButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AppMaterialButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black,
      minWidth: MediaQuery.sizeOf(context).width * 0.70,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.styleCoffWhiteS20W500,
      ),
    );
  }
}
