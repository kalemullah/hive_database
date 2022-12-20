import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets_list/provider/model.dart';

class ScreenOne extends StatefulWidget {
  User appuser;
  ScreenOne({super.key, required this.appuser});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appuser.name.toString()),
      ),
      body: Center(child: Text("${widget.appuser.age}")),
    );
  }
}
