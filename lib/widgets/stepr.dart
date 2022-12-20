import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SteperWidget extends StatefulWidget {
  const SteperWidget({super.key});

  @override
  State<SteperWidget> createState() => _SteperWidgetState();
}

class _SteperWidgetState extends State<SteperWidget> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steper"),
      ),
      body: Center(
        child: Stepper(
          elevation: 10,
          steps: [
            Step(
              title: Text("active"),
              content: TextField(),
              isActive: currentStep > 0,
              subtitle: Text("complete"),
              state: currentStep > 0 ? StepState.complete : StepState.disabled,
            ),
            Step(
                title: Text("first 2"),
                content: Text("information for step 2")),
            Step(
                title: Text("first 2"), content: Text("information for step 3"))
          ],
          currentStep: currentStep,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepCancel: () {
            if (currentStep != 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
          onStepContinue: () {
            if (currentStep != 2) {
              setState(() {
                currentStep += 1;
              });
            }
          },
        ),
      ),
    );
  }
}
