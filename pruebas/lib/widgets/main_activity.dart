// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas/providers/google_sign_in.dart';
import 'package:pruebas/utils/buttons_style.dart';
import 'package:pruebas/utils/media_query.dart';
import '../firebase_utils/mysql.dart';
import 'background.dart';

class MainActivity extends StatefulWidget {

@override
  _MainActivityState createState() => _MainActivityState();

}
class _MainActivityState extends State<MainActivity> {

String _nombre='';
String _email='';
String _pass='';
bool passwordCheck = false;


final _auth= FirebaseAuth.instance;

// ignore: prefer_final_fields
TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Background(),
            SizedBox(height: SizeConfig.safeBlockVertical! * 8,),
            Text('Master Rank', style: TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.1, color: Theme.of(context).colorScheme.outline)),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2,),
            Text('Registrate y crea un grupo con tus amigos', style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.038, color: Theme.of(context).colorScheme.outline,fontFamily: 'Audiowide'),textAlign: TextAlign.center,),
            SizedBox(height: SizeConfig.safeBlockVertical! * 12,),
            _inputEmail(),
            _inputPassword(),
            _forgotPassword(),
            SizedBox(height: SizeConfig.safeBlockVertical! * 3,),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 8.5,
              child: ElevatedButton(
                style: ButtonStyles.mainActivity(context),
                onPressed: () async{ 
                  if(_email.contains('@')){
                    try{
                      final user = await _auth.signInWithEmailAndPassword(
                      email: _email, 
                      password: _pass);
                      if (user != null){
                        Navigator.popAndPushNamed(context, 'index');
                      }
                    }catch (e) {
                      print(e);
                    }
                  }else{
                    _checkUser();
                    if(passwordCheck = true){
                      Navigator.popAndPushNamed(context, 'index');
                    }
                  }
                },
                child:  Text('Iniciar Sesión',style: TextStyle(color: Theme.of(context).colorScheme.surface),),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical! * 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: (){
                    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);

                    provider.googleLogin();
                    Navigator.popAndPushNamed(context, 'index');
                  },
                  icon: ImageIcon(AssetImage('assets/image/google.png')),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Google',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),)
                    ]
                  ),
                  style: ButtonStyles.mainActivityGoogle(context),
                ),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: ImageIcon(AssetImage('assets/image/facebook.png')),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Facebook',style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.035),),
                    ]
                  ),
                  style: ButtonStyles.mainActivityFacebook(context),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.safeBlockVertical! * 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¿No tienes cuenta?', style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.outline,fontFamily: 'Audiowide')),
                SizedBox(width: SizeConfig.safeBlockHorizontal! * 2,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'login');    
                  },
                  child: Text('Registrarse',  style: TextStyle(fontSize: SizeConfig.screenWidth! * 0.04, color: Theme.of(context).colorScheme.primary,fontFamily: 'Audiowide')),
                )
              ],
            ),
            Divider(color:Color(0x0000ffff)),
          ],
        ),
      ),
    );
  }

  _inputEmail() {
    return SizedBox(
      height: SizeConfig.safeBlockVertical! * 10,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Theme.of(context).colorScheme.outline,fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide(width: 1,color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(20)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'usuario@masterrank.com',
          labelText: 'Usuario o E-mail',
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline,fontSize: SizeConfig.screenWidth! * 0.04),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.outline,fontSize: SizeConfig.screenWidth! * 0.04),
          //suffixIcon: Icon(Icons.alternate_email, color: Theme.of(context).colorScheme.outline),
          icon: Icon(Icons.email, color: Theme.of(context).colorScheme.outline,size: SizeConfig.screenWidth! * 0.06,)
        ),
        onChanged: (valor){
          setState(() {
            _email = valor;
          });
        },
      ),
    );
  }

  _inputPassword() {
    return SizedBox(
      height: SizeConfig.safeBlockVertical! * 9,
      child: TextField(
        obscureText: true,
        style: TextStyle(color: Theme.of(context).colorScheme.outline,fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide(width: 1,color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(20)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'contraseña123',
          labelText: 'Contraseña',
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline,fontSize: SizeConfig.screenWidth! * 0.04),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.outline,fontSize: SizeConfig.screenWidth! * 0.04),
          //suffixIcon: Icon(Icons.lock_open, color: Theme.of(context).colorScheme.outline),
          icon: Icon(Icons.lock, color: Theme.of(context).colorScheme.outline,size: SizeConfig.screenWidth! * 0.06,)
        ),
        onChanged: (valor){
          setState(() {
            _pass = valor;
          });
        },
      ),
    );
  }

  _forgotPassword(){
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('¿Olvidaste la contraseña?',style: TextStyle(color: Theme.of(context).colorScheme.outline,fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035))
        ],
      ),
    );
  }

  void _checkUser() {
    var db = Mysql();
    var user_name = '"'+_email+'"';
    var password ='';
    bool loading = true;
    db.getConnection().then((conn) {
      String sql = 'SELECT PASSWORD FROM USER_TABLE WHERE USER_NAME = '+ user_name +' ;';
      conn.query(sql).then((results) {
        for(var row in results){
          if (loading){
            password = row[0];
            if(password == _pass){
              passwordCheck = true;
            }
          }
        }
      });
      conn.close();
    });
  }


}