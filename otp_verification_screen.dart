
import 'package:flutter/material.dart';
import 'package:news_app/news_project/reset_password_screen.dart';
import 'package:sizer/sizer.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool emailError = false;
  bool otpError = false;

  void verifyOTP() {
    setState(() {
      emailError = emailController.text.isEmpty;
      otpError = otpController.text.isEmpty;
    });

    if (!emailError && !otpError) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/NewsWatch_Logo.png', // Replace with your actual asset path
                height: 10.h,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "Enter your Email",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                suffix: ElevatedButton(
                  onPressed: () {}, // Implement OTP request functionality
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Get OTP",
                    style: TextStyle(fontSize: 10.sp, color: Colors.white),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            if (emailError)
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  "Please check your mail, and enter the verification code",
                  style: TextStyle(color: Colors.red, fontSize: 10.sp),
                ),
              ),
            SizedBox(height: 4.h),
            Text(
              "Verification Code",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                hintText: "Enter OTP",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            if (otpError)
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  "Please enter your valid OTP",
                  style: TextStyle(color: Colors.red, fontSize: 10.sp),
                ),
              ),
            SizedBox(height: 10.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 10.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
