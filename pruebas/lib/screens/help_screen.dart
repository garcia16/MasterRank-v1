import 'package:flutter/material.dart';
import 'package:pruebas/widgets/help.dart';

class HelpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Help(),
        ],
      ),
   );
  }
}