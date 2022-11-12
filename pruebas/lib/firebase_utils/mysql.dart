import 'package:mysql1/mysql1.dart';


//Se necesita introducir los datos de conexión para la base de datos

class Mysql {

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: '', 
      port: 3306,
      user: '',
      password: '',
      db: ''
    );
    return await MySqlConnection.connect(settings);
  }

  
}