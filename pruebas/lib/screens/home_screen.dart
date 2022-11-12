import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pruebas/screens/index_screen.dart';
import 'package:pruebas/widgets/background.dart';
import 'package:pruebas/widgets/main_activity.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _HomeBody()
        ],
      ),
   );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return IndexScreen();
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              MainActivity(),
            ],
          ),
        );
      },
    
  );
  
  /*
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainActivity(),
        ],
      ),
    );
  }*/
}