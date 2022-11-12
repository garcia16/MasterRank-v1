// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/screens/group_screen.dart';
import 'package:pruebas/utils/buttons_style.dart';
import 'package:pruebas/utils/media_query.dart';
import '../screens/index_screen.dart';
import '../widgets_buttons/members_buttons.dart';

class Members extends StatefulWidget {

  @override
  _MembersState createState() => _MembersState();

}
class _MembersState extends State<Members> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Miembros', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 1),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05,)),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 0.5),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 72,
                      child: ListView.builder(
                      itemCount: rankingUser.length,
                      itemBuilder: (context,index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 2),
                                  child: ClipOval(
                                    child: Image.network(rankingUser[index].photo,
                                      width: SizeConfig.screenWidth! * 0.3,
                                      height: SizeConfig.screenWidth! * 0.27,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.05),
                                  child: Column(
                                    children: [
                                      Text(rankingUser[index].profileName,style: TextStyle( fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035),),
                                      ElevatedButton.icon(
                                        onPressed: (){
                                          
                                          //Navigator.pushNamed(context, 'update_points_member');
                                        },
                                        icon: Icon(Icons.remove_red_eye_rounded,size: SizeConfig.screenWidth! * 0.050), 
                                        label: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(''),
                                            Text('Ver Perfil',style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035),),
                                            Icon(Icons.arrow_forward_ios_outlined, size: SizeConfig.screenWidth! * 0.045,),
                                          ]
                                        ),
                                        style: ButtonStyles.updatePoints(context)
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                            
                          ],
                        ),
                        
                      )
                    )
                ],
              ),
            ),
            //SizedBox(height: 50,),
            MembersButtons(),
          ],
        ),
      ),
    );
  }
}