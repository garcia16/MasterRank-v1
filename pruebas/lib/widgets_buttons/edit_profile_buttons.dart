// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/globals_variables.dart';
import '../firebase_utils/mysql.dart';
import '../screens/group_screen.dart';
import '../screens/index_screen.dart';
import '../utils/buttons_style.dart';
import '../widgets/edit_profile.dart';

class EditProfileButtons extends StatelessWidget {

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
                _updateProfile(context);
              },
              icon: Icon(Icons.save_alt_sharp,size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Guardar cambios'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.editProfile(context),
            ),
          ],
        ),
      ),
    );
  }
  
  _updateProfile(BuildContext context){
    var db = Mysql();

    if(newName.isEmpty && newUser.isEmpty && newDescription.isNotEmpty){
      String updateSQL = '';
      updateSQL = 'UPDATE USER_TABLE SET DESCRIPTION = '+'"'+newDescription+'"'+' WHERE UID = '+uidUser+' ;';

      db.getConnection().then((conn) async {
      await conn.query(updateSQL);

      conn.close();

      });
      rankingUser.clear();
      historyRanking.clear();
      Navigator.popAndPushNamed(context, 'index');
    }

    if(newName.isNotEmpty && newUser.isEmpty && newDescription.isEmpty){
      String updateSQLUser= '';
      String updateSQLUserHistory = '';
      updateSQLUser = 'UPDATE USER_TABLE SET PROFILE_NAME = '+'"'+newName+'"'+' WHERE UID = '+uidUser+' ;';
      updateSQLUserHistory = 'UPDATE HISTORY_UPDATE_POINTS_TABLE SET NAME_GROUP = '+'"'+newName+'"'+' WHERE UID = '+uidUser+';';

      db.getConnection().then((conn) async {
      await conn.query(updateSQLUser);
      await conn.query(updateSQLUserHistory);

      conn.close();

      });

      rankingUser.clear();
      historyRanking.clear();
      Navigator.popAndPushNamed(context, 'index');
    }
  }


}