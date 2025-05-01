// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class NavigationBarWidget extends StatefulWidget {
//   @override
//   State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
// }
//
// class _NavigationBarWidgetState extends State<NavigationBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final NavigationController controller = Get.find();
//
//     return Obx(
//           () => Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.deepPurple.withOpacity(0.2),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: const Offset(0, -3),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           child: NavigationBar(
//             indicatorShape: const CircleBorder(),
//             height: 90,
//             elevation: 0,
//             backgroundColor: Colors.white,
//             indicatorColor: Colors.deepPurple.shade100,
//             selectedIndex: controller.selectedIndex.value,
//             onDestinationSelected: (index) =>
//             controller.selectedIndex.value = index,
//             destinations: const [
//               NavigationDestination(
//                 icon: Icon(FontAwesomeIcons.robot,
//                     size: 35, color: Colors.deepPurple),
//                 label: "",
//               ),
//               NavigationDestination(
//                 icon: Icon(Iconsax.home, size: 35, color: Colors.deepPurple),
//                 label: "",
//               ),
//               NavigationDestination(
//                 icon: Icon(Iconsax.notification,
//                     size: 35, color: Colors.deepPurple),
//                 label: "",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
