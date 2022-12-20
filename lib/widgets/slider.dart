import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double changevalue = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slider'),
      ),
      body: Center(
          child: Slider(
        value: changevalue,
        max: 100,
        min: 10,
        divisions: 20,
        autofocus: true,
        inactiveColor: Colors.grey,
        label: "Volume",
        mouseCursor: MouseCursor.defer,
        thumbColor: Colors.amber,
        onChanged: (value) {
          setState(() {
            changevalue = value;
          });
          // Timer.periodic(Duration(seconds: 1), (timer) {
          //   if (changevalue < 100) {
          //     setState(() {
          //       changevalue += 1;
          //     });
          //   } else {
          //     timer.cancel();
          //   }
          // });

          print('$changevalue');
        },
      )),
    );
  }
}
