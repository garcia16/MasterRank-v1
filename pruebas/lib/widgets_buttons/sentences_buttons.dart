// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../utils/buttons_style.dart';

class SentencesButtons extends StatelessWidget {

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
                Navigator.pushNamed(context, 'add_sentence');
              },
              icon: Icon(Icons.add_circle,size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Añadir frase'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.sentences(context),
            ),
          ],
        ),
      ),
    );
  }
  


}