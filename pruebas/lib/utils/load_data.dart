
import 'package:intl/intl.dart';

import '../class/history_ranking_class.dart';
import '../class/ranking_user_class.dart';
import '../firebase_utils/mysql.dart';
import 'globals_variables.dart';

  getGroupInfo() {
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
    db.getConnection().then((conn) {
      String sql = 'SELECT A.NAME_GROUP, A.MEMBERS, A.DATE_CREATION, A.ID_GROUP, A.ADMIN, A.PHOTO FROM GROUP_TABLE A, GROUP_MEMBERS_TABLE B WHERE B.UID = '+ uid +' AND A.ID_GROUP = B.ID_GROUP;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            name_group = row[0];
            members = row[1];
            date = row[2];
            id_group = row[3];
            adminGroup = row[4];
            photo_group = row[5];
            loading = false;
          }
        }
      });
      conn.close();
    });
  }


class loadIndexData {

  String groupTextIndex = '';
List<Ranking_User> rankingUser = [];
List<History_Ranking> historyRanking = [];

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
  int contResults = 0;
  var uid = uidUser;
  //VARIABLES LISTA HISTORIAL
  var profileNameHistory = '';
  var pointsHistory = '';
  var reasonHistory = '';
  var dateHistory = '';
  var photoHistory = '';
  int contResultsHistory = 0;
  bool loadingHistory = true;

  void getRankingInfoUsers() {
  db.getConnection().then((conn) async {
  String sql = 'SELECT B.PROFILE_NAME, A.POINTS,B.PHOTO,B.UID,B.USER_NAME,A.NAME_GROUP,A.ID_GROUP FROM GROUP_MEMBERS_TABLE A, USER_TABLE B  WHERE  A.UID = B.UID AND A.ID_GROUP = (SELECT ID_GROUP FROM GROUP_MEMBERS_TABLE WHERE UID = '+ uid +') ORDER BY A.POINTS DESC;';
    await conn.query(sql).then((results) {
      for(var row in results){
        if (loading){
          
            contResults++;
            nameRank = row[0];
            points = row[1];
            photo = row[2];
            uidListUser = row[3];
            userName = row[4];
            groupTextIndex = row[5];
            idGroupRank = row[6];
            rankingUser.add(Ranking_User(nameRank, points,photo,uidListUser,userName,idGroupRank));

            if(contResults == results.length){
              loading = false;
            }
            
          
        }
      }
    });

  conn.close();

  });
}

}