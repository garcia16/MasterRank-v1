// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/buttons_style.dart';
import 'package:pruebas/utils/media_query.dart';
import 'package:pruebas/widgets/update_points.dart';

import '../firebase_utils/mysql.dart';
import '../screens/index_screen.dart';
import '../utils/globals_variables.dart';

class UpdatePointsMember extends StatefulWidget {

  @override
  _UpdatePointsMemberState createState() => _UpdatePointsMemberState();

}
class _UpdatePointsMemberState extends State<UpdatePointsMember> {

bool viewVisible = false;
bool sum =false;
bool res =false;
String _reason='';
String _points='';
int contResults = 0;

void hideWidget() {
    setState(() {
      viewVisible = true;
    });
}

  @override
  Widget build(BuildContext context) {

    List<bool> _selections = List.generate(3, (_)=>false);

    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Actualizar Ranlking', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.07,)),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: SizeConfig.safeBlockVertical! * 0.5,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Hero(
                      tag: 'profile_image',
                      child: Image.network(photoUpdate,
                                    width: SizeConfig.screenWidth! * 0.35,
                                    height: SizeConfig.screenWidth! * 0.35,
                                    fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nameUpdate, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.06,)),
                      Text(userUpdate, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.tertiary)),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 3,),
                      Row(
                        children: [
                          Text('Puntos actuales:', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.outline)),
                          Text(pointsUpdate.toString(), style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.045, color: Theme.of(context).colorScheme.tertiary)),
                        ],
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                      
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyles.updatePointsMember(context),
                        onPressed: () {
                          hideWidget();
                          setState(() {
                            buttonColor1 = Colors.blue;
                            buttonColor2 = Color(0xff000A23);
                          });
                          sum = true;
                          res = false;
                        },
                        child:  Text('Sumar',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                      ),
                      SizedBox(width: SizeConfig.safeBlockHorizontal! * 4),
                      ElevatedButton(
                        style: ButtonStyles.updatePointsMemberRes(context),
                        onPressed: () {
                          hideWidget();
                          setState(() {
                            buttonColor2 = Colors.blue;
                            buttonColor1 = Color(0xff000A23);
                          });
                          res = true;
                          sum = false;
                        },
                        child:  Text('Restar',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 4),
                  Visibility(
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    visible: viewVisible,
                    child: Column(
                      children: [
                        _actuPoints(context),
                        SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                        _actuWhy(context),
                        SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                        ElevatedButton(
                          style: ButtonStyles.updatePointsMemberSave(context),
                          onPressed: () {
                            buttonColor1 = Color(0xff000A23);
                            buttonColor2 = Color(0xff000A23);
                            updatePointsUser();
                            rankingUser.clear();
                            historyRanking.clear();
                            Navigator.pushNamed(context, 'index');
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: CustomSnackBarPointsContent(),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              duration: Duration(seconds: 1),
                            ),
                          );
                          },
                          child:  Text('Guardar',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updatePointsUser(){
    var db = Mysql();
    var uid = uidUser;
    bool loading = true;
    String updateSQL = '';
    String insertSQL = '';
    int newPoints = 0;
    if(sum){
      newPoints = pointsUpdate + int.parse(_points);
      updateSQL = 'UPDATE GROUP_MEMBERS_TABLE SET POINTS = '+'"'+ newPoints.toString()+'"'+' WHERE ID_GROUP = '+'"'+idGroupUpdate.toString()+'"'+' AND UID = '+'"'+uidUpdate+'"';
      insertSQL = 'INSERT INTO HISTORY_UPDATE_POINTS_TABLE VALUES(' +idGroupUpdate.toString()+ ','+'"'+groupTextIndex+'"'+ ','+'"'+_reason+'"'+ ','+'"'+'+'+_points.toString()+'"'+ ','+'"'+uidUpdate+'"'+ ','+'"'+nameUpdate+'"'+ ','+uidUser+ ', NOW()' +')';
    }else{
      newPoints = pointsUpdate - int.parse(_points);
      updateSQL = 'UPDATE GROUP_MEMBERS_TABLE SET POINTS = '+'"'+ newPoints.toString()+'"'+' WHERE ID_GROUP = '+'"'+idGroupUpdate.toString()+'"'+' AND UID = '+'"'+uidUpdate+'"';
      insertSQL = 'INSERT INTO HISTORY_UPDATE_POINTS_TABLE VALUES(' +idGroupUpdate.toString()+ ','+'"'+groupTextIndex+'"'+ ','+'"'+_reason+'"'+ ','+'"'+'-'+_points.toString()+'"'+ ','+'"'+uidUpdate+'"'+ ','+'"'+nameUpdate+'"'+ ','+uidUser+ ', NOW()' +')';

    }
    
    db.getConnection().then((conn) async {
    await conn.query(updateSQL);
    await conn.query(insertSQL);

  conn.close();

  });

  }

  _actuPoints(BuildContext context) {
    return TextField(
      obscureText: false,
      style: TextStyle(fontFamily: 'Audiowide'),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        hintText: '10',
        labelText: 'Introduce los puntos',
        labelStyle: TextStyle( fontSize: SizeConfig.screenWidth! * 0.04),
      ),
      onChanged: (valor){
        setState(() {
          _points = valor;
        });
      },
    );
  }

  _actuWhy(BuildContext context) {
    return TextField(
      obscureText: false,
      maxLines: 5,
      style: TextStyle(fontFamily: 'Audiowide'),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        hintText: 'Descripción del motivo de la suma/resta de puntos',
        labelText: 'Introduce el motivo',
        labelStyle: TextStyle( fontSize: SizeConfig.screenWidth! * 0.04),
      ),
      onChanged: (valor){
        setState(() {
          _reason = valor;
        });
      },
    );
  }

}