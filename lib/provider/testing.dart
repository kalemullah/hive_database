// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import 'package:widgets_list/provider/model.dart';
// import 'package:widgets_list/provider/screen1.dart';
// import 'package:widgets_list/provider/testing_view_model.dart';

// class TestingScreen extends StatefulWidget {
//   const TestingScreen({super.key});

//   @override
//   State<TestingScreen> createState() => _TestingScreenState();
// }

// class _TestingScreenState extends State<TestingScreen> {
//   TestingViewModel testingViewModel = TestingViewModel();

//   @override
//   Widget build(BuildContext context) {
//     Future<bool> showExitPopup() async {
//       return await showDialog(
//             //show confirm dialogue
//             //the return value will be from "Yes" or "No" options
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text('Exit App'),
//               content: Text('Do you want to exit an App?'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   //return false when click on "NO"
//                   child: Text('No'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);

//                     // SystemNavigator.pop();
//                     exit(0);
//                   },
//                   //return true when click on "Yes"
//                   child: Text('Yes'),
//                 ),
//               ],
//             ),
//           ) ??
//           false; //if showDialouge had returned null, then return false
//     }

//     return Consumer<TestingViewModel>(
//       builder: (context, model, child) => WillPopScope(
//         onWillPop: showExitPopup,
//         child: Scaffold(
//           appBar: AppBar(title: Text(model.myuser!.name.toString())),
//           body: Center(
//             child: Text(model.myuser!.toJson().toString()),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {},
//           ),
//         ),
//       ),
//     );
//   }
// }
