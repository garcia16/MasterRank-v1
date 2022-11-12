// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../firebase_utils/mysql.dart';
import '../screens/group_screen.dart';
import '../screens/index_screen.dart';
import '../utils/buttons_style.dart';
import '../utils/globals_variables.dart';
import '../widgets/edit_group.dart';

class EditGroupButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
        child: SizedBox(
          height: SizeConfig.safeBlockVertical! * 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(color:Color(0x0000ffff)),
              ElevatedButton.icon(
                onPressed: (){
                  _checkAdmin(context);
                  
                },
                icon: Icon(Icons.save_alt_sharp,size: iconArrowMax.size,), 
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text('Guardar cambios',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                    Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                  ]
                ),
                style: ButtonStyles.editGroup(context),
              ),
              Divider(color:Color(0x0000ffff)),
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.delete_forever), 
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    Text('Reiniciar Ranking',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 18),
                  ]
                ),
                style: ButtonStyles.editGroupRed(context),
              ),
              Divider(color:Color(0x0000ffff)),
              
            ],
          ),
        ),
      ),
    );
  }

  _checkAdmin(BuildContext context){
    bool adminCheck = false;
    bool loading = true;
    String admin = '';
    db.getConnection().then((conn) {
      String sql = 'SELECT ADMIN FROM GROUP_MEMBERS_TABLE WHERE UID = '+ uid +' AND ID_GROUP = '+id_group.toString()+';';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            admin = row[0];
            if(admin == 'Yes'){
              adminCheck = true;
              _updateGroup(context);
              rankingUser.clear();
              historyRanking.clear();
              groupTextIndex = newName;
              name_group = newName;

              Navigator.popAndPushNamed(context, 'index');
              
              //Navigator.popAndPushNamed(context, 'group');

            }else{
              adminCheck = false;
              print('Debes ser Administrador para modificar un Grupo');
            }
            loading = false;
          }
        }
      });
      conn.close();
    });
  }
  

  _updateGroup(BuildContext context){
    var db = Mysql();

    if(newName.isEmpty && pass.isNotEmpty && passConfirm.isNotEmpty){
      String updateSQL = '';
      updateSQL = 'UPDATE GROUP_TABLE SET PASSWORD = '+'"'+pass+'"'+' WHERE ID_GROUP = '+id_group.toString()+' ;';

      db.getConnection().then((conn) async {
      await conn.query(updateSQL);

      conn.close();

      });
      /*
      rankingUser.clear();
      historyRanking.clear();
      Navigator.popAndPushNamed(context, 'index');
      */
    }

    if(newName.isNotEmpty && pass.isEmpty && passConfirm.isEmpty){
      String updateSQLGroup = '';
      String updateSQLGroupMembers = '';
      String updateSQLGroupHistory = '';
      String updateSQLGroupRules = '';
      String updateSQLGroupPhotos = '';
      updateSQLGroup = 'UPDATE GROUP_TABLE SET NAME_GROUP = '+'"'+newName+'"'+' WHERE ID_GROUP = '+id_group.toString()+' ;';
      updateSQLGroupMembers = 'UPDATE GROUP_MEMBERS_TABLE SET NAME_GROUP = '+'"'+newName+'"'+' WHERE ID_GROUP = '+id_group.toString()+' ;';
      updateSQLGroupHistory = 'UPDATE HISTORY_UPDATE_POINTS_TABLE SET NAME_GROUP = '+'"'+newName+'"'+' WHERE ID_GROUP = '+id_group.toString()+' ;';
      updateSQLGroupRules = 'UPDATE RULES_GROUP_TABLE SET NAME_GROUP = '+'"'+newName+'"'+' WHERE ID_GROUP = '+id_group.toString()+' ;';
      updateSQLGroupPhotos = 'UPDATE PHOTOS_GROUP_TABLE SET NAME_GROUP = '+'"'+newName+'"'+' WHERE ID_GROUP = '+id_group.toString()+' ;';
      

      db.getConnection().then((conn) async {
      await conn.query(updateSQLGroup);
      await conn.query(updateSQLGroupMembers);
      await conn.query(updateSQLGroupHistory);
      await conn.query(updateSQLGroupRules);
      await conn.query(updateSQLGroupPhotos);

      conn.close();

      });

      
    }
  }

}