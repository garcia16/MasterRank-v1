import 'package:flutter/material.dart';
import 'package:pruebas/widgets/security.dart';
class SecurityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Security()
        ],
      ),
   );
  }
}

