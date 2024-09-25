import "package:flutter/material.dart";

import "../styles/app_styles.dart";

class TimeTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validate;
  const TimeTextField({super.key, required this.controller, this.validate});

  @override
  State<TimeTextField> createState() => _TimeTextFieldState();
}

class _TimeTextFieldState extends State<TimeTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.15,
      height: MediaQuery.sizeOf(context).width * 0.15,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validate,
        onEditingComplete: () {
          widget.controller.text = widget.controller.text.padLeft(2, "0");
        },
        onChanged: (val) {
          val = val.isNotEmpty ? val[val.length - 1] : val;
          if (RegExp(r"^[^\d]$").hasMatch(val)) {
            widget.controller.text = widget.controller.text
                .substring(0, widget.controller.text.length - 1);
          }
          if (widget.controller.text.length > 2) {
            widget.controller.text = widget.controller.text.substring(0, 2);
          }
        },
        keyboardType: TextInputType.number,
        style: AppStyles.styleCpureBlackS20W700,
        controller: widget.controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          errorStyle: TextStyle(fontSize: 0),
        ),
      ),
    );
  }
}
