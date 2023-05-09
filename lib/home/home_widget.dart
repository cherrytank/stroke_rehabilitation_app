import 'dart:convert';

import '../main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  var money1;

  Future money()async{
    var url = Uri.parse(ip+"money.php");
    final responce = await http.post(url,body: {
      "account" : FFAppState().accountnumber,
    });
    if (responce.statusCode == 200) {
      var data = json.decode(responce.body);
      setState(() {
        money1=data['coin']['coin'];
      });
      //print(data['coin']['coin']);
    }
  }

  void cycle(){
    var url = Uri.parse(ip+"delete.php");
    http.post(url,body: {
      "account":FFAppState().accountnumber,
    });

  }


  @override
  void initState() {
    future:money();
    super.initState();
    _model = createModel(context, () => HomeModel());

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Hello ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            FFAppState().nickname,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '繼續努力加油!!!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                            child: Image.asset(
                              'assets/images/25.jpg',
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                              '$money1'+'個',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD3C4),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('need');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/23.png',
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.14,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                            child: Text(
                              '需求表達',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 45,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      color: Color(0xFF688EEA),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('train');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/22.png',
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.14,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                            child: Text(
                              '復健訓練',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 45,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      color: Color(0xFFD4FFC4),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('LINE');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/24.png',
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.14,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                            child: Text(
                              '諮詢社群',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 45,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).grayIcon,
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('setting');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/21.png',
                            width: MediaQuery.of(context).size.width * 0.28,
                            height: MediaQuery.of(context).size.height * 0.14,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                            child: Text(
                              '設定',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                fontFamily: 'Poppins',
                                fontSize: 45,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/17.jpg',
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            fit: BoxFit.cover,
                          ),
                          AutoSizeText(
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
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          AutoSizeText(
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
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.1,
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
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.1,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
