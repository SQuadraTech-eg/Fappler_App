import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 15.0,
      shadowColor: Colors.black.withOpacity(0.8),
      backgroundColor: Colors.deepPurple.shade500,
      title: Image.asset(
        'assets/fappler_w.png',
        height: 60,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.user,
            size: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
