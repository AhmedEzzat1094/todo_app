import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:todo_app/models/todo.dart";
import "package:todo_app/provider/model.dart";
import "package:todo_app/widgets/app_material_button.dart";
import "package:todo_app/widgets/time_widget.dart";

import "../styles/app_colors.dart";
import "../styles/app_styles.dart";
import "../tools/helper_function.dart";

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});
  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String time = "";
  String errorMessage = "";
  final TextEditingController _taskController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
            bottom: Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Add Task",
                style: AppStyles.styleCpureBlackS24W700,
              ),
              const SizedBox(
                height: 15,
              ),
              TimeWidget(getTime: (timeChoosed) {
                time = timeChoosed;
              }),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _taskController,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: AppColors.veryLightGray,
                  hintText: "Enter your task",
                ),
              ),
              Text(errorMessage, style: AppStyles.styleCredS15W400),
              IconButton(
                tooltip: "Add other task in same time",
                onPressed: () {
                  if (_taskController.text.trim().isEmpty) {
                    errorMessage = "Enter Task Then Press on Adding Button";
                    setState(() {});
                  } else {
                    _tasks.add(_taskController.text.trim());
                    _taskController.clear();
                    errorMessage = "";
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent + 20,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    setState(() {});
                  }
                },
                icon: const Icon(Icons.add),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "${index + 1} - ${_tasks[index]}",
                      style: AppStyles.styleCpureBlackS18W500,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<Model>(
                builder: (context, model, child) {
                  return AppMaterialButton(
                    text: "Confirm",
                    onPressed: () {
                      if (_tasks.isEmpty) {
                        alert(context, "You don't add any task");
                        return;
                      }
                      if (time.isEmpty) {
                        alert(
                            context, "Set a valid time then press on confirm");
                        return;
                      }

                      model.addPanelItem(
                          time,
                          List.generate(_tasks.length, (index) {
                            return Todo(title: _tasks[index], isFinsh: false);
                          }));
                      Navigator.pop(context);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
