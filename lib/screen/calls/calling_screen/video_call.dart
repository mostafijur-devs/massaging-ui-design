import 'package:flutter/material.dart';
import 'package:massaging_ui_design/utils/assets_image.dart';
import 'package:massaging_ui_design/utils/helper_function.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsImages.liveCallImage,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 20,
            top: 40,

            child: Image.asset(
              AssetsImages.callViewer,
              // height: 140,
              // width: 110,
              fit: BoxFit.cover,
            ),
          ),
          
          Positioned(
            top: 20,
            left: 15,
            child: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
          ),
          Positioned(
            bottom: 50,
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
                  boxColor: Color(0xFF333E39),
                    borderColor: Colors.transparent

                ),
                circuleBox(
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      AssetsImages.musicIcon,
                      color: Colors.white,
                    ),
                  ),
                    boxColor: Color(0xFF333E39),
                    borderColor: Colors.transparent

                ),
                circuleBox(
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset(
                      AssetsImages.groupIcon,
                      color: Colors.white,
                    ),
                  ),
                    boxColor: Color(0xFF333E39),
                    borderColor: Colors.transparent

                ),
                circuleBox(
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.messenger_outline, color: Colors.white),
                  ),
                  boxColor: Colors.teal,
                    borderColor: Colors.transparent

                ),
                circuleBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                  boxColor: Colors.red,
                  borderColor: Colors.transparent
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
