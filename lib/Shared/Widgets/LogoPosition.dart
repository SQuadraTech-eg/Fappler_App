import 'package:flutter/material.dart';

class logo extends StatefulWidget {
  const logo({super.key});

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          width: 220,
          height: 220,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(90)),
          margin: EdgeInsets.all(20),
          child: Image.asset(
            "assets/images/fappler.png",
            width: 60,
            height: 60,
          )),
    )
    ;
  }
}
