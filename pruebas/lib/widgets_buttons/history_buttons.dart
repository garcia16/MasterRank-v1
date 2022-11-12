// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/buttons_style.dart';
import '../utils/media_query.dart';

class HistoryButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: CustomSnackBarContent(),
                    margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical! * 45),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    dismissDirection: DismissDirection.vertical,
                    elevation: 0,
                  ),
                );
              },
              icon: Icon(Icons.remove_red_eye,size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Ver disputas'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.history(context),
            ),
          ],
        ),
      ),
    );
  }
  


}

