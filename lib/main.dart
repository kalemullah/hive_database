import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:widgets_list/provider/testing.dart';
import 'package:widgets_list/provider/testing_view_model.dart';

import 'package:widgets_list/widgets/appthem.dart';
import 'package:widgets_list/widgets/badges.dart';
import 'package:widgets_list/widgets/hive_database.dart';
import 'package:widgets_list/widgets/searchbar.dart';
import 'package:widgets_list/widgets/slider.dart';

// import 'package:widgets_list/widgets/myhomepage.dart';
import 'package:widgets_list/widgets/stepr.dart';
import 'package:widgets_list/widgets/timerwidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TestingViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blue,
            elevation: 10,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(
              fontSize: 14.0,
            ),
          ),
          primaryColor: Colors.blue,
          // brightness: Brightness.dark,

          // typography: Typography(platform: TargetPlatform.w),
          primarySwatch: Colors.red,
        ),
        home: const HiveDatabseScreen(),
        // home: TestingScreen(),
      ),
    );
    // home: SliderWidget());
    // home: SearchBarWidget());
    // home: SteperWidget());
  }
}
