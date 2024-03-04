import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerContr extends StatefulWidget {
  const VideoPlayerContr(this.controller, );
  final VideoPlayerController controller;
  @override
  State<VideoPlayerContr> createState() => VideoPlayerContrState();
}

class VideoPlayerContrState extends State<VideoPlayerContr> {
  @override
  Widget build(BuildContext context) {
    return widget.controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio ,
            child: Stack(
              children: [
                InkWell(
                    onTap: () {
                      if (widget.controller.value.isPlaying) {
                        widget.controller.pause();
                      } else {
                        widget.controller.play();
                      }
                      setState(() {});
                    },
                    child: VideoPlayer(widget.controller)),
                // Center(
                //   child: StatefulBuilder(builder: (context, setState) {
                //     return IconButton(
                //       onPressed: () {
                //         if (widget.controller.value.isPlaying) {
                //           widget.controller.pause();
                //         } else {
                //           widget.controller.play();
                //         }
                //         setState(() {});
                //       },
                //       icon: Icon(
                //         widget.controller.value.isPlaying
                //             ? Icons.pause
                //             : Icons.play_arrow,
                //       ),
                //     );
                //   }),
                // ),
              ],
            ),
          )
        : const Icon(Icons.video_file);
  }
}
