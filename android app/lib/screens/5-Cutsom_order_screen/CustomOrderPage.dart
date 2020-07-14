import 'package:aashas/helpers/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOrderPage extends StatefulWidget {
  final Function onMenuPressed;
  CustomOrderPage({this.onMenuPressed});
  @override
  _CustomOrderPageState createState() => _CustomOrderPageState();
}

class _CustomOrderPageState extends State<CustomOrderPage> {
//  VideoPlayerController _controller;
//  Future<void> _initializeVideoPlayerFuture;
//
//  @override
//  void initState() {
//    super.initState();
//    print('init called');
//    _controller = VideoPlayerController.asset('assets/videos/1.mp4');
//    _initializeVideoPlayerFuture = _controller.initialize();
//  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    _controller.dispose();
//    print('dispose called');
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: widget.onMenuPressed,
          color: Color(KCSTitleColor),
        ),
        backgroundColor: Color(KWSBGColor),
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Center(
        child: Text('Custom Order'),
      ),
//      body: FutureBuilder(
//        future: _initializeVideoPlayerFuture,
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.done) {
//            // If the VideoPlayerController has finished initialization, use
//            // the data it provides to limit the aspect ratio of the video.
//            return VideoPlayer(_controller);
//          } else {
//            // If the VideoPlayerController is still initializing, show a
//            // loading spinner.
//            return Center(child: CircularProgressIndicator());
//          }
//        },
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          // Wrap the play or pause in a call to `setState`. This ensures the
//          // correct icon is shown.
//          setState(() {
//            // If the video is playing, pause it.
//            if (_controller.value.isPlaying) {
//              _controller.pause();
//            } else {
//              // If the video is paused, play it.
//              _controller.play();
//            }
//          });
//        },
//        // Display the correct icon depending on the state of the player.
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
