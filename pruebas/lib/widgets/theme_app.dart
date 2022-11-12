// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../widgets_buttons/theme_app_buttons.dart';

class ThemeApp extends StatefulWidget {

  @override
  _ThemeAppState createState() => _ThemeAppState();

}
class _ThemeAppState extends State<ThemeApp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tema', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Text('Cambiar tema de la aplicación', style: TextStyle(fontFamily: 'Audiowide'),),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 75,
              child: ThemeAppButtons()
            ),
          ],
        ),
      ),
    );
  }


}