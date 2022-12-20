import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BadgetsScreen extends StatefulWidget {
  const BadgetsScreen({Key? key}) : super(key: key);

  @override
  State<BadgetsScreen> createState() => _BadgetsScreenState();
}

class _BadgetsScreenState extends State<BadgetsScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badges'),
      ),
      body: Center(
        child: Badge(
          badgeColor: Colors.blue,
          elevation: 4,
          animationType: BadgeAnimationType.scale,
          badgeContent: Text("$count"),
          shape: BadgeShape.circle,
          position: BadgePosition.bottomStart(),
          animationDuration: Duration(milliseconds: 500),
          child: Icon(
            Icons.access_time,
            size: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count = count + 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
