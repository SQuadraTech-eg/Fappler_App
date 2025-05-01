import 'package:flutter/material.dart';

import 'AppBar.dart';
import 'NavBar2.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FapplerAppBar(title: '',),

      body: const Center(
        child: Text("chatbooooooooooooooooot"),
      ),

      bottomNavigationBar: NavBarWidget(

      ),
    );
  }
}
