// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -250,
          left: -30,
          child: _GradientBox()
        ),
        Positioned(
          top: -350,
          left: -100,
          child: _GradientBox()
        ),
        Positioned(
          top: -250,
          left: -150,
          child: _GradientBox()
        )
      ],
    );
  }
}

class _GradientBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90.0,
      child: Container(
        width: 160,
        height: 670,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(190),
          gradient: LinearGradient(
            colors: [
              Color(0xffffffff),
              Theme.of(context).colorScheme.onSecondary
            ]
          )
        ),
      ),
    );
  }
}
