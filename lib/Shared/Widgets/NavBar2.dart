import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Chatbot.dart';
import 'HomeScreen.dart';
import 'Notification.dart';

class NavBarWidget extends StatefulWidget {
  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90, // Increased height for the navigation bar
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the navigation bar
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, -3), // Shadow direction
          ),
        ],
      ),
      child: ClipRRect(
        // Optionally, add rounded corners if needed
        // borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.purpleAccent,
          unselectedItemColor: Colors.grey,
          elevation: 10.0,
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationScreen()),
                  );
                },
                child: Icon(Iconsax.notification, color: Colors.deepPurple,size: 30,),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                },
                child: Icon(Iconsax.home, color: Colors.deepPurple,size: 30,),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Chatbot()),
                  );
                },
                child: Icon(FontAwesomeIcons.robot, color: Colors.deepPurple,size: 30,),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
