import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/panel_item.dart';

import '../models/todo.dart';
import '../provider/model.dart';

void update(BuildContext context, Todo todo, PanelItem panelItem) {
  TextEditingController titleController = TextEditingController();
  titleController.text = todo.title;
  GlobalKey<FormState> formKey = GlobalKey();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit"),
          content: Form(
            key: formKey,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter new title";
                }
                return null;
              },
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Enter new title",
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cansel")),
            Consumer<Model>(
              builder: (context, model, child) {
                return TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        todo.title = titleController.text;

                        model.updatePanelItem(panelItem.id, panelItem);

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save"));
              },
            )
          ],
        );
      });
}

void delete(BuildContext context, void Function() onSure) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete"),
          content: const Text("Are you sure to delete task ?"),
          actions: [
            TextButton(
              onPressed: () {
                onSure();
                Navigator.pop(context);
              },
              child: const Text("Sure"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cansel"),
            )
          ],
        );
      });
}


void alert(BuildContext context, String contant) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Alert"),
        content: Text(contant),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"))
        ],
      );
    },
  );
}
