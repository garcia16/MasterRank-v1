import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pruebas/class/ranking_user_class.dart';
import 'package:pruebas/screens/group_screen.dart';
import 'package:pruebas/utils/home_body.dart';
import 'package:pruebas/widgets/custom_bottom_navigation.dart';
import '../class/history_ranking_class.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
class IndexScreen extends StatefulWidget {

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

String groupTextIndex = '';
List<Ranking_User> rankingUser = [];
List<History_Ranking> historyRanking = [];
List<String> profileNamesRanking = [];

class _IndexScreenState extends State<IndexScreen> {

  var db = Mysql();
  bool loading = true;
  //VARIABLES LISTA RANKING
  var nameRank = '';
  var userName = '';
  var photo = '';
  var uidListUser = '';
  int idGroupRank = 0;
  int points = 0;
  int idGroupFinal = idGroup;
  var uid = uidUser;
  int contResults = 0;

  //VARIABLES LISTA HISTORIAL
  var profileNameHistory = '';
  var pointsHistory = '';
  var reasonHistory = '';
  var dateHistory = '';
  var photoHistory = '';
  int contResultsHistory = 0;
  bool loadingHistory = true;
  Color colorHistory = Color.fromARGB(255, 0, 255, 8);

  @override
  Widget build(BuildContext context) {

    _getRankingInfoUsers();
    _getHistoryInfo(); 

    return Scaffold(
      body: Stack(
        children: [
          HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottonNavigation(),
   );
  }

void _getRankingInfoUsers() {
  db.getConnection().then((conn) async {
  String sql = 'SELECT B.PROFILE_NAME, A.POINTS,B.PHOTO,B.UID,B.USER_NAME,A.NAME_GROUP,A.ID_GROUP FROM GROUP_MEMBERS_TABLE A, USER_TABLE B  WHERE  A.UID = B.UID AND A.ID_GROUP = (SELECT ID_GROUP FROM GROUP_MEMBERS_TABLE WHERE UID = '+ uid +') ORDER BY A.POINTS DESC;';
    await conn.query(sql).then((results) {
      for(var row in results){
        if (loading){
            
            setState(() {
              contResults++;
              nameRank = row[0];
              points = row[1];
              photo = row[2];
              uidListUser = row[3];
              userName = row[4];
              groupTextIndex = row[5];
              idGroupRank = row[6];
              rankingUser.add(Ranking_User(nameRank, points,photo,uidListUser,userName,idGroupRank));
              profileNamesRanking.add(nameRank);

              if(contResults == results.length){
                loading = false;
              }
              
            });
          
        }
      }
    });

  conn.close();

  });
}

void _getHistoryInfo() {
  db.getConnection().then((conn) async {
  String sql = 'SELECT A.PROFILE_NAME, A.POINTS, A.REASON, A.DATE, B.PHOTO FROM HISTORY_UPDATE_POINTS_TABLE A, USER_TABLE B WHERE A.ID_GROUP = '+idGroupRank.toString()+' AND A.UID = B.UID ORDER BY DATE DESC';
    await conn.query(sql).then((results) {
      for(var row in results){
        if (loadingHistory){
          setState(() {
            contResultsHistory++;
            profileNameHistory = row[0];
            pointsHistory = row[1];
            reasonHistory = row[2];
            dateHistory = DateFormat('dd-MM-yyyy').format(row[3]);
            photoHistory = row[4];
            if(pointsHistory.contains('+')){
              colorHistory = Color.fromARGB(255, 0, 255, 8);
            }
            if(pointsHistory.contains('-')){
              colorHistory = Color.fromARGB(255, 255, 0, 0);
            }
            historyRanking.add(History_Ranking(profileNameHistory, pointsHistory,reasonHistory,dateHistory,photoHistory,colorHistory));

            if(contResultsHistory == results.length){
              loadingHistory = false;
            }
            
          });
        }
      }
    });

  conn.close();

  });
}




}

