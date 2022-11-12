
import 'package:flutter/material.dart';

import '../widgets/information.dart';
class InformationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Information()
        ],
      ),
   );
  }
}

