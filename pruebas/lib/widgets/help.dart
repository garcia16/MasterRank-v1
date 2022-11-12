// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import 'package:pruebas/widgets_buttons/help_buttons.dart';

class Help extends StatefulWidget {

  @override
  _HelpState createState() => _HelpState();

}
class _HelpState extends State<Help> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ayuda', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: 2,),
            SizedBox(height: 15,),
            Image.asset('assets/image/help.png', width: 400, height: 250,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 3,),
            HelpButtons(),
          ],
        ),
      ),
    );
  }
  

}