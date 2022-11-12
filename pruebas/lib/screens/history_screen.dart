import 'package:flutter/material.dart';
import 'package:pruebas/widgets/history.dart';

class HistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          History(),
        ],
      ),
   );
  }
}
