
import 'package:flutter/material.dart';
import 'package:pruebas/class/rules_group_class.dart';
import 'package:pruebas/widgets/group.dart';
import '../class/photos_group_class.dart';
import '../class/sentences_group_class.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
import '../utils/media_query.dart';


class GroupScreen extends StatefulWidget {

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

var db = Mysql();
  var name_group = '';
  int members = 0;
  DateTime date = DateTime.now();
  int id_group = 0;
  var profile_name ='';
  var adminGroup = '';
  var uid = uidUser;
  var photo_group ='https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png';
  bool loading = true;

  bool loadingPhotos = true;
  var urlPhoto = '';
  int contResultsPhotos = 0;
  List<Photos_Group> groupPhotosList = [];

  bool loadingSentences = true;
  var sentence = '';
  var dateSentence = '';
  var sentenceProfileName = '';
  var photoSentence = '';
  int contResultsSentences = 0;
  List<Sentences_Group> groupSentencesList = [];

  var rule = '';
  var pointsRule = '';
  bool loadingRulePlus = true;
  bool loadingRuleSus = true;
  List<Rules_Group> rulesGroupPlusList = [];
  List<Rules_Group> rulesGroupSusList = [];
  int contResults = 0;
  int contResultsSus = 0;


class _GroupScreenState extends State<GroupScreen> {

   getCustomer() {
    db.getConnection().then((conn) {
      String sql = 'SELECT A.NAME_GROUP, A.MEMBERS, A.DATE_CREATION, A.ID_GROUP, A.ADMIN, A.PHOTO FROM GROUP_TABLE A, GROUP_MEMBERS_TABLE B WHERE B.UID = '+ uid +' AND A.ID_GROUP = B.ID_GROUP;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            setState(() {
            name_group = row[0];
            members = row[1];
            date = row[2];
            id_group = row[3];
            adminGroup = row[4];
            photo_group = row[5];
            loading = false;
          });
          }
        }
      });
      conn.close();
    });
  }

  getGroupPhotos() {
    db.getConnection().then((conn) {
      String sql = 'SELECT B.PHOTO FROM PHOTOS_GROUP_TABLE B, GROUP_MEMBERS_TABLE C WHERE C.UID = '+ uid +' AND B.ID_GROUP = C.ID_GROUP;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loadingPhotos){
            setState(() {
            contResultsPhotos++;
            urlPhoto = row[0];
            
            groupPhotosList.add(Photos_Group(urlPhoto));

            if(contResultsPhotos == results.length){
              loadingPhotos = false;
            }
          });
          }
        }
      });
      conn.close();
    });
  }

  getSentencesGroup() {
    db.getConnection().then((conn) {
      String sql = 'SELECT A.SENTENCE, A.DATE, B.PHOTO, B.USER_NAME FROM SENTENCES_GROUP_TABLE A, USER_TABLE B WHERE A.ID_GROUP =' + id_group.toString()+' AND A.UID = B.UID;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loadingSentences){
            setState(() {
            contResultsSentences++;
            sentence = row[0];
            dateSentence = row[1].toString();
            photoSentence = row[2];
            sentenceProfileName = row[3];

            
            groupSentencesList.add(Sentences_Group(sentence,dateSentence,photoSentence,sentenceProfileName));

            if(contResultsSentences == results.length){
              loadingSentences = false;
            }
          });
          }
        }
      });
      conn.close();
    });
  }

  getrulesGroupSusList() {
    db.getConnection().then((conn) {
      String sql = 'SELECT B.POINTS, B.RULE FROM GROUP_TABLE A, RULES_GROUP_TABLE B WHERE A.ID_GROUP = '+id_group.toString()+' AND SUBSTR(POINTS,1,1) = ' '"'+'-'+'"'+' ORDER BY CAST(SUBSTR(POINTS,1) AS SIGNED) DESC;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loadingRuleSus){
            setState(() {
              contResultsSus++;
            pointsRule = row[0];
            rule = row[1];

            rulesGroupSusList.add(Rules_Group(pointsRule, rule));

            if(contResultsSus == results.length){
              loadingRuleSus = false;
            }
          });
          }
        }
      });
      conn.close();
    });
  }

  getRulesPlusGroup() {
    db.getConnection().then((conn) {
      String sql = 'SELECT B.POINTS, B.RULE FROM GROUP_TABLE A, RULES_GROUP_TABLE B WHERE A.ID_GROUP = '+id_group.toString()+' AND SUBSTR(POINTS,1,1) = ' '"'+'+'+'"'+' ORDER BY CAST(SUBSTR(POINTS,1) AS SIGNED) ASC;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loadingRulePlus){
            setState(() {
              contResults++;
            pointsRule = row[0];
            rule = row[1];

            rulesGroupPlusList.add(Rules_Group(pointsRule, rule));

            if(contResults == results.length){
              loadingRulePlus = false;
            }
          });
          }
        }
      });
      conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    getCustomer();
    getRulesPlusGroup();
    getrulesGroupSusList();
    getGroupPhotos();
    getSentencesGroup();
    return SizedBox(
      width: SizeConfig.safeBlockHorizontal! * 100,
      height: SizeConfig.safeBlockVertical! * 97,
      child: Scaffold(
        body: Stack(
          children: [
           Group()
          ],
        ),
        //bottomNavigationBar: CustomBottonNavigation(),
   ),
    );
  }
}

