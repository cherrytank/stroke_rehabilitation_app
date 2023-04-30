import 'package:flutter/material.dart';
import 'package:stroke_rehabilitation_app/vision_detector_views/pose_transform.dart';
import 'package:video_player/video_player.dart';
import 'pose_view.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    int _posenumber;
    if(global.posenumber>24)
      _posenumber = global.posenumber - 24;
    else
      _posenumber = global.posenumber;

    _controller = VideoPlayerController.asset(
        'assets/pose_videos/${_posenumber}.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _controller.value.isInitialized
            ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller))
            : Container(),
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    fixedSize: MaterialStateProperty.all(Size(80, 80)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)))),
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
                child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 50,),
            ),
            Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                    fixedSize: MaterialStateProperty.all<Size>(Size(80, 80)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)))),
                onPressed: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>pose_view()),
                  );
                  dispose();
                },
                child: Icon(Icons.arrow_forward, size: 50,),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Container(
          width: 1000,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: Color.fromARGB(132, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Text(
            "左邊按鈕可以暫停與重播影片\n\n看完後可以按右邊按鈕開始復健!",
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.transparent,
              fontSize: 25,
              color: Colors.black,
              height: 1.2,
              inherit: false,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}