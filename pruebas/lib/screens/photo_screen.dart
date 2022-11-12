import 'package:flutter/material.dart';
import '../widgets/photo.dart';

class PhotoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Photo(),
        ],
      ),
   );
  }
}
