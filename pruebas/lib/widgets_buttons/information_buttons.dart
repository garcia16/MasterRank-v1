// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../utils/buttons_style.dart';

class InformationButtons extends StatefulWidget {

  @override
  _InformationButtonsState createState() => _InformationButtonsState();

}
class _InformationButtonsState extends State<InformationButtons> {
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
               
              },
              icon: Icon(Icons.info,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Política de datos'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.information(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
             
              },
              icon: Icon(Icons.info,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Condiciones de uso'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.information(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
               
              },
              icon: Icon(Icons.info,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Bibliotecas de código abierto'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.information(context),
            ),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: (){
              },
              icon: Icon(Icons.info,size: iconLeftMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Reglamento de la UE 2022'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.information(context),
            ),
            Divider(color:Color(0x0000ffff)),

          ],
        ),
      ),
    );
  }
}
