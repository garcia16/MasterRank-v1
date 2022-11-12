// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pruebas/share_preferences/preferences.dart';
import 'package:pruebas/utils/media_query.dart';
import '../utils/buttons_style.dart';

class NotificationsButtons extends StatefulWidget {

  @override
  _NotificationsButtonsState createState() => _NotificationsButtonsState();

}
class _NotificationsButtonsState extends State<NotificationsButtons> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.email_outlined), 
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text('Vía E-mail'),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 6,width: SizeConfig.safeBlockHorizontal! * 15,
                      child: FlutterSwitch(
                        width:60,
                        value: Preferences.notifMail,
                        activeSwitchBorder: Border.all(color: Colors.black),
                        inactiveSwitchBorder: Border.all(color: Colors.black),
                        activeColor: Color(0xff000A23),
                        toggleColor: Theme.of(context).colorScheme.onSecondary,
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (value) {
                            setState(() {
                              Preferences.notifMail = value;
                            });
                        },
                      ),
                    )
                  ]
                ),
                style: ButtonStyles.notificationSwitch(context),
              ),
              Divider(color:Color(0x0000ffff)),
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.phone_android_outlined,),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text('En el dispositivo'),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 6,width: SizeConfig.safeBlockHorizontal! * 15,
                      child: FlutterSwitch(
                        width:60,
                        value: Preferences.notifPhone,
                        activeSwitchBorder: Border.all(color: Colors.black),
                        inactiveSwitchBorder: Border.all(color: Colors.black),
                        activeColor: Color(0xff000A23),
                        toggleColor: Theme.of(context).colorScheme.onSecondary,
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (value) {
                            setState(() {
                              Preferences.notifPhone = value;
                            });
                        },
                      ),
                    )
                  ]
                ),
                style: ButtonStyles.notificationSwitch(context),
              ),
          ],
        ),
      ),
    );
  }
  


}