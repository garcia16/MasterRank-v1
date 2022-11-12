import 'package:flutter/material.dart';
import 'package:pruebas/widgets/rules.dart';

class RulesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Rules(),
        ],
      ),
   );
  }
}
