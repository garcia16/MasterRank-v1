// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';

import '../firebase_utils/mysql.dart';
import '../screens/group_screen.dart';
import '../screens/index_screen.dart';
import '../utils/buttons_style.dart';
import '../utils/globals_variables.dart';


class AddSentences extends StatefulWidget {

  @override
  _AddSentencesState createState() => _AddSentencesState();

}
class _AddSentencesState extends State<AddSentences> {

bool newValueSum = false;
bool newValue2Sum = false;

bool newValueRes = false;
bool newValue2Res = false;

bool viewVisible1 = false;
bool viewVisible2 = false;
String _sentence='';

String myInitialitiItem = 'Nombre';
String autorSentence = profileNamesRanking.first;

Color backGround1= Colors.white;
Color backGround2 = Colors.white;



int selectedIndex=0;

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
            Text('Añadir frase', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: 2,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Rellena los campos para añadir una nueva frase al grupo', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04,)),
                SizedBox(height: SizeConfig.safeBlockVertical! * 4),
                _sentenceField(context),
                
                DropdownButton(
                  hint: Text('Nombre'),
                  icon: Icon(Icons.arrow_downward_outlined,color: Theme.of(context).colorScheme.background,),
                  iconSize: 30,
                  dropdownColor: Theme.of(context).colorScheme.onSecondary,
                  style: TextStyle(color: Theme.of(context).colorScheme.background,fontSize: 16,fontFamily: 'Audiowide'),
                  focusColor: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(20),
                  onChanged: ( value ) {
                    
                    setState(() {
                      myInitialitiItem = value as String;
                      autorSentence = value;
                    });
                  },
                  value: autorSentence,
                  items: profileNamesRanking.map((items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  
                ),
                SizedBox(height: SizeConfig.safeBlockVertical! * 10),

                ElevatedButton(
                  style: ButtonStyles.updatePointsMemberSave(context),
                  onPressed: () {
                    addNewSentence();
                    //Navigator.pop(context);
                    
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ), 
          ],
        ),
      ),
    );
  
  }

  _sentenceField(BuildContext context) {
    return TextField(
      obscureText: false,
      maxLines: 2,
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
        hintText: 'Frase',
        labelText: 'Introduce la frase',
        labelStyle: TextStyle( fontSize: 14),
      ),
      onChanged: (valor){
        setState(() {
          _sentence = valor;
        });
      },
    );
  }

  void addNewSentence() {

    var db = Mysql();
    String insertSQL = '';
    String uidAutor = '';
    String autorSQL = '';
    bool loadingAutor = true;

    if (_sentence.isNotEmpty){

      /*Esta SELECT no se está ejecutando*/

      autorSQL = 'SELECT A.UID FROM USER_TABLE A, GROUP_MEMBERS_TABLE B WHERE A.PROFILE_NAME = ' + '"'+autorSentence+'"'+ ' AND A.USER_NAME = B.USER_NAME AND B.ID_GROUP = ' + id_group.toString() +' ;' ;
      db.getConnection().then((conn) async{
        await conn.query(autorSQL).then((results) {
          for(var row in results){
            if (loadingAutor){
              uidAutor = row[0];
              loadingAutor = false;
            }
          }
        });
        conn.close();
      });

      insertSQL = 'INSERT INTO SENTENCES_GROUP_TABLE VALUES(' +id_group.toString()+ ','+'"'+name_group+'"'+ ','+'"'+_sentence+'"'+ ','+uidAutor+ ','+'"'+autorSentence+'"'+','+'NOW())';
      db.getConnection().then((conn) async {
        await conn.query(insertSQL);

        conn.close();

      });

      rulesGroupPlusList.clear();
      rulesGroupSusList.clear();
      rankingUser.clear();
      historyRanking.clear();
      groupSentencesList.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarSentenceContent(),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: Duration(seconds: 1),
        ),
      );
      Navigator.popAndPushNamed(context, 'index');
      //Navigator.pop(context);

    }else{

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomSnackBarSentenceFailedContent(),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: Duration(seconds: 2),
        ),
      );
    }

  }
}