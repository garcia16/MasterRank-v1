import 'package:flutter/material.dart';
import 'package:pruebas/widgets/edit_profile.dart';
class EditProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            EditProfile(),  
          ],
        ),
      ),
   );
  }
}