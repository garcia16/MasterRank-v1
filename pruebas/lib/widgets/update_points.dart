// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/buttons_style.dart';
import 'package:pruebas/utils/media_query.dart';

import '../screens/index_screen.dart';

class UpdatePoints extends StatefulWidget {

  @override
  _UpdatePointsState createState() => _UpdatePointsState();

}

int arrayPositionRanking=0;
String nameUpdate ='';
String uidUpdate ='';
String userUpdate ='';
int pointsUpdate =0;
String photoUpdate ='';
int idGroupUpdate = 0;
class _UpdatePointsState extends State<UpdatePoints> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Actualizar Ranking', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.07,)),
            Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: SizeConfig.safeBlockVertical! * 0.5,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 1),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('El Club del Pescador', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04,)),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 1),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 87,
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
                                  margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 1),
                                  child: ClipOval(
                                    child: Image.network(rankingUser[index].photo,
                                      width: SizeConfig.screenWidth! * 0.30,
                                      height: SizeConfig.screenWidth! * 0.25,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: SizeConfig.safeBlockVertical! * 3),
                                  child: Column(
                                    children: [
                                      Text(rankingUser[index].profileName,style: TextStyle( fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035),),
                                      ElevatedButton.icon(
                                        onPressed: (){
                                          arrayPositionRanking =index;
                                          nameUpdate = rankingUser[index].profileName;
                                          userUpdate= rankingUser[index].userName;
                                          photoUpdate = rankingUser[index].photo;
                                          uidUpdate = rankingUser[index].uid;
                                          pointsUpdate = rankingUser[index].points;
                                          idGroupUpdate = rankingUser[index].idGroupRank;

                                          Navigator.pushNamed(context, 'update_points_member');
                                        },
                                        icon: Icon(Icons.remove_red_eye_rounded,size: SizeConfig.screenWidth! * 0.05), 
                                        label: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(''),
                                            Text('Seleccionar',style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
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
          ],
        ),
      ),
    );
  }
}