// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../widgets_buttons/config_buttons.dart';

class Config extends StatefulWidget {

  @override
  _ConfigState createState() => _ConfigState();

}
class _ConfigState extends State<Config> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configuración', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Image.asset('assets/image/config.png', width: 400, height: 150,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 70,
              child: ConfigButtons()
            ),
          ],
        ),
      ),
    );
  }

}