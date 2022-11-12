
import 'package:flutter/material.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
import '../widgets/update_points.dart';
import '../widgets/update_points_member.dart';
import 'group_screen.dart';
class UpdatePointsMemberScreen extends StatefulWidget {

  @override
  State<UpdatePointsMemberScreen> createState() => _UpdatePointsMemberScreenState();
}


class _UpdatePointsMemberScreenState extends State<UpdatePointsMemberScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            UpdatePointsMember()
          ],
        ),
      ),
   );
  }
}

