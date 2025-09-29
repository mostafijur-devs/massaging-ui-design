import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:massaging_ui_design/utils/helper_function.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';

import '../../utils/assets_image.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black, // background color
          statusBarIconBrightness: Brightness.light, // Android = white icons
          statusBarBrightness: Brightness.dark, // iOS = white icons
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerWidget(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: AssetsImages.imageDataList.length,
                      itemBuilder: (context, index) {
                        final data = AssetsImages.imageDataList[index];
                        return Row(
                          children: [
                            Expanded(
                              flex: 2,
                                child: Image.asset(data['imagePath'])),
                            SizedBox(width: 10),

                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: data['name'],
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: 20,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_callback_outlined,
                                        color: Colors.green,
                                        size: 16,
                                      ),
                                      SizedBox(width: 5,),
                                      CustomText(
                                        text: data['time'],
                                        color: Colors.black54,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [
                                    Image.asset(
                                      AssetsImages.callIcon,
                                      color: Colors.black,
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Image.asset(
                                      AssetsImages.groupIcon,
                                      color: Colors.black,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                        ListTile(
                          leading: Image.asset(data['imagePath']),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: data['name'],
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_callback_outlined,
                                    color: Colors.green,
                                  ),
                                  CustomText(
                                    text: data['time'],
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(text: data['time'], fontSize: 12),
                              SizedBox(height: 5),
                              data['count'] != null
                                  ? circuleBox(
                                      height: 20,
                                      width: 20,
                                      boxColor: Colors.red,
                                      borderColor: Colors.transparent,
                                      child: Center(
                                        child: CustomText(
                                          text: data['count'] ?? '',
                                          fontSize: 10,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    )
                                  : Text(''),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(Icons.search, color: Colors.white),
          ),
          Expanded(
            child: Text(
              'Calls',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          circuleBox(
            child: Image.asset(AssetsImages.callIcon, color: Colors.white),
            boxColor: Colors.transparent,
            borderWidth: 2,
          ),
        ],
      ),
    );
  }
}
