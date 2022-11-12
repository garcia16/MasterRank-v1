// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pruebas/utils/media_query.dart';
import '../screens/group_screen.dart';
import '../widgets_buttons/group_buttons.dart';

class Group extends StatefulWidget {

  @override
  _GroupState createState() => _GroupState();

}
class _GroupState extends State<Group> {

  @override
  Widget build(BuildContext context) {
    String date_group = DateFormat('yyyy-MM-dd').format(date);
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Grupo', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider( color: Theme.of(context).colorScheme.outline ,thickness: 4, height: SizeConfig.safeBlockVertical! * 0.5,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 18,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Hero(
                      tag: 'group_image',
                      child: Image.network(photo_group,
                                    width: SizeConfig.screenWidth! * 0.32,
                                    height: SizeConfig.screenHeight! * 0.14,
                                    fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05, )),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                      Row(
                        children: [
                          Text('Administrador:', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035,)),
                          Text(adminGroup, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035, color: Theme.of(context).colorScheme.tertiary)),
                        ]
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 0.7,),
                      Row(
                        children: [
                          Text('Miembros:', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035, )),
                          Text(members.toString(), style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035, color: Theme.of(context).colorScheme.tertiary)),
                        ]
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 0.7,),
                      Row(
                        children: [
                          Text('Creación:', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035, )),
                          Text(date_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035, color: Theme.of(context).colorScheme.tertiary)),
                        ]
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 0.7,),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text('ID:', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035,)),
                              Text(id_group.toString(), style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035, color: Theme.of(context).colorScheme.tertiary)),
                            ]
                          ),
                          SizedBox( width: SizeConfig.safeBlockHorizontal! * 1),
                        ]
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 64,
              child: GroupButtons()
            ),
          ],
        ),
      ),
    );
  }
  


}