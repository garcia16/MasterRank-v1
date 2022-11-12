// ignore_for_file: non_constant_identifier_names, use_function_type_syntax_for_parameters

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pruebas/providers/google_sign_in.dart';
import 'package:pruebas/providers/theme_provider.dart';
import 'package:pruebas/providers/ui_provider.dart';
import 'package:pruebas/screens/add_rule_screen.dart';
import 'package:pruebas/screens/add_sentence_screen.dart';
import 'package:pruebas/screens/choose_option_screen.dart';
import 'package:pruebas/screens/config_screen.dart';
import 'package:pruebas/screens/create_group_screen.dart';
import 'package:pruebas/screens/edit_profile_screen.dart';
import 'package:pruebas/screens/group_screen.dart';
import 'package:pruebas/screens/help_screen.dart';
import 'package:pruebas/screens/history_screen.dart';
import 'package:pruebas/screens/information_screen.dart';
import 'package:pruebas/screens/loading_screen.dart';
import 'package:pruebas/screens/login_screen.dart';
import 'package:pruebas/screens/photo_screen.dart';
import 'package:pruebas/share_preferences/preferences.dart';
import 'screens/edit_group_screen.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'screens/join_group_screen.dart';
import 'screens/index_screen.dart';
import 'package:provider/provider.dart';
import 'screens/members_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/rules_screen.dart';
import 'screens/security_screen.dart';
import 'screens/sentences_screen.dart';
import 'screens/theme_app_screen.dart';
import 'screens/update_points_member_screen.dart';
import 'screens/update_points_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Preferences.init();

  /*
  FirebaseAuth.instance.authStateChanges().listen((User user) {
  if (user == null) {
          runApp(MyApp(auth : false);
        } else {
          runApp(MyApp(auth : false);
       }
    });
  */
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode),),
      ],
    child: MyApp()
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Color(0x0000ffff), // status bar color
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider())
        
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Material App',
      initialRoute: 'home_screen',
      routes: {
        'home_screen': ( _ ) =>  HomeScreen(),
        'choose': ( _ ) => ChooseOption(),
        'login': ( _ ) => LogIn(),
        'create_group': ( _ ) => CreateGroup(),
        'join_group': ( _ ) => JoinGroup(),
        'index': ( _ ) => IndexScreen(),
        'group': ( _ ) => GroupScreen(),
        'profile': ( _ ) => ProfileScreen(),
        'edit_group': ( _ ) => EditGroupScreen(),
        'members': ( _ ) => MembersScreen(),
        'history': ( _ ) => HistoryScreen(),
        'sentences': ( _ ) => SentencesScreen(),
        'rules': ( _ ) => RulesScreen(),
        'edit_profile': ( _ ) => EditProfileScreen(),
        'notifications': ( _ ) => NotificationsScreen(),
        'help': ( _ ) => HelpScreen(),
        'update_points': ( _ ) => UpdatePointsScreen(),
        'update_points_member' : ( _ ) => UpdatePointsMemberScreen(),
        'config' : ( _ ) => ConfigScreen(),
        'security' : ( _ ) => SecurityScreen(),
        'theme_app' : ( _ ) => ThemeAppScreen(),
        'information' : ( _ ) => InformationScreen(),
        'photo' :( _ ) =>  PhotoScreen(),
        'loading' : ( _ ) => LoadingScreen(),
        'add_rule' : ( _ ) => AddRuleScreen(),
        'add_sentence' : ( _ ) => AddSentenceScreen()
      }, 
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    ),
    );
  }
}

