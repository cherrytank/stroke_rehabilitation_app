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
    if(global.posenumber>=24)
      _posenumber = global.posenumber - 24;
    else
      _posenumber = global.posenumber;

    if(_posenumber == 0 || _posenumber == 24){
      _controller = VideoPlayerController.network(
        'https://raw.githubusercontent.com/cherrytank/stroke_rehabilitation_app/main/assets/pose_videos/0.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 1 || _posenumber == 25){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/1.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 2 || _posenumber == 26){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/2.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 3 || _posenumber == 27){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/3.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 4 || _posenumber == 28){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/4.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 5 || _posenumber == 29){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/5.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 6 || _posenumber == 30){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/6.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 7 || _posenumber == 31){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/7.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 8 || _posenumber == 32){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/8.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 9 || _posenumber == 33){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/9.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 10 || _posenumber == 34){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/10.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 11 || _posenumber == 35){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/11.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 12 || _posenumber == 36){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/12.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 13 || _posenumber == 37){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/13.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 14 || _posenumber == 38){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/14.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 15 || _posenumber == 39){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/15.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 16 || _posenumber == 40){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/16.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 17 || _posenumber == 41){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/17.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 18 || _posenumber == 42){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/18.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 19 || _posenumber == 43){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/19.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 20 || _posenumber == 44){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/20.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 21 || _posenumber == 45){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/21.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 22 || _posenumber == 46){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/22.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if (_posenumber == 23 || _posenumber == 47){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/pose_videos/23.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    /*_controller = VideoPlayerController.asset(
        'assets/pose_videos/${_posenumber}.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          color: Color.fromARGB(255, 144, 189, 249),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _controller.value.isInitialized
                  ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller))
                  : Container(),
              Padding(
                padding: EdgeInsets.all(10),
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
                    },
                    child: Icon(Icons.arrow_forward, size: 50,),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                width: 300,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  color: Color.fromARGB(132, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(
                  "左邊按鈕暫停與重播影片\n右邊按鈕開始復健!",
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
          ),
        ),
    );

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}