// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../screens/group_screen.dart';
import '../utils/buttons_style.dart';
import '../widgets_buttons/photo_buttons.dart';

class Photo extends StatefulWidget {

  @override
  _PhotoState createState() => _PhotoState();

}
class _PhotoState extends State<Photo> {

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
                  Text('Fotos', style: TextStyle(fontFamily: 'Audiowide',fontSize: 35,)),
                  Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: SizeConfig.safeBlockVertical! * 1),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: 18,)),
                SizedBox(height: 5,),
                SizedBox(
                  height: SizeConfig.safeBlockVertical! * 75,
                  
                    child: ListView.builder(
                      itemCount: groupPhotosList.length,
                      itemBuilder: (context,index) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:Image.network(groupPhotosList[index].urlPhoto,
                                              width: 250,
                                              height: 250,
                                              fit: BoxFit.cover
                                ),
                            ),
                            Divider()
                          ],
                        ),
                        
                      )
                    )
              ],
            ),
          ),
          //SizedBox(height: 50,),
          PhotoButtons()
        ],
      ),
    );
  }


}