// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pruebas/utils/buttons_style.dart';
import '../firebase_utils/mysql.dart';
import '../utils/globals_variables.dart';
import '../utils/media_query.dart';

class ChooseLogin extends StatefulWidget {

  @override
  _ChooseLoginState createState() => _ChooseLoginState();

}
class _ChooseLoginState extends State<ChooseLogin> {

String _nombre='';
String _email='';
String _pass='';
String _fecha = '';
String _user = '';

// ignore: prefer_final_fields
TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical! * 8,),
            Text('Master Rank', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.1, color: Color(0xff000A23))),
            SizedBox(height: SizeConfig.safeBlockVertical! * 4,),
            Text('Completa el formulario', style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.045, color: Colors.black,fontFamily: 'Audiowide')),
            SizedBox(height: SizeConfig.safeBlockVertical! * 10,),
            _crearInput(),
            Divider(color:Color(0x0000ffff)),
            _inputName(),
            Divider(color:Color(0x0000ffff)),
            _crearEmail(),
            Divider(color:Color(0x0000ffff)),
            _crearPassword(),
            Divider(color:Color(0x0000ffff)),
            _crearFecha(context),
            Divider(color:Color(0x0000ffff)),
            ElevatedButton(
              style: ButtonStyles.checkIn(context),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email,
                    password: _pass
                  );
                  _logInNewUser();
                  Navigator.pushNamed(context, 'choose');
                  } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                  } catch (e) {
                  print(e);
                  }
                
              },
              child: Text('Registrarse',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.04),),
            ),
            Divider(color:Color(0x0000ffff)),
          ],
        ),
      ),
    );
  }

_crearInput() {

  return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'xEjemplo09',
        labelText: 'Usuario',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35),fontSize: SizeConfig.screenWidth! * 0.04),
        labelStyle: TextStyle(color: Color(0xff000A23),fontSize: SizeConfig.screenWidth! * 0.04),
        suffixIcon: Icon(Icons.accessibility, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,),
        icon: Icon(Icons.account_circle, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,)
      ),
      onChanged: (valor){
        setState(() {
          _user = valor;
        });
      },
  );
}

_inputName() {

  return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Carlos Herrera',
        labelText: 'Nombre',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35),fontSize: SizeConfig.screenWidth! * 0.04),
        labelStyle: TextStyle(color: Color(0xff000A23),fontSize: SizeConfig.screenWidth! * 0.04),
        suffixIcon: Icon(Icons.accessibility, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,),
        icon: Icon(Icons.account_circle, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
  );
}
  
_crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'usuario@masterrank.com',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35),fontSize: SizeConfig.screenWidth! * 0.04),
        labelText: 'E-mail',
        labelStyle: TextStyle(color: Color(0xff000A23),fontSize: SizeConfig.screenWidth! * 0.04),
        suffixIcon: Icon(Icons.alternate_email, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,),
        icon: Icon(Icons.email, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'contraseña123',
        hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35),fontSize: SizeConfig.screenWidth! * 0.04),
        labelText: 'Password',
        labelStyle: TextStyle(color: Color(0xff000A23),fontSize: SizeConfig.screenWidth! * 0.04),
        suffixIcon: Icon(Icons.lock_open, color: Color(0xff000A23), size: SizeConfig.screenWidth! * 0.06),
        icon: Icon(Icons.lock, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,)
      ),
      onChanged: (valor){
        setState(() {
          _pass = valor;
        });
      },
    );
  }

  _crearFecha( BuildContext context ) {
    return SizedBox(
      height: SizeConfig.safeBlockVertical! * 10,
      child: TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        style: TextStyle(color: Color(0xff000A23),fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
        decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Fecha de nacimiento',
          hintStyle: TextStyle(color: Color.fromARGB(141, 0, 10, 35),fontSize: SizeConfig.screenWidth! * 0.04),
          labelText: 'Fecha de nacimiento',
          labelStyle: TextStyle(color: Color(0xff000A23),fontSize: SizeConfig.screenWidth! * 0.04),
          suffixIcon: Icon(Icons.calendar_today, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,),
          icon: Icon(Icons.calendar_today, color: Color(0xff000A23),size: SizeConfig.screenWidth! * 0.06,)
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  void _selectDate(BuildContext context) async {

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:  DateTime(1960),
      lastDate:  DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (picked != null ){
      setState(() {
        _fecha = picked.toString();
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _inputFieldDateController.text = formattedDate;
      });
    }
  }

  void _logInNewUser() {
    var db = Mysql();
    var user = '"'+_user+'"';
    var name = '"'+_nombre+'"';
    var uid = uidUser;
    var mail = '"'+_email+'"';
    var pass = '"'+_pass+'"';
    var date = '"'+_fecha+'"';
    var profile = '"Public"';
    var notif_mail = '"Yes"';
    var notif_device = '"Yes"';
    var photoGroup = 'https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png';
    
    bool loading = true;

    db.getConnection().then((conn) async {
      String sql = 'INSERT INTO USER_TABLE VALUES(' +uid+ ',' +user+ ',' +name+ ',' +mail+ ',' +pass+ ','+date+','+profile+','+'"'+photoGroup+'"'+','+notif_mail+','+notif_device+',null);';
      var result = await conn.query(sql);
      conn.close();
    });
  }


}