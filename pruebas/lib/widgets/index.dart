// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, avoid_print
import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../firebase_utils/mysql.dart';
import '../screens/index_screen.dart';
import '../utils/buttons_style.dart';
import '../utils/globals_variables.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}
class _IndexState extends State<Index> {   

  var db = Mysql();
  var group = '';
  var uid = uidUser;
  bool loading = true;
  var nameRank = '';
  int points = 0;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Master Rank ', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.1,color: Theme.of(context).colorScheme.background,)),
                SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomSnackBarContent(),
                          margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 45),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: Duration(seconds: 2),
                          dismissDirection: DismissDirection.vertical,
                        ),
                      );
                    }, icon: Icon(Icons.add_circle,size: SizeConfig.screenWidth! * 0.06,)),
                    Text(groupTextIndex, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05,)),
                    IconButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomSnackBarContent(),
                          margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 45),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: Duration(seconds: 2),
                          dismissDirection: DismissDirection.vertical,
                        ),
                      );
                    }, icon: Icon(Icons.arrow_drop_down_outlined, size: SizeConfig.screenWidth! * 0.06,)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 65,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Posición', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.background)),
                      Text('Nombre', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.background)),
                      Text('Puntos', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.background)),
                    ],
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: rankingUser.length,
                      itemBuilder: (context,index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 35,top: 10),
                                  child: Text((index+1).toString(), style: TextStyle(fontFamily: 'Abel',fontWeight: FontWeight.bold,fontSize: SizeConfig.screenWidth! * 0.05, color: Theme.of(context).colorScheme.outline))
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(rankingUser[index].profileName, style: TextStyle(fontFamily: 'Abel',fontWeight: FontWeight.bold,fontSize: SizeConfig.screenWidth! * 0.045,color: Theme.of(context).colorScheme.outline))),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15,top: 10),
                                  child: Text(rankingUser[index].points.toString(), style: TextStyle(fontFamily: 'Abel',fontWeight: FontWeight.bold,fontSize: SizeConfig.screenWidth! * 0.05,color: Theme.of(context).colorScheme.outline))
                                )
                              ],
                            ),
                            
                          ],
                        ),
                        
                      )
                    )
                ],
              ),
            ),
          ),
          //Divider(color: Theme.of(context).colorScheme.background, thickness: 1, height: 3,),
          SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
          SizedBox(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
              child: ElevatedButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, 'update_points');
                  },
                  icon: Icon(Icons.replay,size: iconArrowMax.size,), 
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(''),
                      Text('Actualizar Ranking',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),),
                      Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                    ]
                  ),
                  style: ButtonStyles.index(context),
                ),
            ),
          ),
        ],
      ),
    );
    
  }
  
}
