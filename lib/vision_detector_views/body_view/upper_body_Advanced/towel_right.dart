import 'dart:async';
import 'dart:math';
import '../assembly.dart';
import 'package:audioplayers/audioplayers.dart';//播放音檔

class Detector_towel_right implements Detector_default{
  int posetimecounter = 0; //復健動作持續秒數
  int posetimeTarget = 5; //復健動作持續秒數目標
  int posecounter = 0; //復健動作實作次數
  int poseTarget = 30; //目標次數設定
  bool startdDetector = false; //偵測
  bool endDetector = false; //跳轉
  bool DetectorED = false;
  bool timerbool=true;//倒數計時器
  double? Standpoint_X = 0;
  double? Standpoint_Y = 0;
  double? Standpoint_bodymind_x = 0;//身體終點
  double? Standpoint_bodymind_y = 0;//身體終點
  String orderText = "";//目標提醒
  String mathText = "";//倒數文字
  bool right_side= true; //右邊開始
  bool buttom_false = true;//按下按鈕消失
  bool changeUI = false;
  bool timerui = false;
  String mindText = "請將全身拍攝於畫面內\n並維持鏡頭穩定\n準備完成請按「Start」";
  final player = AudioCache();//播放音檔

  void startd(){//倒數計時
      this.buttom_false = false;
      int counter = 5;
      Timer.periodic(//觸發偵測timer
        const Duration(seconds: 1),
            (timer) {
          mathText = "${counter--}";
          if(counter<0){
            print("cancel timer");
            timer.cancel();
            mathText = " ";
            startD();
          }
        },
      );
  }

  void startD() {
    //開始辨識
    this.changeUI = true;
    this.startdDetector = true;
    print("startdDetector be true");
    setStandpoint();
    settimer();
  }

  void poseDetector() {
    //偵測判定
    print(posedata[32]!);
    if (this.startdDetector) {
      DetectorED = true;
      if(distance(posedata[30]!, posedata[30]!, (posedata[22]!+posedata[24]!)/2, (posedata[22]!+posedata[24]!)/2)<400
        &&distance(posedata[32]!, posedata[32]!, (posedata[22]!+posedata[24]!)/2, (posedata[22]!+posedata[24]!)/2)<400)
        return ;
      if(this.right_side){
        this.orderText = "請往右擦拭";
        if(distance(posedata[30]!, posedata[30]!, (posedata[22]!+posedata[24]!)/2, (posedata[22]!+posedata[24]!)/2)<400 //身體中線距離
        ){
          this.startdDetector = false;
          this.orderText = "達標";
          this.posecounter++;
          this.right_side = false;
          this.sounder(this.posecounter);
          posesounder(false);
        }
      }else{
        this.orderText = "請往左擦拭";
        if(distance(posedata[32]!, posedata[32]!, (posedata[22]!+posedata[24]!)/2, (posedata[22]!+posedata[24]!)/2)<400 //身體中線距離
        ){
          this.startdDetector = false;
          this.orderText = "達標";
          this.posecounter++;
          this.right_side = true;
          this.sounder(this.posecounter);
          posesounder(true);
        }
      }
    }else if (DetectorED) {
      //預防空值被訪問
      if(!this.right_side){
        this.orderText = "請往左擦拭";
        if (posedata[32]!<500) {
          //確認復歸
          this.startdDetector = true;
        }
      }else{
        this.orderText = "請往右擦拭";
        if (posedata[32]!>100) {
          //確認復歸
          this.startdDetector = true;
        }
      }
    }
  }

  void setStandpoint() {
    //設定基準點(左上角為(0,0)向右下)
    this.Standpoint_X = posedata[22]! - 20;
    this.Standpoint_Y = posedata[23]! - 20;
    this.Standpoint_bodymind_x = (posedata[22]!+posedata[24]!)/2;
    this.Standpoint_bodymind_y = (posedata[23]!+posedata[25]!)/2;
  }

  void posetargetdone() {
    //完成任務後發出退出信號
    if (this.posecounter == this.poseTarget) {
      this.endDetector = true;
    }
  }

  double distance(double x1,double y1,double x2,double y2){
    return sqrt(pow((x1-x2).abs(),2)+pow((y1-y2).abs(),2));
  }

  double angle(double x1,double y1,double x2,double y2,double x3,double y3){
    double vx1= x1-x2;
    double vy1= y1-y2;
    double vx2= x3-x2;
    double vy2= y3-y2;
    double porduct = vx1*vx2+vy1*vy2;
    double result = acos(porduct/(distance(x1, y1, x2, y2)*distance(x3, y3, x2, y2)))*57.3;
    print(result);
    return result;
  }

  void settimer(){
      Timer.periodic(//觸發偵測timer
        const Duration(seconds: 1),
            (timer) {
          poseDetector(); //偵測目標是否完成動作
          posetargetdone(); //偵測目標是否完成指定次數
          if(!this.timerbool){
            print("cancel timer");
            timer.cancel();
          }
        },
      );
  }
  void sounder(int counter){
    player.play('pose_audios/${counter}.mp3');
  }

  Future<void> posesounder(bool BOO) async {
    await Future.delayed(Duration(seconds: 1));
    if(BOO){
      player.play('pose_audios/upper/towel_right.mp3');
    }else{
      player.play('pose_audios/upper/towel_left.mp3');
    }
  }
}
