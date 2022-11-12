import 'package:flutter/material.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
import '../widgets/add_rules.dart';
import '../widgets/update_points.dart';
import '../widgets/update_points_member.dart';
import 'group_screen.dart';
class AddRuleScreen extends StatefulWidget {

  @override
  State<AddRuleScreen> createState() => _AddRuleScreenState();
}


class _AddRuleScreenState extends State<AddRuleScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AddRules()
          ],
        ),
      ),
   );
  }
}
