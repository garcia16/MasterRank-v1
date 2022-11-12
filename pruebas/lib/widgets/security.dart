// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import 'package:pruebas/widgets_buttons/privacy_buttons.dart';
import '../widgets_buttons/security_buttons.dart';

class Security extends StatefulWidget {

  @override
  _SecurityState createState() => _SecurityState();

}
class _SecurityState extends State<Security> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seguridad', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Text('Seguridad de Inicio de Sesión', style: TextStyle(fontFamily: 'Audiowide'),),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 33,
              child: SecurityButtons()
            ),
            Text('Privacidad del perfil', style: TextStyle(fontFamily: 'Audiowide'),),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 33,
              child: PrivacyButtons()
            ),
          ],
        ),
      ),
    );
  }


}