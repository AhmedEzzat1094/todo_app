import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_floating_action_button.dart';
import 'package:todo_app/widgets/display_tasks.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        body: DisplayTasks(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActionButton());
  }
}
