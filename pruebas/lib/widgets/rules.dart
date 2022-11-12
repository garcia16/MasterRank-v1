// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../screens/group_screen.dart';
import '../widgets_buttons/rules_buttons.dart';

class Rules extends StatefulWidget {

  @override
  _RulesState createState() => _RulesState();

}
class _RulesState extends State<Rules> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 8,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reglas', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
                  Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: 2,),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: 18,color: Theme.of(context).colorScheme.background)),
                SizedBox(height: 5,),
                Text('Reglas que suman puntos', style: TextStyle(fontFamily: 'Audiowide',fontSize: 18,)),
                SizedBox(height: 5,),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 33,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: ListView.builder(
                      itemCount: rulesGroupPlusList.length,
                      itemBuilder: (context,index) => Container(
                        //margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(rulesGroupPlusList[index].points, style: TextStyle(fontFamily: 'Audiowide',fontSize: 23, color: Color.fromARGB(255, 0, 255, 13),))
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(rulesGroupPlusList[index].rules, style: TextStyle(fontFamily: 'Audiowide',fontSize: 15, color: Colors.white)),
                                        
                                  ],
                                ),
                                IconButton(
                                  onPressed: (){
                                  }, 
                                  icon: Icon(Icons.menu,color: Colors.white,)
                                )
                              ],
                            ),
                            Divider(thickness: 1,color: Colors.white,),
                          ],
                        ),
                      )
                        
                      )
                    
                  )
                ),
                SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                Text('Reglas que restan puntos', style: TextStyle(fontFamily: 'Audiowide',fontSize: 18,)),
                SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 33,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: ListView.builder(
                      itemCount: rulesGroupSusList.length,
                      itemBuilder: (context,index) => Container(
                        //margin: EdgeInsets.only(top: 10),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(rulesGroupSusList[index].points, style: TextStyle(fontFamily: 'Audiowide',fontSize: 23, color: Color.fromARGB(255, 255, 17, 0),))
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(rulesGroupSusList[index].rules, style: TextStyle(fontFamily: 'Audiowide',fontSize: 15, color: Colors.white)),
                                        
                                  ],
                                ),
                                IconButton(
                                  onPressed: (){
                                  }, 
                                  icon: Icon(Icons.menu,color: Colors.white,)
                                )
                              ],
                            ),
                            Divider(thickness: 1,color: Colors.white,),
                          ],
                        ),
                      )
                        
                      )
                    
                  )
                ),
              ],
            ),
          ),
          RulesButtons(),
        ],
      ),
    );
  }
  

  
}
