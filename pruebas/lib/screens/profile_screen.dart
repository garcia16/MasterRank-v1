import 'package:flutter/material.dart';
import 'package:pruebas/widgets/profile.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
import '../utils/media_query.dart';
import 'group_screen.dart';
class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

var db = Mysql();
  var user_name = '';
  var profile_name ='';
  var photo_profile ='https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png';
  var description = '';
  bool loading = true;

  int contPhotos = 0;
  bool loadingPhotosUser = true;
  var urlPhotoUser = '';
  List<String> profilePhotosUser = [];

class _ProfileScreenState extends State<ProfileScreen> {
  

  void getdataProfile() {
    db.getConnection().then((conn) async{
      String sql = 'SELECT PROFILE_NAME, USER_NAME, PHOTO, NVL(DESCRIPTION,"Nada por el momento") FROM USER_TABLE WHERE UID = '+ uid +' ;';
      await conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            setState(() {
            profile_name = row[0];
            user_name = row[1];
            photo_profile = row[2];
            description = row[3];
            loading = false;
          });
          }
        }
      });
      conn.close();
    });
  }

  void getDataPhotosUser() {
    db.getConnection().then((conn) async{
      String sql = 'SELECT PHOTO FROM USER_PHOTOS_TABLE WHERE UID = '+ uid +' ;';
      await conn.query(sql).then((results) {
        for(var row in results){
          if (loadingPhotosUser){
            setState(() {
            urlPhotoUser = row[0];
            profilePhotosUser.add(urlPhotoUser);

            if(contPhotos == results.length){
                loadingPhotosUser = false;
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
    getdataProfile();
    getDataPhotosUser();
    return SizedBox(
      width: SizeConfig.safeBlockHorizontal! * 100,
      height: SizeConfig.safeBlockVertical! * 90,
      child: Scaffold(
        body: Stack(
          children: [
            Profile()
          ],
        ),
        //bottomNavigationBar: CustomBottonNavigation(),
   ),
    );
  }
}

