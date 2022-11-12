// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/screens/group_screen.dart';
import 'package:pruebas/utils/media_query.dart';
import 'package:pruebas/widgets/update_points.dart';
import '../widgets_buttons/sentences_buttons.dart';

class Sentences extends StatefulWidget {

  @override
  _SentencesState createState() => _SentencesState();

}
class _SentencesState extends State<Sentences> {

  int contSentences = 0;
  double marginLeft = 60;
  double marginRight = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Frases', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
                Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: 2,),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: 18,)),
                SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 75,
                  child: ListView.builder(
                      itemCount: groupSentencesList.length,
                      itemBuilder: (context,index) => Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      width: 200,
                      decoration: BoxDecoration( color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only( left:10,right: 10, top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(groupSentencesList[index].photo,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(groupSentencesList[index].sentence, style: TextStyle(fontFamily: 'Audiowide',fontSize: 15, color: Colors.white)),
                                  Text(groupSentencesList[index].sentenceProfileName, style: TextStyle(fontFamily: 'Audiowide',fontSize: 13, color: Colors.white)),
                                  Text(groupSentencesList[index].date.substring(0,10), style: TextStyle(fontFamily: 'Audiowide',fontSize: 13, color: Colors.blue))
                                ],
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          SentencesButtons(),
        ],
      ),
    );
  }
}