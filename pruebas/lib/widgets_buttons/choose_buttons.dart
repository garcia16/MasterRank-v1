// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../utils/buttons_style.dart';
import '../utils/media_query.dart';

class ChooseButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical! * 10,),
            Text('Master Rank', style: TextStyle(fontFamily: 'Audiowide',fontSize: 40, color: Color(0xff000A23))),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Text('Elige una opción', style: TextStyle(fontSize: 19, color: Colors.black,fontFamily: 'Audiowide')),
            SizedBox(height: SizeConfig.safeBlockVertical! * 20,),
            ElevatedButton(
              style: ButtonStyles.chooseOptions(context),
              onPressed: () {
                Navigator.pushNamed(context, 'create_group');
              },
              child: const Text('Crear Grupo'),
            ),
            SizedBox(height: 10,),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton(
              style: ButtonStyles.chooseOptions(context),
              onPressed: () {
                Navigator.pushNamed(context, 'join_group');
              },
              child: const Text('Unirse a Grupo'),
            ),
          ],
        ),
      ),
    );
  }
  


}