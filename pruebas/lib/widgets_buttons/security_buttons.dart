// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pruebas/utils/media_query.dart';
import '../utils/buttons_style.dart';

class SecurityButtons extends StatefulWidget {

  @override
  _SecurityButtonsState createState() => _SecurityButtonsState();

}
class _SecurityButtonsState extends State<SecurityButtons> {

  String _nombre='';

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
            _editPassword(),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            _newPassword(),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.save_alt_sharp,size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Guardar cambios'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.security(context),
            ),
          ],
        ),
      ),
    );
  }
  
  _editPassword() {

    return TextField(
      autofocus: false,
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        hintText: 'Contraseña actual',
        labelText: 'Contaseña actual',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.background)
        //suffixIcon: Icon(Icons.description_rounded, color: Color(0xff000A23)),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

 _newPassword() {

    return TextField(
      autofocus: false,
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(fontFamily: 'Audiowide', fontSize: 12),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 2)
        ),
        hintText: 'Nueva contraseña',
        labelText: 'Nueva contraseña',
        labelStyle: TextStyle( fontSize: 14),
        icon: Icon(Icons.lock_outline_rounded, color: Theme.of(context).colorScheme.background)
        //suffixIcon: Icon(Icons.description_rounded, color: Color(0xff000A23)),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }
  
}
