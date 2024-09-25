import 'package:todo_app/models/panel_item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  Box<PanelItem>? _myBox;

  Future<void> init() async {
    _myBox ??= await Hive.openBox<PanelItem>("todosBox");
  }

  Future<Box<PanelItem>> get myBox async {
    if (_myBox == null || !_myBox!.isOpen) {
      await init();
    }

    return _myBox!;
  }

  Future<void> addData(PanelItem panelItem) async {
    Box<PanelItem> box = await myBox;

    box.put(panelItem.id, panelItem);
  }

  Future<void> deleteData(String id) async {
    Box<PanelItem> box = await myBox;
    box.delete(id);
  }

  Future<void> updateData(String id, PanelItem panelItem) async {
    Box<PanelItem> box = await myBox;

    box.put(id, panelItem);
  }

  Future<Map<dynamic, PanelItem>> getData() async {
    Box<PanelItem> box = await myBox;

    return box.toMap();
  }
}
