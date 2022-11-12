// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/screens/profile_screen.dart';
import 'package:pruebas/utils/buttons_style.dart';
import 'package:pruebas/utils/media_query.dart';
import '../widgets_buttons/profile_buttons.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();

}
class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Perfil', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
                IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'config');
                  }, 
                  icon: Icon(Icons.settings,size: SizeConfig.screenWidth! * 0.070,),)
              ],
            ),
            Divider(color: Theme.of(context).colorScheme.outline , thickness: 4, height: SizeConfig.safeBlockVertical! * 0.5,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Hero(
                      tag: 'profile_image',
                      child: Image.network(photo_profile,
                                    width: SizeConfig.screenWidth! * 0.3,
                                    height: SizeConfig.screenWidth! * 0.3,
                                    fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(profile_name, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.06,)),
                      Text(user_name, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.tertiary)),
                      SizedBox(height: SizeConfig.safeBlockVertical! * 1,),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.6,
                        height: SizeConfig.safeBlockVertical! * 12,
                        child: Column(
                          children: [
                            _description(),
                            ElevatedButton.icon(
                              onPressed: (){
                                Navigator.pushNamed(context, 'edit_profile');
                              },
                              icon: Icon(Icons.edit,size: SizeConfig.screenWidth! * 0.040,), 
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(''),
                                  Text('Editar Perfil',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.03),),
                                  Icon(Icons.arrow_forward_ios_outlined,size: SizeConfig.screenWidth! * 0.040,),
                                ]
                              ),
                              style: ButtonStyles.profile(context),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 50,
              child: ProfileButtons()
            ),
          ],
        ),
      ),
    );
  }
  
  _description() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(description,
            style: TextStyle(fontFamily: 'Audiowide', fontSize: SizeConfig.screenWidth! * 0.03),
            ),
        ]  
    );
  }

}