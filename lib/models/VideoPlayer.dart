import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerCustom extends StatefulWidget {
  final _videoUrl;

  VideoPlayerCustom(this._videoUrl);

  @override
  _VideoPlayerCustomState createState() => _VideoPlayerCustomState();
}

class _VideoPlayerCustomState extends State<VideoPlayerCustom> {
  CachedVideoPlayerController _controller;
  Future<void> _video;
  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.network(widget._videoUrl);
    _video = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _video,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CachedVideoPlayer(_controller);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// return AspectRatio(
// aspectRatio: _controller.value.aspectRatio,
// child: VideoPlayer(_controller),
// );
