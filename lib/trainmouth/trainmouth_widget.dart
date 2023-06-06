import 'dart:convert';
import '../main.dart';
import '../vision_detector_views/label_detector_view/face_class.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'trainmouth_model.dart';
export 'trainmouth_model.dart';

int Face_Detect_Number = 0;
class TrainmouthWidget extends StatefulWidget {
  const TrainmouthWidget({Key? key}) : super(key: key);

  @override
  _TrainmouthWidgetState createState() => _TrainmouthWidgetState();
}

class _TrainmouthWidgetState extends State<TrainmouthWidget> {
  late TrainmouthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  var  gettime=DateTime.now();  //獲取按下去的時間
  var  gettime1;  //轉換輸出型態月日年轉年月日
  inputtime()async{
    var url = Uri.parse(ip+"inputtimeMOUTH.php");
    final responce = await http.post(url,body: {
      "account" : FFAppState().accountnumber,
      "degree":"進階",
      "parts":"口腔",
      "time": gettime1.toString(),
      "action": FFAppState().mouth,//動作
    });
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body); //將json解碼為陣列形式
      print(data["action"]);
      print(data["time"]);
      print(gettime1=dateTimeFormat('yyyy-M-d', gettime));//轉換輸出型態月日年轉年月日
      if("沒時間"==data["time"]){
        if("有訓練"==data["action"]||"有時間"==data["time"]){

        }
        else{
          //context.pushNamed('test');
          switch(Face_Detect_Number){
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>smile()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>tougue()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>pout()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>open_mouth()));
              break;
            case 5:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>flick_tougue()));
              break;
            case 6:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>pursed_lips()));
              break;
          }
        }
      }
      else if(data["times"]=="1次"&&"有時間"==data["time"]){
        if(data["timeaction"]=="對"){
          context.pushNamed('test');
        }
      }
      else if(data["times"]=="2次"){

      }
    }
  }


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainmouthModel());
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.97,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Image.asset(
                                  'assets/images/15.png',
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height * 0.12,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
                                child: Text(
                                  '吞嚥訓練',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 50,
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
                                          setState(() {
                                            Face_Detect_Number = 6;//抿唇動作
                                            FFAppState().mouth = '鼓頰動作';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/43.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        '鼓頰動作',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
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
                                          setState(() {
                                            Face_Detect_Number = 1; //微笑動作
                                            FFAppState().mouth = '臉頰微笑';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/44.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '臉頰微笑',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
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
                                          setState(() {
                                            Face_Detect_Number = 2;
                                            FFAppState().mouth = '吐舌頭式';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/45.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '吐舌頭式',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
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
                                          setState(() {
                                            Face_Detect_Number = 5;
                                            FFAppState().mouth = '彈舌式';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/46.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '彈舌式',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
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
                                          setState(() {
                                            FFAppState().mouth = '下巴運動';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/53.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '下巴運動',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
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
                                          setState(() {
                                            FFAppState().mouth = '頭頸側彎';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/54.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '頭頸側彎',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
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
                                          setState(() {
                                            Face_Detect_Number = 3;
                                            FFAppState().mouth = '嘟嘴式';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/55.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '嘟嘴式',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
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
                                          setState(() {
                                            Face_Detect_Number = 4;
                                            FFAppState().mouth = '張嘴說阿';
                                          });
                                          inputtime();
                                        },
                                        child: Image.asset(
                                          'assets/images/56.png',
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.15,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        '張嘴說阿',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 28,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '返回',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '使用紀錄',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '新通知',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
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
                                  width:
                                  MediaQuery.of(context).size.width * 0.2,
                                  height:
                                  MediaQuery.of(context).size.height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                '關於',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
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
