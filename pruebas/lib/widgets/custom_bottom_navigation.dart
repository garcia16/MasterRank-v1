// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas/providers/ui_provider.dart';
import 'package:pruebas/utils/home_body.dart';

class CustomBottonNavigation extends StatefulWidget {
  CustomBottonNavigation();

@override
  _CustomBottonNavigationState createState() => _CustomBottonNavigationState();

}

class _CustomBottonNavigationState extends State<CustomBottonNavigation> {
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndexMenu = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      elevation: 10.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontFamily: 'Audiowide'),
      unselectedLabelStyle: TextStyle(fontFamily: 'Audiowide'),
      onTap: (int i ) {
        uiProvider.selectedMenuOpt = i;
        HomeBody();
      },
      currentIndex: currentIndexMenu,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_rounded),
          label: 'Grupo'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Perfil'
        ),
      ],
    );
  }
}
