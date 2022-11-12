// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';

import '../utils/buttons_style.dart';

class HelpButtons extends StatefulWidget {

  @override
  _HelpButtonsState createState() => _HelpButtonsState();

}
class _HelpButtonsState extends State<HelpButtons> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '');
              },
              icon: Icon(Icons.add_circle,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Sugerencias'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.help(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '');
              },
              icon: Icon(Icons.support_agent_outlined,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Notificar un problema'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.help(context),
            ),
          ],
        ),
      ),
    );
  }
  


}