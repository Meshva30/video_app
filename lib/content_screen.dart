// import 'dart:async';
//
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_app/provider/Progress_Provider.dart';
// import 'package:video_app/provider/mute_provider.dart';
// import 'package:video_player/video_player.dart';
//
// import 'likeIcon.dart';
// import 'options_screen.dart';
//
// class ContentScreen extends StatefulWidget {
//   final String video;
//
//   final String username;
//   final int comment;
//   final int like;
//   final String share;
//
//   const ContentScreen({
//     super.key,
//     required this.video,
//     required this.username,
//     required this.comment,
//     required this.like,
//     required this.share,
//   });
//
//   @override
//   State<ContentScreen> createState() => _ContentScreenState();
// }
//
// class _ContentScreenState extends State<ContentScreen> {
//   late VideoPlayerController videoPlayerController;
//   ChewieController? chewieController;
//   Timer? progressTimer;
//   bool _liked = false;
//   bool _isMuted = false;
//   bool _isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }
//
//   Future initializePlayer() async {
//     videoPlayerController = VideoPlayerController.asset(widget.video);
//     await Future.wait([videoPlayerController.initialize()]);
//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: true,
//       showControls: false,
//       looping: true,
//     );
//     videoPlayerController.addListener(_updateProgress);
//     progressTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
//       if (videoPlayerController.value.isPlaying) {
//         double progress = videoPlayerController.value.position.inMilliseconds /
//             videoPlayerController.value.duration!.inMilliseconds;
//         Provider.of<ProgressProvider>(context, listen: false)
//             .updateProgress(progress);
//       }
//     });
//     setState(() {});
//   }
//
//   void toggleMute() {
//     setState(() {
//       _isMuted = !_isMuted;
//       videoPlayerController.setVolume(_isMuted ? 0 : 1);
//     });
//   }
//
//   void togglePlayPause() {
//     setState(() {
//       _isPlaying = !_isPlaying;
//       if (_isPlaying) {
//         videoPlayerController.play();
//       } else {
//         videoPlayerController.pause();
//       }
//     });
//   }
//
//   void _updateProgress() {
//     if (videoPlayerController.value.isPlaying) {
//       double progress = videoPlayerController.value.position.inMilliseconds /
//           videoPlayerController.value.duration!.inMilliseconds;
//       Provider.of<ProgressProvider>(context, listen: false)
//           .updateProgress(progress);
//     }
//   }
//
//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         chewieController != null &&
//                 chewieController!.videoPlayerController.value.isInitialized
//             ? GestureDetector(
//                 onDoubleTap: () {
//                   setState(() {
//                     _liked = !_liked;
//                   });
//                 },
//                 child: Chewie(
//                   controller: chewieController!,
//                 ),
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(child: CircularProgressIndicator()),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//         if (_liked)
//           Center(
//             child: LikeIcon(),
//             Positioned(
//               top: 16,
//               right: 16,
//               child: GestureDetector(
//                 onTap: () {
//                   Provider.of<MuteProvider>(context, listen: false)
//                       .toggleMute();
//                 },
//                 child: AnimatedSwitcher(
//                   duration: Duration(milliseconds: 200),
//                   switchInCurve: Curves.easeIn,
//                   switchOutCurve: Curves.easeOut,
//                   child: Consumer<MuteProvider>(
//                     builder: (context, muteProvider, _) => Icon(
//                       muteProvider.isMuted
//                           ? AnimatedIcons.volume_mute
//                           : AnimatedIcons.volume_up,
//                       key: ValueKey<bool>(muteProvider.isMuted),
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ],
//
//           ),
//
//
//     OptionsScreen(
//           username: widget.username,
//           like: widget.like,
//           comment: widget.comment,
//           share: widget.share,
//           video: widget.video,
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/provider/Progress_Provider.dart';
import 'package:video_app/provider/mute_provider.dart';
import 'package:video_player/video_player.dart';

import 'likeIcon.dart';
import 'options_screen.dart';

class ContentScreen extends StatefulWidget {
  final String video;
  final String username;
  final int comment;
  final int like;
  final String share;

  const ContentScreen({
    Key? key,
    required this.video,
    required this.username,
    required this.comment,
    required this.like,
    required this.share,
  }) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  Timer? progressTimer;
  bool _liked = false;
  bool _isMuted = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.asset(widget.video);
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    videoPlayerController.addListener(_updateProgress);
    progressTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (videoPlayerController.value.isPlaying) {
        double progress = videoPlayerController.value.position.inMilliseconds /
            videoPlayerController.value.duration!.inMilliseconds;
        Provider.of<ProgressProvider>(context, listen: false)
            .updateProgress(progress);
      }
    });
    setState(() {});
  }

  void toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      videoPlayerController.setVolume(_isMuted ? 0 : 1);
    });
  }

  void togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        videoPlayerController.play();
      } else {
        videoPlayerController.pause();
      }
    });
  }

  void _updateProgress() {
    if (videoPlayerController.value.isPlaying) {
      double progress = videoPlayerController.value.position.inMilliseconds /
          videoPlayerController.value.duration!.inMilliseconds;
      Provider.of<ProgressProvider>(context, listen: false)
          .updateProgress(progress);
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        chewieController != null &&
            chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
          onDoubleTap: () {
            setState(() {
              _liked = !_liked;
            });
          },
          child: Chewie(
            controller: chewieController!,
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: Consumer<MuteProvider>(
            builder: (context, muteProvider, child) {
              return muteProvider.isIconVisible
                  ? IconButton(
                icon: Icon(
                  muteProvider.isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  muteProvider.toggleMute();
                  muteProvider.hideIcon(); // Optionally hide the icon after tapping
                },
              )
                  : SizedBox.shrink();
            },
          ),
        ),
        OptionsScreen(
          username: widget.username,
          like: widget.like,
          comment: widget.comment,
          share: widget.share,
          video: widget.video,
        ),
      ],
    );
  }
}
