import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas/providers/ui_provider.dart';
import 'package:pruebas/screens/profile_screen.dart';
import 'package:pruebas/widgets/group.dart';
import 'package:pruebas/widgets/index.dart';
import 'package:pruebas/widgets/profile.dart';

import '../screens/group_screen.dart';
import '../screens/index_screen.dart';

class HomeBody extends StatefulWidget {

@override
  _HomeBodyState createState() => _HomeBodyState();

}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {

    //Obtener el select menu opt

    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la correspondiente página
   final currentIndex = uiProvider.selectedMenuOpt;

    switch ( currentIndex ) {

      case 0:
        return Scaffold(
        body: Column(
          children: [
            Index()
          ],
        ),
      );

      case 1:
        return Scaffold(
        body: Column(
          children: [
            GroupScreen()
          ],
        ),
      );

      case 2:
        return Scaffold(
        body: Column(
          children: [
            ProfileScreen()
          ],
        ),
      );

      default:
        return Scaffold(
        body: Column(
          children: [
            Index()
          ],
        ),
      );

    }
  }
}