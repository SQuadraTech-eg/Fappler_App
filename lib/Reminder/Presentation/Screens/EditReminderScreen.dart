// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:flutter/material.dart";
// import "package:fappler_android_app/widgets/commonWidgets/HomeButton.dart";
// import "package:fappler_android_app/widgets/commonWidgets/NavBar.dart";
// import "package:fappler_android_app/widgets/commonWidgets/drawer.dart";
//
// class ReminderContent extends StatefulWidget {
//   late final String reminderTitle;
//   late final String reminderContent;
//   late final int hour;
//   late final int minute;
//   String reminderId;
//   String email;
//
//   ReminderContent({
//     required this.reminderTitle,
//     required this.reminderContent,
//     required this.hour,
//     required this.minute,
//     required this.email,
//     required this.reminderId,
//   });
//
//   @override
//   State<ReminderContent> createState() => _ReminderContentState();
// }
//
// class _ReminderContentState extends State<ReminderContent> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _contentController = TextEditingController();
//   List<Reminder> reminders = [];
//
//   TimeOfDay _selectedTime = TimeOfDay.now();
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime,
//     );
//     if (pickedTime != null) {
//       setState(() {
//         _selectedTime = pickedTime;
//       });
//     }
//   }
//
//   late TextEditingController TitleController;
//   late TextEditingController ContentController;
//   late TextEditingController HourController;
//   late TextEditingController MinuteController;
//
//   @override
//   void initState() {
//     super.initState();
//     TitleController = TextEditingController(text: widget.reminderTitle);
//     ContentController = TextEditingController(text: widget.reminderContent);
//     HourController = TextEditingController(text: widget.hour.toString());
//     MinuteController = TextEditingController(text: widget.minute.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       appBar: AppBar(
//         title: Center(
//           child: Container(
//             child: Image.asset('assets/fappler_white_logo.png', width: 200, height: 60),
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
//                         title: TextFormField(
//                           controller: TitleController,
//                           decoration: InputDecoration(
//                             hintStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                             border: InputBorder.none,
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
//                         title: TextFormField(
//                           controller: ContentController,
//                           maxLines: 2,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
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
//
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Your updateData function
//                     updateData();
//
//                     // Show the SnackBar
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           'Reminder updated successfully',
//                           style: TextStyle(color: Colors.white, fontSize: 16), // Adjust font size
//                         ),
//                         duration: Duration(seconds: 3), // Duration for the SnackBar to be displayed
//                         backgroundColor: Color(0xFF5C389F), // Set the background color
//                         behavior: SnackBarBehavior.floating, // Make the SnackBar floating
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0), // Rounded corners
//                         ),
//                         margin: EdgeInsets.all(16.0), // Margin around the SnackBar
//                         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Increase padding
//                       ),
//                     );
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
//                       'Save',
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
//   Future<void> updateData() async {
//     try {
//       // Query the user document based on the email address
//       QuerySnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('User')
//           .where('emailAddress', isEqualTo: widget.email)
//           .get();
//
//       if (userSnapshot.docs.isNotEmpty) {
//         // Assuming there's only one document for each email
//         DocumentSnapshot userDocument = userSnapshot.docs.first;
//
//         // Update the data in the family tree collection
//         await userDocument.reference
//             .collection('Reminders')
//             .doc(widget.reminderId)
//             .update({
//           'Reminder Title': TitleController.text,
//           'Reminder Content': ContentController.text,
//           'Hour': _selectedTime.hour,
//           'Minute': _selectedTime.minute,
//         });
//
//         // Print success message or perform any other actions upon successful update
//         print('Data updated successfully!');
//       } else {
//         // Handle case where no user document is found
//         print('No user found with email: ${widget.email}');
//       }
//     } catch (error) {
//       // Handle errors here
//       print('Error updating data: $error');
//     }
//   }
// }
//
// class Reminder {
//   final String title;
//   final String content;
//   final int hour;
//   final int minute;
//
//   Reminder({
//     required this.title,
//     required this.content,
//     required this.hour,
//     required this.minute,
//   });
// }
