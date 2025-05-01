import 'package:flutter/material.dart';

import 'AppBar.dart';
import 'NavBar2.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FapplerAppBar(title: '',),

      body: Text("NotificationScreen",style: TextStyle(fontSize: 50),),


      bottomNavigationBar: NavBarWidget(

      ),

    );
  }
}
