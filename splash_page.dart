
import 'package:flutter/material.dart';
import 'package:news_app/news_project/sign_in_page.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Image.asset(
              "assets/images/NewsWatch_Logo.png",
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              "All type of news from all trusted sources of all type of people",
              style: TextStyle(color: Colors.grey, fontSize: 3.5.w),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 83.w),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));
                },
                icon: const Icon(Icons.arrow_forward_ios)),
          ),
        ],
      ),
    );
  }
}
