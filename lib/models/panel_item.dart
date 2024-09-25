import 'package:todo_app/models/todo.dart';

class PanelItem {
  final String id;
  final String time;
  final List<Todo> todos;
  bool isExpanded;
  PanelItem({
    required this.id,
    required this.time,
    required this.todos,
    required this.isExpanded,
  });
}
