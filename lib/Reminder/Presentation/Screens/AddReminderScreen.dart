// import 'package:alarm/alarm.dart';
// import 'package:alarm/model/alarm_settings.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fappler_android_app/screens/familyMemberView/Reminder%20Functionality/ViewReminder.dart';
// import 'package:fappler_android_app/widgets/commonWidgets/HomeButton.dart';
// import 'package:fappler_android_app/widgets/commonWidgets/NavBar.dart';
// import 'package:fappler_android_app/widgets/commonWidgets/drawer.dart';
// import 'package:fappler_android_app/services/AddReminder.dart';
// import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest_all.dart' as tz;
//
// class AddReminderContent extends StatefulWidget {
//   final String email;
//   const AddReminderContent({required this.email});
//
//   @override
//   State<AddReminderContent> createState() => _AddReminderContentState();
// }
//
// class _AddReminderContentState extends State<AddReminderContent> {
//
//   late FirestoreServiceReminder firestoreService;
//
//   DateTime? selectedDate;
//   DateTime? selectedTime;
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _contentController = TextEditingController();
//   TextEditingController hourController = TextEditingController();
//   TextEditingController minuteController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     firestoreService = FirestoreServiceReminder();
//     selectedTime = DateTime.now();
//     selectedDate = DateTime.now();
//     _titleController = TextEditingController();
//     _contentController = TextEditingController();
//   }
//
//
//
//
//
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
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 15),
//                 Container(
//                   child: Text(
//                     "Reminder",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 2),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white,
//                         blurRadius: 4,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: TextField(
//                           controller: _titleController,
//                           textAlign: TextAlign.center,
//                           decoration: InputDecoration(
//                             hintText: "Title",
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(vertical: 15),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 35),
//                         child: Divider(
//                           thickness: 1,
//                           height: 20,
//                         ),
//                       ),
//                       ListTile(
//                         title: TextField(
//                           controller: _contentController,
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           decoration: InputDecoration(
//                             hintText: "Content",
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(vertical: 15),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 35),
//                         child: Divider(
//                           thickness: 1,
//                           height: 20,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // GestureDetector(
//                 //   onTap: () => _selectDate(context),
//                 //   child: Container(
//                 //     height: 60,
//                 //     width: MediaQuery.of(context).size.width,
//                 //     padding: EdgeInsets.symmetric(vertical: 5),
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //       boxShadow: [
//                 //         BoxShadow(
//                 //           color: Colors.white,
//                 //           blurRadius: 4,
//                 //           spreadRadius: 2,
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     child: Row(
//                 //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 //       children: [
//                 //         Row(
//                 //           children: [
//                 //             Icon(Icons.calendar_today),
//                 //             SizedBox(width: 5),
//                 //             Text(selectedDate != null
//                 //                 ? '$selectedDate'
//                 //                 : 'Select Date',),
//                 //           ],
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//
//                 // GestureDetector(
//                 //   onTap: () => _selectTime(context),
//                 //   child: Container(
//                 //     height: 60,
//                 //     width: MediaQuery.of(context).size.width,
//                 //     padding: EdgeInsets.symmetric(vertical: 5),
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //       boxShadow: [
//                 //         BoxShadow(
//                 //           color: Colors.white,
//                 //           blurRadius: 4,
//                 //           spreadRadius: 2,
//                 //         ),
//                 //       ],
//                 //     ),
//                 //     child: Row(
//                 //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 //       children: [
//                 //         Row(
//                 //           children: [
//                 //             Icon(Icons.access_time),
//                 //             SizedBox(width: 5),
//                 //             Text(
//                 //               selectedTime != null
//                 //                   ? '$selectedTime'
//                 //                   : 'Select Time',
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(11)),
//                       child: Center(
//                         child: TextField(
//                           controller: hourController,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Container(
//                       height: 40,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(11)),
//                       child: Center(
//                         child: TextField(
//                           controller: minuteController,
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Container(
//                 //   margin: const EdgeInsets.all(25),
//                 //   child: TextButton(
//                 //     child: const Text(
//                 //       'Create alarm',
//                 //       style: TextStyle(fontSize: 20.0),
//                 //     ),
//                 //     onPressed: () {
//                 //       int hour;
//                 //       int minutes;
//                 //       hour = int.parse(hourController.text);
//                 //       minutes = int.parse(minuteController.text);
//                 //
//                 //       // creating alarm after converting hour
//                 //       // and minute into integer
//                 //       FlutterAlarmClock.createAlarm(hour: hour, minutes: minutes, title: _titleController.text);
//                 //     },
//                 //   ),
//                 // ),
//                 ElevatedButton(
//                   onPressed: () {
//
//                     // show alarm
//                     FlutterAlarmClock.showAlarms();
//                   },
//                   child: const Text(
//                     'Show Alarms',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                 ),
//
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       String content = _contentController.text;
//                       String title = _titleController.text;
//
//                       // Parse hour and minute from controllers
//                       int hour = int.parse(hourController.text);
//                       int minutes = int.parse(minuteController.text);
//
//                       if (content.isNotEmpty && title.isNotEmpty) {
//                         await firestoreService.addReminder(
//                           widget.email,
//                           content,
//                           "Upcoming",
//                           title,
//                           hour,
//                           minutes,
//                         );
//
//                         // Create an alarm using FlutterAlarmClock
//                         FlutterAlarmClock.createAlarm(
//                           hour: hour,
//                           minutes: minutes,
//                           title: title,
//                         );
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ReminderInput(
//                               email: widget.email,
//                             ),
//                           ),
//                         );
//
//                         // Show SnackBar
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 'Reminder added successfully',
//                                 style: TextStyle(color: Colors.white, fontSize: 16), // Adjust font size
//                               ),
//                               duration: Duration(seconds: 3), // Duration for the SnackBar to be displayed
//                               backgroundColor: Color(0xFF5C389F), // Set the background color
//                               behavior: SnackBarBehavior.floating, // Make the SnackBar floating
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0), // Rounded corners
//                               ),
//                               margin: EdgeInsets.all(16.0), // Margin around the SnackBar
//                               padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Increase padding
//                             )
//                         );
//                       }
//                     } catch (error) {
//                       // Show error message to the user
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: Text('Error'),
//                           content: Text('Failed to add reminder: $error'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF5C389F),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: Container(
//                     height: 50,
//                     width: 100,
//                     alignment: Alignment.center,
//                     child: Text(
//                       'Add',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 )
//
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: NavBarWidget(email: widget.email),
//       floatingActionButton: HomeBtnWidget(email: widget.email),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (pickedTime != null) {
//       final TimeOfDay now = TimeOfDay.now();
//       final DateTime pickedDateTime = DateTime(
//         selectedDate!.year,
//         selectedDate!.month,
//         selectedDate!.day,
//         pickedTime.hour,
//         pickedTime.minute,
//       );
//       setState(() {
//         selectedTime = pickedDateTime;
//       });
//     }
//   }
//
//
//
// }