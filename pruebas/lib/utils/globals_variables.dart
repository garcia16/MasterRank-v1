import 'package:mysql1/mysql1.dart';
import 'package:pruebas/firebase_utils/getNameUser.dart';
import '../firebase_utils/getIdGroup.dart';
import '../firebase_utils/getUIDUser.dart';


//Datos para la conexiona MySQL
final conex = ConnectionSettings(
  host: '', 
  port: 3306,
  user: '',
  password: '',
  db: ''
);

//SENTENCIAS MySQL FIJAS
String getMaxIdGroupForNewGroup = 'SELECT MAX(ID_GROUP),(SELECT PROFILE_NAME FROM USER_TABLE WHERE UID = ' +uidUser+' ),(SELECT USER_NAME FROM USER_TABLE WHERE UID = '+uidUser+')FROM GROUP_TABLE;';

//Obtener el UID del Usuario logueado
final uidUser = getUIDUser();  

//Obtener el Nombre del Usuario logueado
final nameUser = getUserName();  

//Obtener el ID_Group del Grupo al que pertenece el Usuario
final idGroup = getIdGroup();
