import "package:flutter/material.dart";
import "package:todo_app/widgets/period_button.dart";
import "package:todo_app/widgets/time_text_field.dart";

import "../styles/app_styles.dart";
import "../tools/validation_functions.dart";

class TimeWidget extends StatefulWidget {
  final Function(String) getTime;
  const TimeWidget({super.key, required this.getTime});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  String period = "PM";
  String errorMessage = "";
  void showError(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(
          () {
            errorMessage = message;
          },
        );
      },
    );
  }

  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Time",
              style: AppStyles.styleCpureBlackS30W500,
            ),
            const SizedBox(
              width: 10,
            ),
            TimeTextField(
              controller: hourController,
              validate: (val) {
                if (val!.isEmpty) {
                  showError("Enter a valid time");
                  return "";
                }
                if (!isDigits(val)) {
                  showError("Enter a valid time");
                  return "";
                }
                if (!validHour(val)) {
                  showError("Enter a valid time");
                  return "";
                }
                if (isValid(hourController.text, minuteController.text)) {
                  widget.getTime(
                      "${hourController.text.padLeft(2, "0")}:${minuteController.text.padLeft(2, "0")} $period");
                  showError("");
                } else {
                  widget.getTime("");
                }
                return null;
              },
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              ":",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              width: 4,
            ),
            TimeTextField(
              controller: minuteController,
              validate: (val) {
                if (val!.isEmpty) {
                  showError("Enter a valid time");
                  return "";
                }
                if (!isDigits(val)) {
                  showError("Enter a valid time");
                  return "";
                }
                if (!validMinute(val)) {
                  showError("Enter a valid time");
                  return "";
                }

                if (isValid(hourController.text, minuteController.text)) {
                  widget.getTime(
                      "${hourController.text.padLeft(2, "0")}:${minuteController.text.padLeft(2, "0")} $period");
                  showError("");
                } else {
                  widget.getTime("");
                }

                return null;
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PeriodButton(
                  globalPeriod: period,
                  period: "AM",
                  onPressed: () {
                    setState(() {
                      period = "AM";
                    });
                  },
                ),
                PeriodButton(
                  globalPeriod: period,
                  period: "PM",
                  onPressed: () {
                    setState(() {
                      period = "PM";
                    });
                  },
                ),
              ],
            )
          ],
        ),
        Text(
          errorMessage,
          style: AppStyles.styleCredS15W400,
        ),
      ],
    );
  }
}
