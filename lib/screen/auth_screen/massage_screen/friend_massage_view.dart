import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';
import 'package:massaging_ui_design/utils/helper_function.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';

import '../../calls/calling_screen/incoming_call.dart';

class FriendMassageView extends StatefulWidget {
  const FriendMassageView({super.key, required this.userData});

  final Map<String, dynamic> userData;

  @override
  State<FriendMassageView> createState() => _FriendMassageViewState();
}

class _FriendMassageViewState extends State<FriendMassageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.userData['imagePath'], width: 42, height: 42),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: widget.userData['name'], color: Colors.black),
                CustomText(text: 'Active now',fontSize: 13,)
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => IncomingCall(),));
            },
            icon: Image.asset(AssetsImages.callIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(AssetsImages.groupIcon, width: 35, height: 50),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: [
                      Center(
                        child: CustomText(
                          text: 'Today',
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: _sendingMassage(chartText: 'Hello! Jon abraham'),
                      ),
                      SizedBox(height: 20.h),

                      _receiveMassage(
                        massageList: [
                          _friendMassage(massage: 'Hello ! Nazrul How are you?'),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      Align(
                        alignment: Alignment.topRight,
                        child: _sendingMassage(chartText: 'You did your job well!'),
                      ),
                      _receiveMassage(
                        massageList: [
                          _friendMassage(massage: 'Have a great working week!!'),
                          _friendMassage(massage: 'Hope you like it'),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Align(alignment: Alignment.topRight, child: _voiceMassage()),
                      SizedBox(height: 20.h),

                    ],
                  ),
                ),
              ),
              _footerAction( ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerAction() {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Row(
      children: [
        Image.asset(AssetsImages.clipIcon),

        SizedBox(width: 10.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 214,
            decoration: BoxDecoration(
              color: Colors.black12.withValues(alpha: 0.05),

              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Write your message',
                suffixIcon: Image.asset(AssetsImages.fileIcon),
              ),
            ),
          ),
        ),

        !isKeyboardOpen
            ? Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Image.asset(AssetsImages.cameraIcon),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Image.asset(AssetsImages.microphoneIcon),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: circuleBox(
                  child: Icon(Icons.send, color: Colors.white),
                  boxColor: Colors.teal,
                  width: 40,
                  height: 40,
                ),
              ),
      ],
    );
  }

  Widget _receiveMassage({required List<Widget> massageList}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.userData['imagePath']),
        SizedBox(width: 14),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            CustomText(
              text: widget.userData['name'],
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            // CustomText(text: 'Hello ! Nazrul How are you?',color: Colors.black,fontSize: 13,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: massageList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _friendMassage({required String massage}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: 250,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: Color(0xff15715AFF),
          color: Colors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.r),
            bottomLeft: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
        ),
        child: CustomText(text: massage, color: Colors.black),
      ),
    );
  }

  Widget _sendingMassage({required String chartText}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: Color(0xff15715AFF),
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: CustomText(text: chartText, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: CustomText(text: '09:25 AM', fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  Widget _voiceMassage() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: SizedBox(
        width: 230,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: circuleBox(
                width: 25,
                height: 25,
                boxColor: Colors.white,
                borderColor: Colors.transparent,
                child: Icon(Icons.play_arrow, color: Colors.teal),
              ),
            ),
            SizedBox(width: 5),
            // Waveform (placeholder)
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, index) {
                  final height = (index % 2 == 0) ? 20.0 : 10.0;
                  return Row(
                    children: [
                      Container(
                        width: 3,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        height: height,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Timestamp
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "00:16",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
