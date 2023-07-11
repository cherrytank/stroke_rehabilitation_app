import 'package:flutter/material.dart';
import 'package:stroke_rehabilitation_app/trainmouth/trainmouth_widget.dart';
import 'package:video_player/video_player.dart';
import 'face_class.dart';

class FaceVideoApp extends StatefulWidget {
  const FaceVideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<FaceVideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    int _facenumber;
    _facenumber = Face_Detect_Number;
    if(_facenumber == 1 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/1.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 2 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/2.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 3 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/3.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 4 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/4.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 5 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/5.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 6 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/6.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 7 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/7.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    else if(_facenumber == 8 ){
      _controller = VideoPlayerController.network(
        'https://github.com/cherrytank/stroke_rehabilitation_app/raw/main/assets/face_videos/8.mp4',
      )
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
          _controller.play();
        });
      ;
    }
    /*_controller = VideoPlayerController.asset('assets/face_videos/${_facenumber}.mp4')
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
                    switch(Face_Detect_Number){
                      case 1:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>smile()));
                        break;
                      case 2:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>tougue()));
                        break;
                      case 3:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>pout()));
                        break;
                      case 4:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>open_mouth()));
                        break;
                      case 5:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>flick_tougue()));
                        break;
                      case 6:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>pursed_lips()));
                        break;
                      case 7:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>headneck_bend()));
                        break;
                      case 8:
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>chin_movement()));
                        break;
                    }
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