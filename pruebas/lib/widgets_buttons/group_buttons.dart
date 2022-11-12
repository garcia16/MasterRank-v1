// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../utils/buttons_style.dart';

class GroupButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: (){
                //EditGroup();
                Navigator.pushNamed(context, 'edit_group');
              },
              icon: Icon(Icons.edit_rounded,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Editar Grupo',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.group(context),
            ),
            Divider(color:Color(0x0000ffff),height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'members');
              },
              icon: Icon(Icons.people_alt,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                   Text('Miembros',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.group(context),
            ),
            Divider(color:Color(0x0000ffff),height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'history');
              },
              icon: Icon(Icons.text_snippet,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Historial',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.group(context),
            ),
            Divider(color:Color(0x0000ffff),height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton.icon(
              onPressed: (){
                 Navigator.pushNamed(context, 'sentences');
              },
              icon: Icon(Icons.textsms_rounded,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Frases'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.group(context),
            ),
            Divider(color:Color(0x0000ffff),height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'photo');
              },
              icon: Icon(Icons.photo_library,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Fotos',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.group(context),
            ),
            Divider(color:Color(0x0000ffff),height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, 'rules');
              },
              icon: Icon(Icons.rule_folder,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Reglas',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.group(context),
            ),
          ],
        ),
      ),
    );
  }
  


}