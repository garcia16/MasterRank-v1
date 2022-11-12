

import 'package:firebase_auth/firebase_auth.dart';

String getUIDUser (){
  String uidUser='';
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  uidUser = user!.uid;
  uidUser = '"'+uidUser+'"';

  return uidUser;
}
  