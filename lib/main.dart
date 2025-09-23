import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/screen/auth_screen/calling_screen/calling.dart';
import 'package:massaging_ui_design/screen/auth_screen/massage_screen/massaging_screen.dart';
import 'package:massaging_ui_design/screen/splash_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home:SplashScreen()

      ),
    );
      // AnnotatedRegion<SystemUiOverlayStyle>(
      //     value:  SystemUiOverlayStyle(
      //       statusBarColor: Colors.black, // background color
      //       statusBarIconBrightness: Brightness.light, // Android = white icons
      //       statusBarBrightness: Brightness.dark, // iOS = white icons
      //     ),
      //     child:  ScreenUtilInit(
      //       designSize: const Size(375, 812),
      //       builder: (context, child) => MaterialApp(
      //
      //           title: 'Flutter Demo',
      //           debugShowCheckedModeBanner: false,
      //
      //           theme: ThemeData(
      //
      //
      //             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //           ),
      //           home:SplashScreen()
      //
      //       ),
      //     )
      //
      // );


  }
}
