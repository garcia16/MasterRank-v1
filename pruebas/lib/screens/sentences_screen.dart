
import 'package:flutter/material.dart';
import 'package:pruebas/widgets/sentences.dart';

class SentencesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Sentences(),
        ],
      ),
   );
  }
}
