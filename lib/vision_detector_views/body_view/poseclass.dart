abstract class Detector_default {
  late int posetimecounter; //復健動作持續秒數
  late int posetimeTarget; //復健動作持續秒數目標
  late int posecounter; //復健動作實作次數
  late int poseTarget; //目標次數設定
  late bool startdDetector; //偵測
  late bool endDetector; //跳轉
  late bool DetectorED;
  late bool timerbool;//倒數計時器
  late double? Standpoint_X;
  late double? Standpoint_Y;
  late double? Standpoint_bodymind_x;//身體終點
  late double? Standpoint_bodymind_y;//身體終點
  late String orderText;//目標提醒
  late String mathText;//倒數文字
  late bool right_side; //右邊開始
  late bool buttom_false;//按下按鈕消失
  late bool changeUI;
  late bool timerui;
  late String mindText;

  void startd(){}

  void startD() {}

  void poseDetector() {}

  void setStandpoint() {}

  void posetargetdone() {}

  double? distance(double x1,double y1,double x2,double y2){
    return null;
  }

  double? angle(double x1,double y1,double x2,double y2,double x3,double y3){
    return null;
  }

  void settimer(){}
}
