// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../firebase_utils/mysql.dart';
import '../utils/buttons_style.dart';
import '../utils/globals_variables.dart';
import '../utils/media_query.dart';

class InputsCreateGroup extends StatefulWidget {

  @override
  _CreateGroupState createState() => _CreateGroupState();

}
class _CreateGroupState extends State<InputsCreateGroup> {

String _name='';
String _pass='';
String _size ='';

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
            Text('Crea tu grupo', style: TextStyle(fontSize: 19, color: Colors.black,fontFamily: 'Audiowide')),
            SizedBox(height: SizeConfig.safeBlockVertical! * 12,),
            _crearName(),
            Divider(color:Color(0x0000ffff)),
            _groupSize(),
            Divider(color:Color(0x0000ffff)),
            _crearPassword(),
            Divider(color:Color(0x0000ffff)),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton(
              style: ButtonStyles.createGroup(context),
              onPressed: () {
                _createGroup();
              Navigator.popAndPushNamed(context, 'index');
              },
              child: const Text('Crear'),
            ),
          ],
        ),
      ),
    );
  }
  
  _crearName() {
    return TextField(
      keyboardType: TextInputType.name,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Equipo A',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35)),
        labelText: 'Nombre del Grupo',
        labelStyle: TextStyle(color: Color(0xff000A23)),
        suffixIcon: Icon(Icons.people_outline_sharp, color: Color(0xff000A23)),
        icon: Icon(Icons.people, color: Color(0xff000A23),)
      ),
      onChanged: (valor){
        setState(() {
          _name = valor;
        });
      },
    );
  }

  _groupSize() {
    return TextField(
      obscureText: false,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide'),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: '10',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35)),
        labelText: 'Tamaño del grupo',
        labelStyle: TextStyle(color: Color(0xff000A23)),
        suffixIcon: Icon(Icons.person_add_outlined, color: Color(0xff000A23)),
        icon: Icon(Icons.format_list_numbered_rounded, color: Color(0xff000A23),)
      ),
      onChanged: (valor){
        setState(() {
          _size = valor;
        });
      },
    );
  }

  _crearPassword() {
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
        suffixIcon: Icon(Icons.lock_open, color: Color(0xff000A23)),
        icon: Icon(Icons.lock, color: Color(0xff000A23),)
      ),
      onChanged: (valor){
        setState(() {
          _pass = valor;
        });
      },
    );
  }

  void _createGroup() {

    var db = Mysql();
    var nameGroup = _name;
    var uid = uidUser;
    var pass = _pass;
    var profileName = '';
    var userName = '';
    var photoGroup = 'https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png';
    var size = _size.toString();
    var idGroup;
    bool loading = true;

    db.getConnection().then((conn) async{
      String sql = getMaxIdGroupForNewGroup;
      await conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            idGroup = row[0] + 1;
            idGroup = idGroup.toString();
            profileName = row[1];
            userName = row[2];
            print('llega');
              String insertGroupTable = 'INSERT INTO GROUP_TABLE VALUES(' +idGroup+ ',' +'"'+nameGroup+'"'+ ', NOW()' +', 1'+ ','+size+','+'"'+pass+'"'+','+'"'+photoGroup+'"'+','+'"'+profileName+'"'+ ');';
               conn.query(insertGroupTable);
              print('llega 2');
              String insertGroupMembersTable = 'INSERT INTO GROUP_MEMBERS_TABLE VALUES(' +idGroup+ ',' +'"'+nameGroup+'"'+ ',' +'"'+userName+'"'+',' +uid+',0,"Yes");';
               conn.query(insertGroupMembersTable);
            
            loading = false;
          }
        }
      });
    });
  }


}