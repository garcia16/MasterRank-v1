// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import 'package:pruebas/widgets_buttons/notifications_buttons.dart';

class Notifications extends StatefulWidget {

  @override
  _NotificationsState createState() => _NotificationsState();

}
class _NotificationsState extends State<Notifications> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notificaciones', style: TextStyle(fontFamily: 'Audiowide',fontSize: 35,)),
            Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: 2,),
            SizedBox(height: 15,),
            Image.asset('assets/image/notif.png', width: 400, height: 300,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 3,),
            NotificationsButtons()
          ],
        ),
      ),
    );
  }
  

}