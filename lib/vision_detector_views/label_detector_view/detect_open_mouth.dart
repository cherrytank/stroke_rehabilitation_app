import 'dart:async';
import 'dart:io' as io;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'camera_view.dart';
import 'painters/label_detector_painter.dart';

class open_mouth extends StatefulWidget {
  @override
  State<open_mouth> createState() => _ImageLabelViewState();
}

class _ImageLabelViewState extends State<open_mouth>{
  late ImageLabeler _imageLabeler;
  bool _canProcess = false;
  bool _isBusy = false;
  Detector_open_mouth smile = Detector_open_mouth();
  CustomPaint? _customPaint;
  String? _text;
  @override
  void initState() {
    super.initState();
    _initializeLabeler();
  }

  @override
  void dispose() {
    _canProcess = false;
    _imageLabeler.close();
    smile.TimerBool = false; //關閉timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        CameraView(
          title: 'Image Labeler',
          customPaint: _customPaint,
          text: _text,
          onImage: processImage,
        ),
        if (!smile.ChangeUI) ...[
          Positioned(
            //倒數計時
              top: 180,
              child: Container(
                height: 120,
                width: 100,
                child: AutoSizeText(
                  "${smile.TimerText}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    backgroundColor: Colors.transparent,
                    fontSize: 100,
                    color: Colors.amber,
                    inherit: false,
                  ),
                ),
              )),
          Positioned(
            //開始前提醒視窗
            bottom: 100.0,
            child: Container(
              width: 1000,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Color.fromARGB(132, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: AutoSizeText(
                smile.StartRemindText,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  backgroundColor: Colors.transparent,
                  fontSize: 25,
                  color: Colors.black,
                  height: 1.2,
                  inherit: false,
                ),
              ),
            ),
          ).animate().slide(duration: 500.ms),
          if (smile.buttom_false)
            Positioned(
              //復健按鈕
                bottom: 15.0,
                child: Container(
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Color.fromARGB(250, 255, 190, 52),
                    ),
                    child: AutoSizeText("Start!",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      smile.Started();
                    },
                  ),
                )).animate().slide(duration: 500.ms),
        ] else if (!smile.EndDetector) ...[
          Positioned(
            //計數器UI
            bottom: 10,
            right: -10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: new BoxDecoration(
                color: Color.fromARGB(250, 65, 64, 64),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(0),
                ),
              ),
              width: 100,
              height: 90,
              child: AutoSizeText(
                "次數\n${smile.FinishCounter}/${smile.FinishTarget}",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(250, 255, 190, 52),
                  height: 1.2,
                  inherit: false,
                ),
              ),
            ),
          ),
          if (smile.timerui)
            Positioned(
              //計時器UI
              bottom: 10,
              left: -10,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: new BoxDecoration(
                  color: Color.fromARGB(250, 65, 64, 64),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(0),
                    right: Radius.circular(20),
                  ),
                ),
                width: 100,
                height: 90,
                child: AutoSizeText(
                  "秒數\n${smile.FaceTimeCounter}/${smile.FaceTimeTarget}",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(250, 255, 190, 52),
                    height: 1.2,
                    inherit: false,
                  ),
                ),
              ),
            ),
          Positioned(
            //提醒視窗
            bottom: 100,
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: new BoxDecoration(
                color: Color.fromARGB(218, 255, 190, 52),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30),
                  right: Radius.circular(30),
                ),
              ),
              width: 220,
              height: 100,
              child: AutoSizeText(
                "${smile.TargetRemind}",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  height: 1.2,
                  inherit: false,
                ),
              ),
            ),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .scaleXY(end: 1.2, duration: 0.2.seconds),
        ],
        if (smile.EndDetector)
          Positioned( //退出視窗
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  decoration: new BoxDecoration(
                    color: Color.fromARGB(200, 65, 64, 64),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  width: 300,
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "恭喜完成!!",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          inherit: false,
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          padding: EdgeInsets.all(15),
                          backgroundColor: Color.fromARGB(250, 255, 190, 52),
                        ),
                        child: AutoSizeText(
                          "返回",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          //endout();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ).animate().slide(duration: 500.ms),
      ],
    );
  }






  void _initializeLabeler() async {
    // uncomment next line if you want to use the default model
    // _imageLabeler = ImageLabeler(options: ImageLabelerOptions());

    // uncomment next lines if you want to use a local model
    // make sure to add tflite model to assets/ml
    // final path = 'assets/ml/lite-model_aiy_vision_classifier_birds_V1_3.tflite';
    final path = 'assets/ml/face_six_detector.tflite';
    final modelPath = await _getModel(path);
    final options = LocalLabelerOptions(modelPath: modelPath);
    _imageLabeler = ImageLabeler(options: options);

    // uncomment next lines if you want to use a remote model
    // make sure to add model to firebase
    // final modelName = 'bird-classifier';
    // final response =
    //     await FirebaseImageLabelerModelManager().downloadModel(modelName);
    // print('Downloaded: $response');
    // final options =
    //     FirebaseLabelerOption(confidenceThreshold: 0.5, modelName: modelName);
    // _imageLabeler = ImageLabeler(options: options);

    _canProcess = true;
  }

  Future<void> processImage(InputImage inputImage) async { //顯示label與閥值
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final labels = await _imageLabeler.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = LabelDetectorPainter(labels);
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Labels found: ${labels.length}\n\n';
      for (final label in labels) {
        text += 'Label: ${label.label}, '
            'Confidence: ${label.confidence.toStringAsFixed(2)}\n\n';
      }
      _text = text;
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<String> _getModel(String assetPath) async { //取得模型
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}
class Detector_open_mouth {
  int  FaceTimeCounter = 0; //復健動作持續秒數
  int  FaceTimeTarget  = 3; //復健動作秒數目標
  int  FinishCounter   = 0; //復健動作實作次數
  int  FinishTarget    = 3; //復健動作實作次數目標
  bool StartedDetector = false;//偵測
  bool EndDetector     = false;//跳轉
  bool TimerBool       = true;//倒數計時器
  bool ChangeUI        = false;//改變UI介面
  bool DetectReset     = false;//復歸判定
  bool buttom_false    = true;//按下按鈕消失
  bool timerui         = true;
  bool DetectorED      = false;
  String TargetRemind  = '請張大嘴巴';//目標提醒
  String TimerText     = '';//倒數文字
  String StartRemindText = '請將臉部拍攝於畫面內\n並維持鏡頭穩定\n準備完成請按「Start」';
  String TargetText    = 'open_mouth'; //目標特徵
  //final player = AudioCache();//撥放音檔


  void FaceDetector() {
    //偵測判定
    if (this.StartedDetector) {
      DetectorED = true;
      this.TargetRemind = "請保持張嘴動作";
      if (this.FaceTimeCounter == this.FaceTimeTarget) {
        //秒數達成
        this.StartedDetector = false;
        this.FinishCounter++;
        this.FaceTimeCounter = 0;
        this.TargetRemind = "達標!";
        //this.sounder(this.posecounter);
      }
      if (DetectResult == TargetText&& this.StartedDetector) {
        //每秒目標
        this.FaceTimeCounter++;
        print(this.FaceTimeCounter);
        this.TargetRemind = "請保持住!";
      } else {
        //沒有保持
        this.FaceTimeCounter = 0;
      }
    } else if (DetectorED) {
      //預防空值被訪問
      if (DetectResult != TargetText) {
        //確認復歸
        this.StartedDetector = true;
      } else {
        this.TargetRemind = "請回復上一步";
      }
    }
  }

  void FaceTargetDone() {
    //完成任務後發出退出信號
    if (this.FinishCounter == this.FinishTarget) {
      this.EndDetector = true;
    }
  }


  void SetTimer() {
    Timer.periodic(         //觸發偵測timer
      const Duration(seconds: 1),
          (timer) {
        FaceDetector(); //偵測目標是否完成動作
        FaceTargetDone(); //偵測目標是否完成指定次數
        if(!this.TimerBool){
          print("cancel timer");
          timer.cancel();
        }
      },
    );
  }


  void StartDetect() {
    ChangeUI = true;
    StartedDetector = true;
    print('Start Detector is true');
    SetTimer();
  }


  void Started() {
    int Number = 5;
    buttom_false = false;
    Timer.periodic(
        const Duration(seconds: 1),
            (timer){
          TimerText = "${Number--}";
          if(Number<0){
            print("cancel timer");
            timer.cancel();
            TimerText = " ";
            StartDetect();
          }
        }
    );
  }

}
/*Future<void> endout() async {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  var url;
  String _degree;
  String _parts;
  String _coin_add;
  if(global.posenumber < 6 || (global.posenumber>23 && global.posenumber<30)){
    url = Uri.parse(ip+"train_upok.php");
    _degree = "初階";
    _parts = "上肢";
    _coin_add = "5";
    print("初階,上肢");
  }
  else if(global.posenumber < 12 || (global.posenumber>29 && global.posenumber<36)){
    url = Uri.parse(ip+"train_upok.php");
    _degree = "進階";
    _parts = "上肢";
    _coin_add = "5";
    print("進階,上肢");
  }
  else if(global.posenumber < 18 || (global.posenumber>35 && global.posenumber<42)){
    url = Uri.parse(ip+"train_downok.php");
    _degree = "初階";
    _parts = "下肢";
    _coin_add = "5";
    print("初階,下肢");
  }
  else{
    url = Uri.parse(ip+"train_downok.php");
    _degree = "進階";
    _parts = "下肢";
    _coin_add = "5";
    print("進階,下肢");
  }

  final responce = await http.post(url,body:{
    "time": formattedDate,
    "account": FFAppState().accountnumber.toString(),
    "action": FFAppState().trainup.toString(), //動作
    "degree": _degree,
    "parts": _parts,
    "times": "1", //動作
    "coin_add": _coin_add,
  });
  if (responce.statusCode == 200) {
    print("ok");
  } else {
    print(responce.statusCode);
    print("no");
  }
}*/