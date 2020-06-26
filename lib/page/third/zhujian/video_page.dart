import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';
import 'package:video_player/video_player.dart';

//视频
class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://www.runoob.com/try/demo_source/mov_bbb.mp4');
    // 在初始化完成后必须更新界面
//    ..initialize().then((_) {
//    setState(() {});
//    });

    _chewieController= ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 343/193,
//      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: true,
      looping: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavigationBar(
        title: '视频',
      ),
      body: Center(
        child: Chewie(
          controller:_chewieController,
        ),
      ),
    );
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

}
