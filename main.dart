import 'package:first_project/calculator_screen.dart';
import 'package:first_project/news_project/select_city_page.dart';
import 'package:first_project/news_project/sign_in_page.dart';
import 'package:first_project/news_project/splash_page.dart';
import 'package:first_project/tic_tac_toe_app.dart';
import 'package:first_project/ui_demo.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'getx/draggable_drag_target/draggable_drag_targets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        );
      },
    );
  }
}
