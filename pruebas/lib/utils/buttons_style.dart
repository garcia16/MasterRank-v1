
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'media_query.dart';



final Icon iconArrowMin = Icon(Icons.arrow_forward_ios_outlined, size: SizeConfig.screenWidth! * 0.035);
final Icon iconArrowMax = Icon(Icons.arrow_forward_ios_outlined, size: SizeConfig.screenWidth! * 0.055);
final Icon iconLeftMax = Icon(Icons.arrow_forward_ios_outlined, size: SizeConfig.screenWidth! * 0.060);

Color buttonColor1 = Color(0xff000A23);
Color buttonColor2 = Color(0xff000A23);

Color buttonColorRule1= Color(0xff000A23);
Color buttonColorRule2 = Color(0xff000A23);

class ButtonStyles {

  

  static ButtonStyle mainActivity(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.inverseSurface),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle mainActivityGoogle(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.43,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.3,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        )
      )
    );
  }

  static ButtonStyle mainActivityFacebook(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.04)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.43,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.3,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        )
      )
    );
  }

  static ButtonStyle createGroup(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff000A23)),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle checkIn(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff000A23)),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle joinGroup(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff000A23)),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle chooseOptions(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff000A23)),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.05)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle index(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle group(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.8,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.4,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle profile(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.030)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Color(0xff000A23)),
          
        )
      )
    );
  }

  static ButtonStyle editProfile(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle config(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.8,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.4,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle editGroupRed(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 2,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.03)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Colors.red)
          )
        )
      );
  }

  static ButtonStyle editGroup(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle members(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.5,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.3,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle membersShare(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle membersExit(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.030)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.6,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.3,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Colors.red)
        )
      )
    );
  }

  static ButtonStyle history(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle sentences(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle photos(BuildContext context){
    return ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
        textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
        maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
        minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Color(0xff000A23))
          )
        )
      );
  }

  static ButtonStyle rules(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle updatePoints(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.5,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.3,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle updatePointsMemberSave(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23)),
          
        )
      )
    );
  }

  static ButtonStyle addRuleSave(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23)),
          
        )
      )
    );
  }

  static ButtonStyle updatePointsMember(BuildContext context){
    
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: buttonColor1, width: 3),
          
        )
      )
    );
  }
  static ButtonStyle updatePointsMemberRes(BuildContext context){
    
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: buttonColor2, width: 3),
          
        )
      )
    );
  }

  static ButtonStyle addRuleButtonRes(BuildContext context){
    
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.outline),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: buttonColorRule2, width: 3),
          
        )
      )
    );
  }

  static ButtonStyle addRuleButtonSum(BuildContext context){
    
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.outline),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: buttonColorRule1, width: 3),
          
        )
      )
    );
  }

  static ButtonStyle notificationSwitch(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.8,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.4,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle security(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 1,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle help(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.8,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.4,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle information(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.8,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.4,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }

  static ButtonStyle themeApp(BuildContext context){
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onPrimary),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
      textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Audiowide',fontSize: SizeConfig.screenWidth! * 0.035)),
      maximumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.8,SizeConfig.screenHeight! * 1)),
      minimumSize: MaterialStateProperty.all<Size>(Size(SizeConfig.screenWidth! * 0.4,SizeConfig.screenHeight! * 0.05)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Color(0xff000A23))
        )
      )
    );
  }







}

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('¡ Ten paciencia !', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),),
                    Spacer(),
                    Text('Pronto estará listo en la próxima versión', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          )
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icon/bubbles.svg",
              height: 48,
              width: 40,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        )
      ],
    );
  }
}

class CustomSnackBarPointsContent extends StatelessWidget {
  const CustomSnackBarPointsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('¡ Listo !', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),),
                    Spacer(),
                    Text('Puntos actualizados', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          )
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icon/bubbles.svg",
              height: 48,
              width: 40,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        )
      ],
    );
  }
}

class CustomSnackBarSentenceContent extends StatelessWidget {
  const CustomSnackBarSentenceContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('¡ Listo !', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),),
                    Spacer(),
                    Text('Frase añadida', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          )
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icon/bubbles.svg",
              height: 48,
              width: 40,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        )
      ],
    );
  }
}

class CustomSnackBarSentenceFailedContent extends StatelessWidget {
  const CustomSnackBarSentenceFailedContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('¡ Cuidado!', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),),
                    Spacer(),
                    Text('Debes introducir alguna frase', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          )
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icon/bubbles.svg",
              height: 48,
              width: 40,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        )
      ],
    );
  }
}

class CustomSnackBarAddRuleContent extends StatelessWidget {
  const CustomSnackBarAddRuleContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('¡ Listo !', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),),
                    Spacer(),
                    Text('Regla añadida', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          )
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              "assets/icon/bubbles.svg",
              height: 48,
              width: 40,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        )
      ],
    );
  }
}