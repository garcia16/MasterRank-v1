// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../screens/profile_screen.dart';

class ProfileButtons extends StatefulWidget {

  @override
  _ProfileButtonsState createState() => _ProfileButtonsState();

}

class _ProfileButtonsState extends State<ProfileButtons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color:Color(0x0000ffff)),
            Text('Grupos', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.044,),),
            Divider(color:Color(0x0000ffff)),
            _groupsList(),
            /*
            Divider(color:Color(0x0000ffff)),
            _groupsList(),
            Divider(color:Color(0x0000ffff)),
            _groupsList(),*/
            Divider(color:Color(0x0000ffff)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fotos', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.044,),),
                IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'config');
                  }, 
                  icon: Icon(Icons.photo_camera_rounded,size: SizeConfig.screenWidth! * 0.070,),)
              ],
            ),
            Divider(color:Color(0x0000ffff)),
            _carouselImage()
          ],
        ),
      ),
    );
  }
  
  _groupsList() {

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network('https://images.unsplash.com/photo-1506869640319-fe1a24fd76dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JvdXB8ZW58MHx8MHx8&w=1000&q=80',
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover
                  ),
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal! * 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      //Text('Nombre del Grupo: ', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('Galácticos', style: TextStyle(fontFamily: 'Audiowide'),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Posición: ', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Audiowide')),
                      Text('1º', style: TextStyle(fontFamily: 'Audiowide'),),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }


_carouselImage(){

  return CarouselSlider(
    options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 4),
            ),
    items: profilePhotosUser.map((e) => ClipRRect(
             borderRadius: BorderRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(e,
                  width: 850,
                  height: 200,
                  fit: BoxFit.cover,)
                ],
              ) ,
            )).toList(),
  );
}


}
