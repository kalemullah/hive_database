import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppThemeScreen extends StatefulWidget {
  const AppThemeScreen({super.key});

  @override
  State<AppThemeScreen> createState() => _AppThemeScreenState();
}

class _AppThemeScreenState extends State<AppThemeScreen> {
  @override
  Widget build(BuildContext context) {
    const text = Text("appthem");
    return Scaffold(
      appBar: AppBar(
        title: const Text("appTheme"),
      ),
      body: Center(
        child: Text(
          "arshad",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            // colorScheme:ColorScheme(brightness: Brightness.dark, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface)
            ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Text(
            "add",
          ),
        ),
      ),
    );
  }
}
