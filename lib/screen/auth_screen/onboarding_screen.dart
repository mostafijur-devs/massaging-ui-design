import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:massaging_ui_design/screen/auth_screen/sing_up_screen.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';
import 'package:massaging_ui_design/utils/helper_function.dart';
import 'package:massaging_ui_design/widgets/custom_elevated_button.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black, // background color
        statusBarIconBrightness: Brightness.light, // Android = white icons
        statusBarBrightness: Brightness.dark, // iOS = white icons
      ),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              // end: Alignment.,
              begin: Alignment.topLeft,
              end: Alignment.center,
              colors: <Color>[
                // Colors.black,
                Colors.purple.withValues(alpha: 1),
                Colors.black,

                // Colors.black.withOpacity(0.8),
              ],
            ),
          ),

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ListView(
                children: [
                  Center(child: Image.asset(AssetsImages.appBanner)),
                  SizedBox(height: 20.h),

                  CustomText(
                    text: 'Connect friends easily & quickly',
                    textStyle: GoogleFonts.abhayaLibre(
                      fontWeight: FontWeight.bold,
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  ),


                  SizedBox(height: 20.h),
                  CustomText(
                    text:
                        'Our chat app is the perfect way to stay \nconnected with friends and family.',
                    color: Colors.white.withValues(alpha: 0.5),
                  ),

                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      circuleBox(
                        child: Image.asset(AssetsImages.googleImage),
                        boxColor: Colors.black54,
                      ),
                      circuleBox(
                        child: Image.asset(AssetsImages.facebookImage),
                        boxColor: Colors.black54,
                      ),
                      circuleBox(
                        child: Image.asset(
                          AssetsImages.appleImage,
                          color: Colors.white60,
                        ),
                        boxColor: Colors.black54,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(AssetsImages.outLine),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    child: CustomText(
                      text: 'Sign up with mail',
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 500),
                          child: SingUpScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Existing account?',

                        children: [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 500),
                                    child: LoginScreen(),
                                  ),
                                );
                              },
                              child: CustomText(
                                text: ' Login',
                                color: Colors.green,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
