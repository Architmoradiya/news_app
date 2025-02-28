
import 'package:flutter/material.dart';
import 'package:news_app/news_project/select_city_page.dart';
import 'package:news_app/news_project/sign_in_page.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool? userType;

  void _signUp(BuildContext context) {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        userType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please fill in all fields and select a user type")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CitySelection()),
    );
  }

  void _navigateToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            Center(
                child: Image.asset("assets/images/NewsWatch_Logo.png",
                    height: 65.sp)),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(fontSize: 12.sp)),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 12.sp)),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(fontSize: 12.sp)),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 12.sp)),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 5.h, bottom: 2.h),
              child: Text(
                "I am a",
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text("Media Reporter"),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: userType,
                      onChanged: (val) {
                        setState(() {
                          userType = val;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Visitor"),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: userType,
                      onChanged: (val) {
                        setState(() {
                          userType = val;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Center(
              child: SizedBox(
                width: 75.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => _signUp(context),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Center(
                child: Text(
              "or sign in with",
              style: TextStyle(fontSize: 12.sp),
            )),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(Icons.mail, size: 17.sp), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.g_mobiledata, size: 17.sp),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.facebook, size: 17.sp), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.shopping_basket_rounded, size: 17.sp),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.apple, size: 17.sp), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 20),

            // Added "Sign In" Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => _navigateToSignIn(context),
                child: Text(
                  "Already have an account? Sign In",
                  style: TextStyle(fontSize: 11.sp, color: Colors.blue),
                ),
              ),
            ),

            SizedBox(height: 3.h),
            Center(
              child: Text(
                "By signing up to News24 you are accepting our Terms & Conditions",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.sp, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
