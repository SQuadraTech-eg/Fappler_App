import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FapplerAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;

  const FapplerAppBar({
    Key? key,
    required this.title,
    this.onMenuPressed,
    this.onProfilePressed,
  }) : super(key: key);

  @override
  _FapplerAppBarState createState() => _FapplerAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _FapplerAppBarState extends State<FapplerAppBar> {
  // Add state variables if needed
  bool isProfileActive = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 15.0, // Adds a shadow
      shadowColor: Colors.black.withOpacity(0.8),
      backgroundColor: Colors.deepPurple.shade500,
      title: Image.asset(
        'assets/fappler_w.png',
        height: 60, // Adjust the height as needed
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: widget.onMenuPressed,
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Toggle profile active state
            setState(() {
              isProfileActive = !isProfileActive;
            });

            if (widget.onProfilePressed != null) {
              widget.onProfilePressed!();
            }
          },
          icon: Icon(
            FontAwesomeIcons.user,
            size: 25,
            color: isProfileActive ? Colors.purpleAccent : Colors.white,
          ),
        ),
      ],
    );
  }
}
