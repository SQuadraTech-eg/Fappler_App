// import 'package:flutter/material.dart';
// import 'package:fappler_android_app/screens/familyMemberView/Reminder%20Functionality/CompletedReminder.dart';
// import 'package:fappler_android_app/screens/familyMemberView/Reminder%20Functionality/MissedReminder.dart';
// import 'package:fappler_android_app/widgets/commonWidgets/HomeButton.dart';
// import 'package:fappler_android_app/widgets/commonWidgets/NavBar.dart';
// import 'package:fappler_android_app/widgets/commonWidgets/drawer.dart';
//
// import 'package:fappler_android_app/screens/familyMemberView/Reminder Functionality/ViewUpcomingReminder.dart';
//
// class ReminderInput extends StatefulWidget {
//   String email;
//
//   ReminderInput({Key? key, required this.email}) : super(key: key);
//
//   @override
//   State<ReminderInput> createState() => _ReminderInputState();
// }
//
// class _ReminderInputState extends State<ReminderInput> {
//   int _buttonIndex = 0;
//
//   late final List<Widget> _reminderWidgets;
//
//   @override
//   void initState() {
//     super.initState();
//     _reminderWidgets = [
//       UpcomingReminder(email: widget.email),
//       CompletedReminder(email: widget.email),
//       MissedReminders(email: widget.email),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       appBar: AppBar(
//         title: Center(
//           child: Container(
//             child: Image.asset(
//               'assets/fappler_white_logo.png',
//               width: 200,
//               height: 60,
//             ),
//           ),
//         ),
//         backgroundColor: const Color(0xFF5C389F),
//         shape: const ContinuousRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(80.0),
//             bottomRight: Radius.circular(80.0),
//           ),
//         ),
//       ),
//       drawer: drawerWidget(email: widget.email),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 10.0),
//             const Center(
//               child: Text(
//                 "Reminder",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25.0,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Container(
//               padding: const EdgeInsets.all(5),
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(child: _buildButton(0, "Upcoming")),
//                   _buildDivider(),
//                   Expanded(child: _buildButton(1, "Completed")),
//                   _buildDivider(),
//                   Expanded(child: _buildButton(2, "Missed")),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             _reminderWidgets[_buttonIndex],
//           ],
//         ),
//       ),
//       bottomNavigationBar: NavBarWidget(email: widget.email),
//       floatingActionButton: HomeBtnWidget(email: widget.email),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
//
//   Widget _buildButton(int index, String label) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double fontSize = constraints.maxWidth * 0.1; // Adjust this value as needed
//
//         return InkWell(
//           onTap: () {
//             setState(() {
//               _buttonIndex = index;
//             });
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
//             decoration: BoxDecoration(
//               color: _buttonIndex == index ? const Color(0xFF5C389F) : Colors.transparent,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.w500,
//                 color: _buttonIndex == index ? Colors.white : Colors.black26,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildDivider() {
//     return SizedBox(
//       width: 10.0,
//       child: Container(color: Colors.black26),
//     );
//   }
// }
