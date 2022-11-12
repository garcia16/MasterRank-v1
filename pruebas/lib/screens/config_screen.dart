
import 'package:flutter/material.dart';
import 'package:pruebas/widgets/config.dart';
class ConfigScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Config()
        ],
      ),
   );
  }
}

