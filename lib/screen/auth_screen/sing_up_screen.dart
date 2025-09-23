import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/screen/auth_screen/massage_screen/massaging_screen.dart';
import 'package:massaging_ui_design/widgets/custom_elevated_button.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/custom_input_text_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  bool _isClick = false;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conformPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 30.h),
                Center(
                  child: CustomText(
                    text: 'Sign up with Email',
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text:
                      'Get chatting with friends and family today by \nsigning up for our chat app!',
                ),

                SizedBox(height: 20.h),

                ///name textFormField
                CustomInputTextField(
                  hintText: 'Please enter your name',
                  labelText: 'Name',
                  textEditingController: _nameController,
                  validationError: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                /// Email textFormField
                CustomInputTextField(
                  hintText: 'Please enter your email',
                  labelText: 'Email',
                  textEditingController: _emailController,

                  validationError: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value.trim())) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                CustomInputTextField(
                  hintText: 'Please enter your name',
                  labelText: 'Name',
                  textEditingController: _passwordController,
                  validationError: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your  password';
                    }
                    if (value.trim().length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                CustomInputTextField(
                  hintText: 'Please enter your name',
                  labelText: 'Name',
                  textEditingController: _conformPasswordController,
                  validationError: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your conform password';
                      }
                      if (_passwordController.text != _conformPasswordController.text) {
                        return 'Password  are not massing';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 80.h),

                CustomElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isClick = !_isClick;
                    });
                    _createAccount();
                  },
                  color: _isClick ? Colors.teal : Colors.black12,
                  child: CustomText(
                    text: 'Create an account',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _createAccount(){
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isClick = true;
      });
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 500),
          child: MassagingScreen(),
        ),
      );
    }
  }
}
