// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../screens/profile_screen.dart';
import '../widgets_buttons/edit_profile_buttons.dart';

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();

}

  String newName='';
  String newUser='';
  String newDescription='';

class _EditProfileState extends State<EditProfile> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Editar Perfil', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09,)),
            Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: 2,),
            SizedBox(height: 15,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(profile_name, style: TextStyle(fontFamily: 'Audiowide',fontSize: 15, )),
                  SizedBox(height: 15,),
                  Hero(
                      tag: 'profile_image',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(photo_profile,
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover
                        ),
                      ),
                    ),
                  SizedBox(height: 15,),
                  Text('Cambiar foto del perfil', style: TextStyle(fontFamily: 'Audiowide',fontSize: 15, color: Theme.of(context).colorScheme.primary)),
                  SizedBox(height: 25,),
                  SizedBox(
                    height: 340,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _editName(),
                        _editUser(),
                        _editDescription()
                      ],
                    )
                  ),
                  SizedBox(height: 35,),
                ],
              ),
            ),
            EditProfileButtons(),
          ],
        ),
      ),
    );
  }
  
_editName() {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 0)
        ),
        hintText: profile_name,
        labelText: 'Nombre',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.people_alt, color: Theme.of(context).colorScheme.background)
      ),
      onChanged: (valor){
        setState(() {
          newName = valor;
        });
      },
    );
  }

  _editUser() {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 0)
        ),
        hintText: user_name,
        labelText: 'Nombre de Usuario',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.person, color: Theme.of(context).colorScheme.background)
      ),
      onChanged: (valor){
        setState(() {
          newUser = valor;
        });
      },
    );
  }

  _editDescription() {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 4,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 0)
        ),
        hintText: description,
        labelText: 'Descripción',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.text_snippet_rounded, color: Theme.of(context).colorScheme.background)
      ),
      onChanged: (valor){
        setState(() {
          newDescription = valor;
        });
      },
    );
  }

  


}