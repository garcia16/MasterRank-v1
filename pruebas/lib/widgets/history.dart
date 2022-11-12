// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/screens/index_screen.dart';
import 'package:pruebas/utils/media_query.dart';
import '../widgets_buttons/history_buttons.dart';

class History extends StatefulWidget {

  @override
  _HistoryState createState() => _HistoryState();

}
class _HistoryState extends State<History> {

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
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Historial', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
                  Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: SizeConfig.safeBlockVertical! * 1),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('El Club del Pescador', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.045,)),
                SizedBox(height: 5,),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 75,
                  child: ListView.builder(
                      itemCount: historyRanking.length,
                      itemBuilder: (context,index) => Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  width: SizeConfig.safeBlockHorizontal! * 94,
                                  decoration: BoxDecoration( color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.white)),
                                  margin: EdgeInsets.only( left:10,right: 10),
                                  child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: Image.network(historyRanking[index].photoHistory,
                                                width: SizeConfig.screenWidth! * 0.12,
                                                height: SizeConfig.screenWidth! * 0.12,
                                                fit: BoxFit.cover
                                              ),
                                            ),
                                            Text(historyRanking[index].profileNameHistory, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.03, color: Theme.of(context).colorScheme.onPrimary)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(historyRanking[index].reasonHistory,maxLines: 3,style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.03, color: Theme.of(context).colorScheme.onSurface)),
                                            //Text(historyRanking[index].dateHistory, style: TextStyle(fontFamily: 'Audiowide',fontSize: 15, color: Theme.of(context).colorScheme.onPrimary))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(historyRanking[index].pointsHistory.toString(), style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.06, color:historyRanking[index].color )),
                                            Text(historyRanking[index].dateHistory, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.025, color: Theme.of(context).colorScheme.onPrimary))

                                          ],
                                        ),
                                      ],
                                    ), 
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  )
              ],
            ),
          ),
          //SizedBox(height: 50,),
          HistoryButtons(),
        ],
      ),
    );
  }
  



}