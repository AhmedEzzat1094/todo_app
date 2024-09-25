import 'package:hive/hive.dart';
import 'package:todo_app/models/panel_item.dart';
import 'package:todo_app/models/todo.dart';

class PanelItemAdapter extends TypeAdapter<PanelItem> {
  @override
  int get typeId => 1;

  @override
  read(BinaryReader reader) {
    return PanelItem(
        id: reader.readString(),
        time: reader.readString(),
        todos: reader.readList().cast<Todo>(),
        isExpanded: false);
  }

  @override
  void write(BinaryWriter writer, PanelItem obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.time)
      ..writeList(obj.todos)
      ..writeBool(obj.isExpanded);
  }
}
