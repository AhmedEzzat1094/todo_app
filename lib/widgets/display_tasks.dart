import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/model.dart';
import '../styles/app_styles.dart';
import 'expansion_panel_item.dart';

class DisplayTasks extends StatelessWidget {
  const DisplayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.77,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Consumer<Model>(
        builder: (context, model, child) {
          if (model.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (model.isLoading == false && model.panelItems.isEmpty) {
            return const Center(
              child: Text(
                "No Tasks Found 😔",
                style: AppStyles.styleCpureBlackS18W500,
              ),
            );
          }
          return ListView.builder(
            itemCount: model.panelItems.length,
            itemBuilder: (context, index) {
              return ExpansionPanelItem(
                  panelItem: model.panelItems.values.toList()[index]);
            },
          );
        },
      ),
    );
  }
}
