import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'slideScreensClass.dart';
import 'webViewClass.dart';
import 'notifications.dart';

bool seen = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    isSeenScreen();
    super.initState();
  }

  Future isSeenScreen() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedSeenValue = sharedPreferences.getBool("seen");
    setState(() {
      seen = obtainedSeenValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Over Screens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: seen ? MainPage() : SlideScreens(),
    );
  }
}
