import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/model.dart';
import 'package:todo_app/screens/home_screen.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:todo_app/services/panel_item_adapter.dart';
import 'package:todo_app/services/todo_adapter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(PanelItemAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Model>(
      create: (context) => Model(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
