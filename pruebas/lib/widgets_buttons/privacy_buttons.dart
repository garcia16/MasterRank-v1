// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pruebas/utils/media_query.dart';
import '../share_preferences/preferences.dart';
import '../utils/buttons_style.dart';

class PrivacyButtons extends StatefulWidget {

  @override
  _PrivacyButtonsState createState() => _PrivacyButtonsState();

}
class _PrivacyButtonsState extends State<PrivacyButtons> {

  String _nombre='';

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
                icon: Icon(Icons.person), 
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text('Perfil público'),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 6,width: SizeConfig.safeBlockHorizontal! * 15,
                      child: FlutterSwitch(
                        width:60,
                        value: Preferences.publicAccount,
                        activeSwitchBorder: Border.all(color: Colors.black),
                        inactiveSwitchBorder: Border.all(color: Colors.black),
                        activeColor: Color(0xff000A23),
                        toggleColor: Theme.of(context).colorScheme.onSecondary,
                        activeToggleColor: Colors.white,
                        inactiveColor: Colors.white,
                        onToggle: (value) {
                            setState(() {
                              Preferences.publicAccount = value;
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
  
  _editPassword() {

    return TextField(
      autofocus: false,
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        hintText: 'Contraseña actual',
        labelText: 'Contaseña actual',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.background)
        //suffixIcon: Icon(Icons.description_rounded, color: Color(0xff000A23)),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

 _newPassword() {

    return TextField(
      autofocus: false,
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        hintText: 'Nueva contraseña',
        labelText: 'Nueva contraseña',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.background)
        //suffixIcon: Icon(Icons.description_rounded, color: Color(0xff000A23)),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }
  
}
