import 'package:flutter/material.dart';
import 'package:pruebas/widgets/theme_app.dart';
class ThemeAppScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ThemeApp()
        ],
      ),
   );
  }
}

