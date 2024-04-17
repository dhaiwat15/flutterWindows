import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:physiotherapy/Database/main_database_helper.dart';
import 'package:physiotherapy/Screens/login.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:wakelock/wakelock.dart';
import 'package:window_size/window_size.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    setWindowMinSize(Size(1080, 720));

    setWindowMaxSize(Size.infinite);
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //Just to initialise database

    DatabaseHelper.instance.database;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return Sizer(builder: (context, orientation, deviceType) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        // DeviceOrientation.portraitDown,
      ]);
      return MaterialApp(
        // theme: ThemeData.light(),
        // darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        //themeMode: ThemeMode.dark,
        // darkTheme: ThemeData.dark(),
        home: LoginScreen(),
      );
    });
  }
}
