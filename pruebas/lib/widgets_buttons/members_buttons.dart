// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../utils/buttons_style.dart';
import '../utils/media_query.dart';
class MembersButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.share,size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Invitar miembro',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.membersShare(context),
            ),
            Divider(color:Color(0x0000ffff),height: 5,),
            ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.exit_to_app, size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Abandonar grupo',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.030)),
                  Icon(Icons.arrow_forward_ios_outlined, size: iconArrowMin.size),
                ]
              ),
              style: ButtonStyles.membersExit(context),
            ),
          ],
        ),
      ),
    );
  }
  


}