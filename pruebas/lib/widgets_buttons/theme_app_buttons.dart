// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:pruebas/utils/buttons_style.dart';
import 'package:pruebas/utils/media_query.dart';
import '../providers/theme_provider.dart';
import '../share_preferences/preferences.dart';

class ThemeAppButtons extends StatefulWidget {

  @override
  _ThemeAppButtonsState createState() => _ThemeAppButtonsState();

}
class _ThemeAppButtonsState extends State<ThemeAppButtons> {
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
      icon: Icon(Icons.nightlight_round), 
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(''),
          Text('Modo noche'),
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 6,width: SizeConfig.safeBlockHorizontal! * 15,
            child: FlutterSwitch(
              width:60,
              value: Preferences.isDarkMode,
              activeSwitchBorder: Border.all(color: Colors.black),
              inactiveSwitchBorder: Border.all(color: Colors.black),
              activeColor: Color(0xff000A23),
              toggleColor: Colors.blue,
              activeToggleColor: Colors.white,
              inactiveColor: Colors.white,
              onToggle: (value) {
                  setState(() {
                    Preferences.isDarkMode = value;
                    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                    value 
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  });
              },
            ),
          )
        ]
      ),
      style: ButtonStyles.themeApp(context),
    ),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,)
          ],
        ),
      ),
    );
  }
}
