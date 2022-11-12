// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';

import '../firebase_utils/mysql.dart';
import '../screens/group_screen.dart';
import '../screens/index_screen.dart';
import '../utils/buttons_style.dart';
import '../utils/globals_variables.dart';


class AddRules extends StatefulWidget {

  @override
  _AddRulesState createState() => _AddRulesState();

}
class _AddRulesState extends State<AddRules> {

bool newValueSum = false;
bool newValue2Sum = false;

bool newValueRes = false;
bool newValue2Res = false;

bool viewVisible1 = false;
bool viewVisible2 = false;
String _reason='';
String _points='';

Color backGround1= Colors.white;
Color backGround2 = Colors.white;

void hideWidget() {
    setState(() {
      if (newValue2Sum){
        viewVisible1 = true;
        viewVisible2 = false;
      }else{
        viewVisible1 = false;
      }
      
      
    });
}
void hideWidget2() {
    setState(() {
      if (newValue2Res){
        viewVisible2 = true;
        viewVisible1 = false;
      }else{
        viewVisible2 = false;
      }

    });
}

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Añadir regla', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Rellena los campos para añadir una nueva regla en tu grupo', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04,)),
                SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ), 
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: backGround1,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), 
                    ],
                  ), 
                  child: CheckboxListTile(
                    title:  Text('Suma',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                    subtitle:  Text(
                        'Esta regla se mostrará en el apartado de reglas que suman puntos',style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                    secondary: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://w7.pngwing.com/pngs/972/334/png-transparent-computer-icons-add-logo-desktop-wallpaper-add.png"), //NetworkImage
                      radius: 20,
                    ),
                    autofocus: false,
                    isThreeLine: true,
                    activeColor: Color(0xff000A23),
                    checkColor: Colors.white,
                    selected: false,
                    value: newValue2Sum,
                    onChanged: (newValueSum) {
                      setState(() {
                        newValueRes = false;
                        newValue2Res = false;
                        
                        newValue2Sum = newValueSum!;
                        if (newValue2Sum){
                          backGround1 = Theme.of(context).colorScheme.primary;
                          backGround2 = Colors.white;
                        }else{
                          backGround1 = Colors.white;
                          backGround2 = Colors.white;
                        }
                        hideWidget();
                      });
                    },
                  ), 
                ),
                SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                Visibility(
                  maintainAnimation: false,
                  maintainSize: false,
                  maintainState: false,
                  visible: viewVisible1,
                  child: Column(
                    children: [
                      _actuPoints(context),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                      _actuWhy(context),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                      ElevatedButton(
                        style: ButtonStyles.addRuleSave(context),
                        onPressed: () {
                          addNewRule();
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: CustomSnackBarAddRuleContent(),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            duration: Duration(seconds: 1),
                          ),
                        );
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          3.0,
                          3.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: backGround2,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), 
                    ],
                  ), 
                  child: CheckboxListTile(
                    title:  Text('Resta',style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                    subtitle:  Text(
                        'Esta regla se mostrará en el apartado de reglas que restan puntos',style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                    secondary: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU60UkQfHG60JwekQYdgY_SzBPRa1dWES20ujo6h-X2PArCgI8Ft_uNFuS8kz8vHPSCAo&usqp=CAU"), //NetworkImage
                      radius: 20,
                    ),
                    autofocus: false,
                    isThreeLine: true,
                    activeColor: Color(0xff000A23),
                    checkColor: Colors.white,
                    selected: false,
                    value: newValue2Res,
                    onChanged: (newValueRes) {
                      setState(() {
                        newValueSum = false;
                        newValue2Sum = false;
                        
                        newValue2Res = newValueRes!;
                        if (newValue2Res){
                          backGround1 = Colors.white;
                          backGround2 = Theme.of(context).colorScheme.primary;
                        }else{
                          backGround1 = Colors.white;
                          backGround2 = Colors.white;
                        }
                        hideWidget2();
                      });
                    },
                  ), //CheckboxListTile
                ),
                SizedBox(height: SizeConfig.safeBlockVertical! * 4),
                Visibility(
                  maintainAnimation: false,
                  maintainSize: false,
                  maintainState: false,
                  visible: viewVisible2,
                  child: Column(
                    children: [
                      _actuPoints(context),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                      _actuWhy(context),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                      ElevatedButton(
                        style: ButtonStyles.addRuleSave(context),
                        onPressed: () {
                          addNewRule();
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: CustomSnackBarAddRuleContent(),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            duration: Duration(seconds: 1),
                          ),
                        );
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                )
              ],
            ), 
          ],
        ),
      ),
    );
  
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
        labelStyle: TextStyle( fontSize: 14),
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
        hintText: 'Descripción de la regla',
        labelText: 'Introduce la regla',
        labelStyle: TextStyle( fontSize: 14),
      ),
      onChanged: (valor){
        setState(() {
          _reason = valor;
        });
      },
    );
  }

  void checkBackground() {
    if(newValue2Sum){
      newValue2Sum = newValueSum;
      backGround1 = Colors.blue;
      backGround2 = Colors.white;
    }
    if(newValue2Res){
      newValue2Res = newValueRes;
      backGround2 = Colors.blue;
      backGround1 = Colors.white;
    }

  }

  void addNewRule() {

    var db = Mysql();
    String insertSQL = '';
    if(newValue2Sum){
      insertSQL = 'INSERT INTO RULES_GROUP_TABLE VALUES(' +id_group.toString()+ ','+'"'+name_group+'"'+ ','+'"'+'+'+_points.toString()+'"'+ ','+'"'+_reason+'"'+')';
    }else{
      insertSQL = 'INSERT INTO RULES_GROUP_TABLE VALUES(' +id_group.toString()+ ','+'"'+name_group+'"'+ ','+'"'+'-'+_points.toString()+'"'+ ','+'"'+_reason+'"'+')';
    }
    
    db.getConnection().then((conn) async {
      await conn.query(insertSQL);

      conn.close();

    });

    rulesGroupPlusList.clear();
    rulesGroupSusList.clear();
    rankingUser.clear();
    historyRanking.clear();
    //Navigator.popAndPushNamed(context, 'index');
    Navigator.pop(context);



  }
}