// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas/providers/ui_provider.dart';
import 'package:pruebas/widgets/edit_group.dart';


class EditGroupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            EditGroup(),
          ],
        ),
      ),
   );
  }
}