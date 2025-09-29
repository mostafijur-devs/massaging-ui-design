import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../widgets/custom_elevated_button.dart';

class IncomingCall extends StatefulWidget {
  const IncomingCall({super.key});

  @override
  State<IncomingCall> createState() => _IncomingCallState();
}

class _IncomingCallState extends State<IncomingCall> {
  double _dragPosition = 0.0;
  final double _containerWidth = 250.0;
  final double _iconSize = 50.0;
  final double _padding = 8.0;

  // ২. ড্র্যাগ শুরু হলে এবং চলতে থাকলে এই ফাংশনটি কল হবে
  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      // ড্র্যাগের পরিমাণ অনুযায়ী _dragPosition আপডেট করা হচ্ছে
      _dragPosition += details.delta.dx;

      // স্লাইডারকে তার নির্দিষ্ট সীমার মধ্যে রাখা হচ্ছে
      if (_dragPosition < 0) {
        _dragPosition = 0;
      }
      if (_dragPosition > _containerWidth - _iconSize - _padding) {
        _dragPosition = _containerWidth - _iconSize - _padding;
      }
    });
  }

  // ৩. যখন ড্র্যাগ শেষ হবে তখন এই ফাংশনটি কল হবে
  void _onDragEnd(DragEndDetails details) {
    // স্লাইডটি কি শেষ পর্যন্ত পৌঁছেছে কি না তা যাচাই করা হচ্ছে
    if (_dragPosition >= _containerWidth - _iconSize - _padding - 10) {
      // widget.onSlideComplete();
    }
    // স্লাইড শেষ হলে আইকনকে তার শুরুর অবস্থানে ফিরিয়ে আনা হচ্ছে
    setState(() {
      _dragPosition = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsImages.sendingCallImane,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            right: 140.r,
            top: 205.r,
            child: Column(
              children: [
                Image.asset(AssetsImages.views),
                SizedBox(height: 10),
                CustomText(
                  text: 'Borsha Akther',
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(text: 'Incoming call', color: Colors.white60),
              ],
            ),
          ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Column(
                  children: [
                    Icon(Icons.access_alarms_outlined, color: Colors.white60),
                    CustomText(text: 'Remind me', color: Colors.white60),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.message, color: Colors.white60),
                    CustomText(text: 'Message', color: Colors.white60),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            right: 30,
            left: 30,
            child: SizedBox(
              height: 65,
              width: ScreenUtil().screenWidth * 0.9,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SlideAction(
                  text: 'Slide to answer',
                  sliderButtonIcon: const Icon(Icons.call, color: Colors.green),
                  outerColor: Colors.grey.withOpacity(0.5),
                  innerColor: Colors.white,

                  onSubmit: () {
                   return null;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
