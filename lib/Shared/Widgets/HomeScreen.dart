import 'package:fapplerv2/Shared/Widgets/AppBar.dart';
import 'package:flutter/material.dart';

import 'NavBar2.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});


  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FapplerAppBar(title: '',),
      body: Text("home",style: TextStyle(fontSize: 50),),

      bottomNavigationBar: NavBarWidget(),

    );
  }
}
