
import '../utils/globals_variables.dart';
import 'mysql.dart';

String getUserName() {

  String userName = '';

    var db = Mysql();
    var uid = uidUser;
    bool loading = true;

    db.getConnection().then((conn) {
      String sql = 'SELECT USER_NAME FROM USER_TABLE WHERE UID = '+ uid +';';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            userName = row[0];
            loading = false;
          }
        }
      });
      conn.close();
    });

    return userName;
  }