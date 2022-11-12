// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../utils/buttons_style.dart';

class ConfigButtons extends StatefulWidget {

  @override
  _ConfigButtonsState createState() => _ConfigButtonsState();

}
class _ConfigButtonsState extends State<ConfigButtons> {
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
              onPressed: (){
                Navigator.pushNamed(context, 'notifications');
              },
              icon: Icon(Icons.notifications_active,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Notificaciones'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.config(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'security');
              },
              icon: Icon(Icons.security_sharp,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Seguridad y Privacidad'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.config(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'help');
              },
              icon: Icon(Icons.help,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Ayuda'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.config(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'information');
              },
              icon: Icon(Icons.info,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Información'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.config(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'theme_app');
              },
              icon: Icon(Icons.palette,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Tema'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.config(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                openAlertBox();
              },
              icon: Icon(Icons.logout,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Cerrar sesión'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.config(context),
            ),
          ],
        ),
      ),
    );
  }
  
  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Cerrar Sesión",
                        style: TextStyle(fontSize: 24.0, fontFamily:'Audiowide'),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text('¿Está seguro que quiere cerrar la sesión?',style: TextStyle(fontFamily:'Audiowide'),),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: ElevatedButton(
                        onPressed: () { 
                          FirebaseAuth.instance.signOut();
                          Navigator.popAndPushNamed(context, 'home_screen');
                        },
                        child: Text('Salir', style: TextStyle(fontFamily: 'Audiowide',fontSize: 18),),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


}
