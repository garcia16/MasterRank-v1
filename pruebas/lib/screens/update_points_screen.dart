import 'package:flutter/material.dart';
import 'package:pruebas/widgets/update_points.dart';

class UpdatePointsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          UpdatePoints(),
        ],
      ),
   );
  }
}
