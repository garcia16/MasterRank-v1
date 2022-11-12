import 'package:mysql1/mysql1.dart';

import '../utils/globals_variables.dart';

Future<MySqlConnection> conexionBD() async{

  final conn =  await MySqlConnection.connect(conex);

  return conn;
  
}