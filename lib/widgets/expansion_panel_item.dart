import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:todo_app/provider/model.dart";
import "package:todo_app/widgets/todo_item.dart";
import "../models/panel_item.dart";
import "../styles/app_colors.dart";
import "../styles/app_styles.dart";
import "../tools/helper_function.dart";

class ExpansionPanelItem extends StatefulWidget {
  final PanelItem panelItem;
  const ExpansionPanelItem({super.key, required this.panelItem});

  @override
  State<ExpansionPanelItem> createState() => _ExpansionPanelItemState();
}

class _ExpansionPanelItemState extends State<ExpansionPanelItem> {
  int get countCompleted {
    return widget.panelItem.todos.where((todo) => todo.isFinsh).toList().length;
  }

  int get countAllTasks => widget.panelItem.todos.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightPastelBlue,
      ),
      child: ExpansionPanelList(
        elevation: 0,
        expansionCallback: (context, isExpanded) {
          setState(
            () {
              widget.panelItem.isExpanded = !widget.panelItem.isExpanded;
            },
          );
        },
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  widget.panelItem.time,
                  style: AppStyles.styleCpureBlackS18W600,
                ),
                trailing: Text(
                  countCompleted == countAllTasks
                      ? "Completed"
                      : "$countCompleted/$countAllTasks Completed",
                  style: TextStyle(
                      fontSize: AppStyles.styleS15W500.fontSize,
                      fontWeight: AppStyles.styleS15W500.fontWeight,
                      color:
                          AppColors.changeColor(countAllTasks, countCompleted)),
                ),
              );
            },
            body: Column(
              children: widget.panelItem.todos
                  .map((todo) =>
                      Consumer<Model>(builder: (context, model, child) {
                        return TodoItem(
                          todo: todo,
                          onToggle: (value) {
                            countCompleted;
                            todo.isFinsh = value!;
                            model.updatePanelItem(
                                widget.panelItem.id, widget.panelItem);

                            setState(() {});
                          },
                          onUpdata: () {
                            update(context, todo, widget.panelItem);
                          },
                          onDelete: () {
                            delete(context, () {
                              if (widget.panelItem.todos.length == 1) {
                                model.removePanelItem(widget);
                              }

                              widget.panelItem.todos.remove(todo);
                              setState(() {});
                            });
                          },
                        );
                      }))
                  .toList(),
            ),
            isExpanded: widget.panelItem.isExpanded,
            canTapOnHeader: true,
            backgroundColor: AppColors.lightPastelBlue,
          )
        ],
      ),
    );
  }
}
