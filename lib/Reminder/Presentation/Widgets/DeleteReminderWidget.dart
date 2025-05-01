// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// class DeleteReminderPopUp extends StatefulWidget {
//   String email;
//   String reminderId;
//   DeleteReminderPopUp({required this.email,required this.reminderId});
//
//   @override
//   State<DeleteReminderPopUp> createState() => _DeleteReminderPopUpState();
// }
//
// class _DeleteReminderPopUpState extends State<DeleteReminderPopUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Expanded(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 10.0),
//                   child: Container(
//                     child: Text(
//                       "Delete Reminder",
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Text("Are you sure you want to delete this reminder?"),
//               SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 35,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black12),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "Cancel",
//                           style: TextStyle(color: Colors.black),
//                         )),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width: 100,
//                     height: 35,
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.3),
//                           )
//                         ]),
//                     child: TextButton(
//                         style: TextButton.styleFrom(
//                           elevation: 5,
//                         ),
//                         onPressed: () {
//                           _deleteReminder(widget.reminderId);
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "Delete",
//                           style: TextStyle(color: Colors.white),
//                         )),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void _deleteReminder(String reminderId,) async {
//     try {
//       // Fetch the user document based on the email address
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('User')
//           .where('emailAddress', isEqualTo: widget.email)
//           .get()
//           .then((querySnapshot) => querySnapshot.docs.first);
//
//       // Check if the user document exists
//       if (userSnapshot.exists) {
//         // Access the Family Tree collection within the user document
//         await userSnapshot.reference
//             .collection('Reminders')
//             .doc(reminderId)
//             .delete();
//
//         // Print success message or perform any other actions upon successful deletion
//         print('Reminder deleted successfully!');
//       } else {
//         print('User document does not exist');
//       }
//     } catch (error) {
//       // Handle errors here
//       print('Error deleting family member: $error');
//     }
//   }
// }