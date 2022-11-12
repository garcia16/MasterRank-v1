// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/buttons_style.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
import '../utils/media_query.dart';

class InputsJoinGroup extends StatefulWidget {

  @override
  _JoinGroupState createState() => _JoinGroupState();

}
class _JoinGroupState extends State<InputsJoinGroup> {


String _id='';
String _pass='';


// ignore: prefer_final_fields
TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical! * 10,),
            Text('Master Rank', style: TextStyle(fontFamily: 'Audiowide',fontSize: 40, color: Color(0xff000A23))),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Text('Unirse a un grupo', style: TextStyle(fontSize: 19, color: Colors.black,fontFamily: 'Audiowide')),
            SizedBox(height: SizeConfig.safeBlockVertical! * 12,),
            _joinID(),
            Divider(color:Color(0x0000ffff)),
            _joinPassword(),
            Divider(color:Color(0x0000ffff)),
            SizedBox(height: 10,),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton(
              style: ButtonStyles.joinGroup(context),
              onPressed: () {
              _joinGroup();
              Navigator.popAndPushNamed(context, 'index');
              },
              child: const Text('Unirse'),
            ),
          ],
        ),
      ),
    );
  }
  
  _joinID() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'ID del Grupo',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35)),
        labelText: 'ID del Grupo',
        labelStyle: TextStyle(color: Color(0xff000A23)),
        icon: Icon(Icons.people, color: Color(0xff000A23),)
      ),
      onChanged: (valor){
        setState(() {
          _id = valor;
        });
      },
    );
  }

  _joinPassword() {
    return TextField(
      obscureText: true,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Password',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35)),
        labelText: 'Password',
        labelStyle: TextStyle(color: Color(0xff000A23)),
        icon: Icon(Icons.lock, color: Color(0xff000A23),)
      ),
      onChanged: (valor){
        setState(() {
          _pass = valor;
        });
      },
    );
  }

  

  void _joinGroup() {

    var db = Mysql();
    var id = _id;
    var uid = uidUser;
    var pass = '';
    var userName = '';
    int members = 0;
    int max_members = 0;
    bool loading = true;

    db.getConnection().then((conn) async{
      String sql = 'SELECT MEMBERS,PASSWORD,NAME_GROUP,(SELECT USER_NAME FROM USER_TABLE WHERE UID ='+uid+' ),MAX_MEMBERS FROM GROUP_TABLE WHERE ID_GROUP = '+ id +';';
      await conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            members = row[0] + 1;
            pass = row[1];
            userName = '"'+row[3]+'"';
            max_members = row[4];
            if(members < max_members){
              if(pass == _pass){
                db.getConnection().then((conn) async {
                String sqlInsert = 'INSERT INTO GROUP_MEMBERS_TABLE VALUES(' +id+ ',' +'"'+row[2]+'"'+ ',' +userName+ ',' +uid+ ', 0,"No");';
                String sqlUpdate = 'UPDATE GROUP_TABLE SET MEMBERS = '+members.toString()+' WHERE ID_GROUP = '+ id +';';
                await conn.query(sqlInsert);
                await conn.query(sqlUpdate);
                });
              }
            }else{
              print('El grupo está completo');
            }
            
            loading = false;
          }
        }
      });
    });
  }


}