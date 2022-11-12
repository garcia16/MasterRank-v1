// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../screens/group_screen.dart';
import '../widgets_buttons/edit_group_buttons.dart';

class EditGroup extends StatefulWidget {

  @override
  _EditGroupState createState() => _EditGroupState();

}

  String newName='';
  String pass='';
  String passConfirm='';
class _EditGroupState extends State<EditGroup> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Editar Grupo', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.09, )),
            Divider(color: Theme.of(context).colorScheme.outline, thickness: 4, height: SizeConfig.safeBlockVertical! * 0.5,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 65,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(name_group, style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04,)),
                    SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                    Hero(
                      tag: 'group_image',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(photo_group,
                                      width: SizeConfig.screenWidth! * 0.3,
                                      height: SizeConfig.screenWidth! * 0.3,
                                      fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          editName(context),
                          editPassword(context),
                          newPassword(context),
                          //_addAdmin(context)
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            EditGroupButtons(),
          ],
        ),
      ),
    );
  }
  
  editName(BuildContext context) {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: SizeConfig.screenWidth! * 0.035),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 0)
        ),
        hintText: name_group,
        labelText: 'Nombre',
        labelStyle: TextStyle( fontSize: SizeConfig.screenWidth! * 0.035),
        icon: Icon(Icons.people_alt, color: Theme.of(context).colorScheme.background)
      ),
      onChanged: (valor){
        setState(() {
          newName = valor;
        });
      },
    );
  }

  editPassword(BuildContext context) {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: SizeConfig.screenWidth! * 0.035),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 0)
        ),
        hintText: 'Contraseña actual',
        labelText: 'Contaseña actual',
        labelStyle: TextStyle( fontSize: SizeConfig.screenWidth! * 0.035),
        icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.background),
      ),
      onChanged: (valor){
        setState(() {
          pass = valor;
        });
      },
    );
  }

 newPassword(BuildContext context) {

    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: SizeConfig.screenWidth! * 0.035),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black, width: 0)
        ),
        hintText: 'Nueva contraseña',
        labelText: 'Nueva contraseña',
        labelStyle: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),
        icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.background)
      ),
      onChanged: (valor){
        setState(() {
          passConfirm = valor;
        });
      },
    );
  }

  /*_addAdmin(BuildContext context) {

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
        hintText: 'Añadir Administrador',
        labelText: 'Añadir Administrador',
        labelStyle: TextStyle(fontSize: 14),
        icon: Icon(Icons.add_reaction_outlined,color: Theme.of(context).colorScheme.background)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }*/

}