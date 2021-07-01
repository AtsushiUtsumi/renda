import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:renda/HighScore.dart';
import 'package:renda/global.dart';
import 'PlayPage.dart';
import 'main.dart';
import 'global.dart';

void myInit() {
  //これ不要
  showb = 1;
  return;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Container cr() {
  return Container(
    color: Colors.transparent,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              //TODO:この左パディングのバランスを整える
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Container(
                  child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                    'FONT : フォント\nICON : アイコン\nBACKGROUND : 背景\nSPECIAL THANKS :\n生姜焼きのタレ\n(c)2021 sinProject\n',
                    style: TextStyle(fontSize: 13, color: Colors.yellow)),
              ))),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Container(
                child: Align(
              alignment: Alignment.topLeft,
              child: leaders(mode),
            )),
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                border: Border.all(color: Colors.red)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
          ),
        ),
      ],
    ),
  );
}
//以下ホームページのメイン
/////////////////////////////////////////////////////////////////////////

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false, //これ設定しないとキーボードが表示されるとき崩れる
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: back,
              constraints: BoxConstraints.expand(),
            ),
            Container(
                padding: EdgeInsets.only(top: 5,bottom: 15),
                constraints: BoxConstraints.expand(), //これでいっぱいいっぱいに広がる
                child: Column(children: [
                  Expanded(flex: 3, child: highScoreBoard()),
                  Expanded(
                      flex: 7,
                      child: Container(padding: EdgeInsets.fromLTRB(0,20,0,0),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: const Text(
                                'Renda',
                                style: TextStyle(
                                    height: 0.9,
                                    color: Colors.white,
                                    fontSize: 35),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: const Text(
                                'Machine',
                                style: TextStyle(
                                    height: 0.9,
                                    color: Colors.white,
                                    fontSize: 35),
                              ),
                            ),
                          ],
                        ),
                      )),
                  ///////////////////////////////////////////////////////////////////////////
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 13,top: 8),
                      child: GestureDetector(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              pName == '' ? 'プレーヤー名未入力' : pName,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          _showMyDialog(context);
                        },
                      ),
                      width: 250,
                      color: Colors.white,
                    ),
                  ),
                  // TODO:以下のボタンの配置のパディングを左右の縦線を揃える
                  //////////////////////////////////////////////////////////////
                  Expanded(
                      flex: 10,
                      child: Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: pName == ''
                            ? Container()
                            : Container(
                                constraints: BoxConstraints.expand(),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(constraints: BoxConstraints.expand(),
                                          margin: EdgeInsets.all(0),padding: EdgeInsets.only(left: 10,right: 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Container(constraints: BoxConstraints.expand(),
                                                    padding:const EdgeInsets.fromLTRB(5, 0, 5, 10),margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.red
                                                        .withOpacity(
                                                            mode == 0 ? 0.2 : 0),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      side: BorderSide(
                                                          style:
                                                              BorderStyle.solid,
                                                          width: 1,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      mode = 0;
                                                    });
                                                  },
                                                  child: Container(
                                                      child: Text(
                                                    '10s',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  )),
                                                ),
                                              )),
                                              Expanded(
                                                  child: Container(constraints: BoxConstraints.expand(),
                                                    padding:const EdgeInsets.fromLTRB(5, 0, 5, 10),margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.red
                                                        .withOpacity(mode == 1
                                                            ? 0.2
                                                            : 0), //ボタンそのものの色透過させたいのでこの設定
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      side: BorderSide(
                                                          style:
                                                              BorderStyle.solid,
                                                          width: 1,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      mode = 1;
                                                    });
                                                  },
                                                  child: Text(
                                                    '60s',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              )),
                                              Expanded(
                                                  child: Container(constraints: BoxConstraints.expand(),
                                                    padding:const EdgeInsets.fromLTRB(5, 0, 5, 10),margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.red
                                                        .withOpacity(
                                                            mode == 2 ? 0.2 : 0),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      side: BorderSide(
                                                          style:
                                                              BorderStyle.solid,
                                                          width: 1,
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      mode = 2;
                                                    });
                                                  },
                                                  child: Text(
                                                    'ENDLESS',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Container(//color: Colors.white,
                                        constraints: BoxConstraints.expand(),
                                        margin: EdgeInsets.all(0),padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            playInit(mode);
                                            myInit();
                                            Navigator.of(context)
                                                .pushNamed('/play');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red.withOpacity(
                                                0.2), //ボタンそのものの色透過させたいのでこの設定
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 1,
                                                  color: Colors.red),
                                            ),
                                          ),
                                          child: Container(
                                              constraints: BoxConstraints.expand(),
                                            padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              child: const Align(
                                                  child: const Text(
                                            'PLAY!',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      )),
                  //////////////////////////////////////////////////////////////
                  Expanded(
                    flex: 20,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: cr(),
                      color: Colors.transparent,
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}

class NameInput extends StatefulWidget {
  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  @override
  Widget build(BuildContext context) {
    return sctest(context);
  }
}

Container sctest(BuildContext context) {
  String _tmp = pName;
  return Container(
    child: Row(
      children: [
        Expanded(
            flex: 6,
            child: TextField(
                controller: TextEditingController(text: pName),
                onChanged: (value) {
                  _tmp = value;
                })),
        Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                pName = _tmp;
                Navigator.pushNamed(context, '/home');
              },
              child: Text('OK'),
            ))
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context) async {
  /////////////////////////////
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: sctest(context),
      );
    },
  );
}
