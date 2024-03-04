import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/video_player_contr.dart';
import 'providers/main_provider.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen(
    this.controller,
  );
  final VideoPlayerController controller;
  bool get isResult => controller.dataSource.startsWith('http');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: white.withOpacity(.9),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          // height: double.infinity,
          children: [
            Expanded(
                child: Stack(
              children: [
                VideoPlayerContr(controller),
                if (!isResult)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                            Material(color: Colors.white, child: BackButton())),
                  ),
              ],
            )),
            if (isResult)
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .15,
                child: Center(
                  child: CustomElevatedButton(
                    text: 'Ok, go back',
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
          ],
          // child: Stack(
          //   children: [
          //     VideoPlayerContr(controller),
          //     Padding(
          //       padding: EdgeInsets.all(8),
          //       child: ClipRRect(
          //           borderRadius: BorderRadius.circular(50),
          //           child: Material(
          //         color: Colors.white,
          //         child: BackButton())),
          //     ),
          //     Positioned(
          //       bottom: MediaQuery.sizeOf(context).height * .15,
          //       child: Container(
          //               padding: const EdgeInsets.all(8),
          //               width: MediaQuery.sizeOf(context).width,
          //               // color: white,
          //               alignment: Alignment.center,
          //               child: Text(controller.dataSource,
          //                   style: const TextStyle(fontSize: 18)),
          //             )
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
