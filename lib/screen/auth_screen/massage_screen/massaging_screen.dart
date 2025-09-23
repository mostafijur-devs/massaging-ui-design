import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:massaging_ui_design/screen/auth_screen/massage_screen/friend_massage_view.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';
import 'package:massaging_ui_design/utils/helper_function.dart';
import 'package:massaging_ui_design/widgets/custom_text.dart';
import 'package:page_transition/page_transition.dart';

class MassagingScreen extends StatefulWidget {
  const MassagingScreen({super.key});

  @override
  State<MassagingScreen> createState() => _MassagingScreenState();
}

class _MassagingScreenState extends State<MassagingScreen> {
  @override
  Widget build(BuildContext context) {
    return
      AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.black, // background color
            statusBarIconBrightness: Brightness.light, // Android = white icons
            statusBarBrightness: Brightness.dark, // iOS = white icons
          ),
          child:Scaffold(
      backgroundColor: Colors.black,
      body:  SafeArea(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _headerWidget(),
        SizedBox(height: 10),
        _userView(),
        _userChatList(),
      ],
    ),),

      bottomNavigationBar: _bottomNavigation(),
    ));
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
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Image.asset(AssetsImages.personImage),
        ],
      ),
    );
  }

  Widget _userView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 100,
        // width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: AssetsImages.friendList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(AssetsImages.friendList[index]),
                  Text(
                    'Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
///all user chat list view
  Widget _userChatList() {
    return Expanded(
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
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background:Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10,),
                  circuleBox(child:  Image.asset(AssetsImages.notificationIcon),
                      boxColor: Colors.black,),
                  SizedBox(width: 10,),

                  circuleBox(child: Image.asset(AssetsImages.trashIcon),boxColor: Colors.red),
                ],
              ),
              confirmDismiss: (direction) {

                return showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title:CustomText(
                      text: data['name'],
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ) ,
                    content:
                    Text('Are you sure to delete your friend ${data['name']},'),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('delete'),
                      ),
                    ],
                  );
                },);
              },
              onDismissed: (direction) {

              },

              child: GestureDetector(

                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds:500),
                      child: FriendMassageView(userData: data,),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Image.asset(data['imagePath'])),
                    Expanded(
                      flex: 3,
                      child: Column(
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
                          CustomText(
                            text: data['description'],
                            color: Colors.black54,
                             textOverflow: TextOverflow.ellipsis,
                            fontSize: 15,

                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
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
                      ),
                    ),
                  ],
                ),
              ),
            );
            //   ListTile(
            //   leading: Image.asset(data['imagePath']),
            //   title: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       CustomText(
            //         text: data['name'],
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20,
            //       ),
            //       CustomText(
            //         text: data['description'],
            //         color: Colors.black54,
            //         fontSize: 15,
            //       ),
            //     ],
            //   ),
            //   trailing: Column(
            //     // mainAxisAlignment: MainAxisAlignment.end,
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       CustomText(text: data['time'], fontSize: 12),
            //       SizedBox(height: 5),
            //       data['count'] != null
            //           ? circuleBox(
            //               height: 20,
            //               width: 20,
            //               boxColor: Colors.red,
            //               borderColor: Colors.transparent,
            //               child: Center(
            //                 child: CustomText(
            //                   text: data['count'] ?? '',
            //                   fontSize: 10,
            //                   color: Colors.white60,
            //                 ),
            //               ),
            //             )
            //           : Text(''),
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }

  /// BottomNavigationBar section

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_calling_3_outlined),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}




