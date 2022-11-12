import 'package:flutter/material.dart';
import 'package:pruebas/widgets/members.dart';

class MembersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Members(),
        ],
      ),
   );
  }
}
