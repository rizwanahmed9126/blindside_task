import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {






  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;



  initialize()async{
    _videoPlayerController1=VideoPlayerController.network(
            'https://firebasestorage.googleapis.com/v0/b/blinds-b26bb.appspot.com/o/videos%2FVID-20220619-WA0008.mp4?alt=media&token=0faebe18-3a8e-45a9-81af-2e5e22b40877');
    //await _videoPlayerController1.initialize();

  }
  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }



  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: ChewieController(
        videoPlayerController: _videoPlayerController1,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
      ),
    );
  }
}
