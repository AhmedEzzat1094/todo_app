import 'package:flutter/material.dart';
import 'package:todo_app/models/panel_item.dart';
import 'package:todo_app/tools/generate_id.dart';

import '../models/todo.dart';
import '../services/hive_services.dart';

class Model extends ChangeNotifier {
  final HiveServices services = HiveServices();

  Map<dynamic, PanelItem> _panelItems = {};

  bool _isLoding = true;

  bool get isLoading => _isLoding;

  Map<dynamic, PanelItem> get panelItems => _panelItems;

  Model() {
    _initFetch();
  }

  Future<void> _initFetch() async {
    _isLoding = true;
    _panelItems = await services.getData();
    _isLoding = false;
    notifyListeners();
  }

  Future<void> addPanelItem(String time, List<Todo> todos) async {
    PanelItem panelItem = PanelItem(
        id: generateId(), time: time, todos: todos, isExpanded: false);

    services.addData(panelItem);
    _panelItems[panelItem.id] = panelItem;
    notifyListeners();
  }

  void updatePanelItem(String id, PanelItem newPanel) {
    services.updateData(id, newPanel);
    _panelItems[id] = newPanel;
    notifyListeners();
  }

  void removePanelItem(String id) {
    services.deleteData(id);

    _panelItems.remove(id);
    notifyListeners();
  }
}
