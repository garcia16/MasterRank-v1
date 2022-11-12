import 'package:flutter/material.dart';
import 'package:pruebas/widgets/background.dart';
import 'package:pruebas/widgets/inputs_join_group.dart';
class JoinGroup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _HomeBody()
        ],
      ),
   );
  }
}

 class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InputsJoinGroup(),
        ],
      ),
    );
  }
} 