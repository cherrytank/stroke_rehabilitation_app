import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'trainlowerbody1_model.dart';
export 'trainlowerbody1_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/main.dart';
import '../vision_detector_views/pose_transform.dart';
import '../vision_detector_views/pose_video.dart';

class Trainlowerbody1Widget extends StatefulWidget {
  const Trainlowerbody1Widget({Key? key}) : super(key: key);

  @override
  _Trainlowerbody1WidgetState createState() => _Trainlowerbody1WidgetState();
}

class _Trainlowerbody1WidgetState extends State<Trainlowerbody1Widget> {
  late Trainlowerbody1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  var  gettime= DateTime.now();  //獲取按下去的時間
  var  gettime1;  //轉換輸出型態月日年轉年月日
  inputtime()async{
    var url = Uri.parse(ip+"inputtimeDOWN.php");
    final responce = await http.post(url,body: {
      "account" : FFAppState().accountnumber,
      "degree":"初階",
      "parts":"下肢",
      "time": gettime1.toString(),
      "action": FFAppState().traindown,//動作
    });
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body); //將json解碼為陣列形式
      print(data["action"]);
      print(data["time"]);
      if("沒時間"==data["time"]){
        if("有訓練"==data["action"]||"有時間"==data["time"]){

        }
        else{
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>VideoApp()),
          );
        }
      }
      else if(data["times"]=="1次"&&"有時間"==data["time"]){
        if(data["timeaction"]=="對"){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>VideoApp()),
          );
        }
      }
      else if(data["times"]=="2次"){

      }
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Trainlowerbody1Model());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    gettime1=dateTimeFormat('yyyy-M-d', gettime);//轉換輸出型態月日年轉年月日
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
          Expanded(
              child:Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.97,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xFF90BDF9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/14.png',
                                  width: 100.0,
                                  height: 90.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  '初階訓練',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 50.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 12;
                                          else
                                            global.posenumber = 36;

                                          setState(() {
                                            FFAppState().traindown = '大腿伸彎';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/34.png',
                                          width: 120.0,
                                          height: 120.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '大腿伸彎',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 28.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 13;
                                          else
                                            global.posenumber = 37;
                                          setState(() {
                                            FFAppState().traindown = '躺姿抬腳';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/35.png',
                                          width: 120.0,
                                          height: 120.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '躺姿抬腳',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 28.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 14;
                                          else
                                            global.posenumber = 38;

                                          setState(() {
                                            FFAppState().traindown = '大腿外展';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/36.png',
                                          width: 120.0,
                                          height: 120.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '大腿外展',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 28.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 15;
                                          else
                                            global.posenumber = 39;
                                          setState(() {
                                            FFAppState().traindown = '膝蓋彎曲';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/37.png',
                                          width: 120.0,
                                          height: 120.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '膝蓋彎曲',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 28.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 16;
                                          else
                                            global.posenumber = 40;

                                          setState(() {
                                            FFAppState().traindown = '大腿內收';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/51.png',
                                          width: 120.0,
                                          height: 120.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '大腿內收',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 28.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if(FFAppState().affectedside == null)
                                            return;
                                          else if(FFAppState().affectedside == "右側")
                                            global.posenumber = 17;
                                          else
                                            global.posenumber = 41;

                                          setState(() {
                                            FFAppState().traindown = '小腿前踢';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/39.png',
                                          width: 120.0,
                                          height: 120.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '小腿前踢',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 28.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Image.asset(
                                  'assets/images/17.jpg',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '返回',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('documental');
                                },
                                child: Image.asset(
                                  'assets/images/18.jpg',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '使用紀錄',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('notice');
                                },
                                child: Image.asset(
                                  'assets/images/19.jpg',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '新通知',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('about');
                                },
                                child: Image.asset(
                                  'assets/images/20.jpg',
                                  width: 90.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '關於',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
