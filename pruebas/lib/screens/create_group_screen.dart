
import 'package:flutter/material.dart';
import 'package:pruebas/widgets/background.dart';
import 'package:pruebas/widgets/inputs_create_group.dart';


class CreateGroup extends StatelessWidget {

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
          InputsCreateGroup(),
        ],
      ),
    );
  }
} 