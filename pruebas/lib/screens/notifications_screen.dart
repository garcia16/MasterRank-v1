
import 'package:flutter/material.dart';
import 'package:pruebas/widgets/notifications.dart';

class NotificationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Notifications(),
        ],
      ),
   );
  }
}