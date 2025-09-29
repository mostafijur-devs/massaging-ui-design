import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/screen/auth_screen/massage_screen/massaging_screen.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';
import 'package:massaging_ui_design/utils/helper_function.dart';
import 'package:massaging_ui_design/widgets/custom_elevated_button.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool  _isClick = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

          return [
          ];
        },
        body:Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: CustomText(
                    text: 'Log in to Chatbox',
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text:
                      'Welcome back! Sign in using your social\n       account or email to continue us',
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circuleBox(
                      child: Image.asset(AssetsImages.googleImage),
                      borderColor: Colors.black,
                    ),
                    circuleBox(
                      child: Image.asset(AssetsImages.facebookImage),
                      borderColor: Colors.black,
                    ),
                    circuleBox(
                      child: Image.asset(AssetsImages.appleImage),
                      borderColor: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Image.asset(AssetsImages.outLine, color: Colors.black),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide(width: 2.sw)),
                    label: CustomText(text: 'Email'),
                    hint: CustomText(text: 'Please enter your email'),
                    contentPadding: EdgeInsets.symmetric(vertical: 20.r),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    label: CustomText(text: 'Password'),
                    hint: CustomText(text: 'Please enter your Password'),
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.trim().length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 100.h),
                CustomElevatedButton(

                  onPressed: () {
                    setState(() {
                      _isClick = !_isClick;
                    });
                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        _isClick = true;
                      });
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds:500),
                          child: MassagingScreen(),
                        ),
                      );
                    }





            
                  },
                  color:_isClick ? Colors.teal: Colors.black12,
                  child: CustomText(text: 'Log In', fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {},
                  child: CustomText(text: 'Forgot password?', color: Colors.teal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
