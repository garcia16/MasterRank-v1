import '../utils/globals_variables.dart';
import 'mysql.dart';

int getIdGroup(){

  int idGroup = 0;

    var db = Mysql();
    var uid = uidUser;
    bool loading = true;

    db.getConnection().then((conn) async{
      String sql = 'SELECT ID_GROUP FROM GROUP_MEMBERS_TABLE WHERE UID = '+ uid +';';
      await conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            idGroup = row[0];
            loading = false;
          }
        }
      });
      conn.close();
    });

    return idGroup;
  }