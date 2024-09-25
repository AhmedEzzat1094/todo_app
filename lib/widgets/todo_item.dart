import "package:flutter/material.dart";

import "../models/todo.dart";
import "../styles/app_colors.dart";
import "../styles/app_styles.dart";

class TodoItem extends StatefulWidget {
  final Todo todo;
  final void Function(bool?)? onToggle;
  final void Function()? onUpdata;
  final void Function()? onDelete;

  const TodoItem(
      {super.key,
      required this.todo,
      this.onToggle,
      this.onUpdata,
      this.onDelete});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Checkbox(
          activeColor: AppColors.green,
          value: widget.todo.isFinsh,
          onChanged: widget.onToggle),
      title: Text(
        widget.todo.title,
        style: AppStyles.styleCpureBlackS18W500,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: widget.onUpdata, icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(
                Icons.delete,
                color: AppColors.red,
              )),
        ],
      ),
    );
  }
}
