// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fappler_android_app/screens/familyMemberView/Reminder%20Functionality/DeleteReminderPopUp.dart';
// import 'AddReminderUI.dart';
// import 'package:fappler_android_app/screens/familyMemberView/Reminder%20Functionality/EditReminder.dart';
// import 'package:fappler_android_app/services/AlarmService.dart'; // Import your AlarmService class
//
// class MissedReminders extends StatefulWidget {
//   final String email;
//
//   MissedReminders({required this.email});
//
//   @override
//   State<MissedReminders> createState() => _MissedRemindersState();
// }
//
// class _MissedRemindersState extends State<MissedReminders> {
//   List<DateTime> missedAlarms = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadMissedAlarms();
//   }
//
//   Future<void> _loadMissedAlarms() async {
//     List<String> missedAlarmStrings = await AlarmService.getMissedAlarms();
//     missedAlarms = missedAlarmStrings.map((timeStr) => DateTime.parse(timeStr)).toList();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Missed Reminders",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection('User')
//                 .where('emailAddress', isEqualTo: widget.email)
//                 .snapshots(),
//             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               if (snapshot.data!.docs.isEmpty) {
//                 return Center(child: Text('No user found with this email'));
//               }
//               var userDocument = snapshot.data!.docs.first;
//               return StreamBuilder<QuerySnapshot>(
//                 stream: userDocument.reference.collection('Reminders').snapshots(),
//                 builder: (context, reminderSnapshot) {
//                   if (reminderSnapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (reminderSnapshot.hasError) {
//                     return Center(child: Text('Error: ${reminderSnapshot.error}'));
//                   }
//                   var missedReminderDocs = reminderSnapshot.data!.docs.where((doc) {
//                     var reminderData = doc.data() as Map<String, dynamic>;
//                     int hour = reminderData['Hour'] ?? 0;
//                     int minute = reminderData['Minute'] ?? 0;
//                     DateTime reminderTime = DateTime(
//                       DateTime.now().year,
//                       DateTime.now().month,
//                       DateTime.now().day,
//                       hour,
//                       minute,
//                     );
//                     return missedAlarms.any((missedAlarm) =>
//                     reminderTime.year == missedAlarm.year &&
//                         reminderTime.month == missedAlarm.month &&
//                         reminderTime.day == missedAlarm.day &&
//                         reminderTime.hour == missedAlarm.hour &&
//                         reminderTime.minute == missedAlarm.minute);
//                   }).toList();
//                   return ListView.builder(
//                     padding: EdgeInsets.all(16.0),
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: missedReminderDocs.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       var reminderData = missedReminderDocs[index].data() as Map<String, dynamic>;
//                       String reminderTitle = reminderData['Reminder Title'] ?? 'No title';
//                       String reminderContent = reminderData['Reminder Content'] ?? 'No Content';
//                       int hour = reminderData['Hour'] ?? 0;
//                       int minute = reminderData['Minute'] ?? 0;
//                       return InkWell(
//                         onTap: () {
//                           String reminderId = missedReminderDocs[index].id;
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ReminderContent(
//                                 reminderId: reminderId,
//                                 email: widget.email,
//                                 reminderTitle: reminderTitle,
//                                 reminderContent: reminderContent,
//                                 hour: hour,
//                                 minute: minute,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(vertical: 5),
//                           margin: EdgeInsets.symmetric(vertical: 10.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.white,
//                                 blurRadius: 4,
//                                 spreadRadius: 2,
//                               ),
//                             ],
//                           ),
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   title: Text(
//                                     reminderTitle,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   subtitle: Text(reminderContent),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 15),
//                                   child: Divider(
//                                     thickness: 1,
//                                     height: 20,
//                                   ),
//                                 ),
//                                 SizedBox(height: 15),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         String reminderId = missedReminderDocs[index].id;
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) => DeleteReminderPopUp(email: widget.email, reminderId: reminderId),
//                                         );
//                                       },
//                                       child: Container(
//                                         width: 150,
//                                         padding: EdgeInsets.symmetric(vertical: 12),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(10),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "Delete",
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.red,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             margin: EdgeInsets.only(top: 20, right: 20, bottom: 30),
//             child: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AddReminderContent(email: widget.email)),
//                 );
//               },
//               child: Icon(Icons.add, color: Colors.white),
//               backgroundColor: Color(0xFF5C389F),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
