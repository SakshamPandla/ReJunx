import 'package:flutter/material.dart';
import 'package:rejunx/auth/login.dart';
import 'package:rejunx/help.dart';
import 'package:rejunx/splash.dart';
import 'package:rejunx/utils/bottombar.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer( // Wrap your app in Sizer here
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ReJunx',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
            useMaterial3: true,
          ),
          home: Bottombar(),
        );
      },
    );
  }
}
