import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';

import '../../../utils/helper_function.dart';
import '../../../widgets/custom_text.dart';

class GroupCall extends StatelessWidget {
  const GroupCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              /// background image section
              Image.asset(
                AssetsImages.groupLiveCallImage,
                width: double.infinity,
                height: 679.h,
                fit: BoxFit.cover,
              ),

              /// Call receive , muted, spacker, video on off  UI section
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    circuleBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          AssetsImages.microphoneIcon,
                          color: Colors.white,
                        ),
                      ),
                      // boxColor: Colors.black.withValues(alpha: 0.5),
                      // boxColor: Color(OxFF333e39)
                      boxColor: Color(0xFF958b8b),
                      borderColor: Colors.transparent,
                    ),
                    circuleBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          AssetsImages.musicIcon,
                          color: Colors.white,
                        ),
                      ),
                      boxColor: Color(0xFF958b8b),

                      borderColor: Colors.transparent,
                    ),
                    circuleBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          AssetsImages.groupIcon,
                          color: Colors.white,
                        ),
                      ),
                      boxColor: Color(0xFF958b8b),
                      borderColor: Colors.transparent,
                    ),
                    circuleBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.messenger_outline,
                          color: Colors.white,
                        ),
                      ),
                      boxColor: Colors.teal,
                      borderColor: Colors.transparent,
                    ),
                    circuleBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                      boxColor: Colors.red,
                      borderColor: Colors.transparent,
                    ),
                  ],
                ),
              ),

              /// meeting section
              Positioned(
                top: 40,
                left: 20,
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.8,

                  child: CustomText(
                    text: 'Meeting with Lora Adom',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.sp,
                    color: Colors.white70,
                  ),
                ),
              ),
              /// group call admin section
              Positioned(
                top: 200,
                left: 20,
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AssetsImages.imageDataList[0]['imagePath'],
                        width: 42.w,
                        height: 42.h,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: AssetsImages.imageDataList[1]['name'],
                              color: Colors.white.withValues(alpha: 0.5.r),
                              textOverflow: TextOverflow.ellipsis,
                            ),
                            CustomText(
                              text: 'Meeting organizer',
                              fontSize: 13.sp,
                              color: Colors.white.withValues(alpha: 0.5.r),
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// live massage section
              Positioned(
                bottom: 100,
                left: 15,
                child: SizedBox(
                  height: 240,
                  width: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: AssetsImages.imageDataList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AssetsImages.imageDataList[index]['imagePath'],
                              width: 42,
                              height: 42,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: AssetsImages
                                        .imageDataList[index]['name'],
                                    color: Colors.white.withValues(alpha: 0.5),
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  CustomText(
                                    text: 'Active now',
                                    fontSize: 13,
                                    color: Colors.white.withValues(alpha: 0.5),
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: SizedBox(
              //     width: ScreenUtil().screenWidth*0.8,
              //
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //
              //         SizedBox(height: 30.h,),
              //         CustomText(text: 'Meeting with Lora Adom',fontWeight: FontWeight.bold,fontSize: 40.sp,color: Colors.white70,),
              //         SizedBox(width: 30.h),
              //
              //         Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Image.asset(AssetsImages.imageDataList[0]['imagePath'], width: 42.w, height: 42.h),
              //             SizedBox(width: 10.w),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   CustomText(text: AssetsImages.imageDataList[1]['name'], color: Colors.white.withValues(alpha: 0.5.r),textOverflow:TextOverflow.ellipsis,),
              //                   CustomText(text: 'Meeting organizer',fontSize: 13.sp,color: Colors.white.withValues(alpha: 0.5.r),textOverflow: TextOverflow.ellipsis,)
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(width: 30.h),
              //         SizedBox(
              //           height: 200,
              //           width: 220,
              //           child: ListView.builder(
              //             shrinkWrap:  true,
              //             itemCount: AssetsImages.imageDataList.length,
              //             itemBuilder: (context, index) {
              //               return Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child:
              //                 Row(
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     Image.asset(AssetsImages.imageDataList[index]['imagePath'], width: 42, height: 42),
              //                     SizedBox(width: 10),
              //                     Expanded(
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           CustomText(text: AssetsImages.imageDataList[index]['name'], color: Colors.white.withValues(alpha: 0.5),textOverflow:TextOverflow.ellipsis,),
              //                           CustomText(text: 'Typing live massage section',fontSize: 13,color: Colors.white.withValues(alpha: 0.5),textOverflow: TextOverflow.ellipsis,)
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               );
              //             },),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AssetsImages.imageDataList.length,
              itemBuilder: (context, index) {
                final data = AssetsImages.imageDataList[index];
                return SizedBox(
                  height: 68,
                  width: 68,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          data["imagePath"],
                          height: 68,
                          width: 68,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,

                        // top: 40,
                        child: circuleBox(
                          height: 22,
                          width: 22,
                          child: Icon(
                            Icons.mic_off_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                          boxColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
