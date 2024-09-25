import 'package:hive/hive.dart';

import '../models/todo.dart';

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  int get typeId => 0;

  @override
  Todo read(BinaryReader reader) {
    return Todo(title: reader.readString(), isFinsh: reader.readBool());
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeString(obj.title)
      ..writeBool(obj.isFinsh);
  }
}
