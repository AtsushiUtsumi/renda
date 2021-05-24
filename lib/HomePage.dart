import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'PlayPage.dart';
import 'main.dart';

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
              padding: EdgeInsets.all(20),
              child: Container(
                  child: Align(
                alignment: Alignment.bottomLeft,
                child: const Text(
                    'SOUND EFFECT:\n未定\nFONT:\nフォント\nICON:\nアイコン\nBACKGROUND:\n背景\nSPECIAL THANKS:\n生姜焼きのタレ\n:(c)2021 sinProject\n',
                    style: TextStyle(fontSize: 12, color: Colors.yellow)),
              ))
              ),
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
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,//これ設定しないとキーボードが表示されるとき崩れる
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: back,
              constraints: BoxConstraints.expand(),
            ),
            Container(
                padding: EdgeInsets.only(bottom: 50),
                constraints: BoxConstraints.expand(), //これでいっぱいいっぱいに広がる
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '10s',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      highScore[0] >= 0
                                          ? highScore[0].toString()
                                          : '---',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '60s',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      highScore[1] >= 0
                                          ? highScore[1].toString()
                                          : '---',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'ENDLESS',
                                      style: TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      highScore[2] >= 0
                                          ? highScore[2].toString()
                                          : '---',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //child: testB()
                      )),
                  Expanded(
                      flex: 3,
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
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: GestureDetector(
                        child: Container(
                          child: Align(//ここに
                            child: Text(pName),
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
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                                      .withOpacity(mode == 0 ? 0.2 : 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        style: BorderStyle.solid,
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
                                      color: Colors.white, fontSize: 15),
                                )),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red.withOpacity(mode == 1
                                      ? 0.2
                                      : 0), //ボタンそのものの色透過させたいのでこの設定
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        style: BorderStyle.solid,
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
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                                      .withOpacity(mode == 2 ? 0.2 : 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        style: BorderStyle.solid,
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
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            )),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          myInit();
                          Navigator.of(context).pushNamed('/play');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red
                              .withOpacity(0.2), //ボタンそのものの色透過させたいのでこの設定
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                style: BorderStyle.solid,
                                width: 1,
                                color: Colors.red),
                          ),
                        ),
                        child: Container(
                            child: const Align(
                                child: const Text(
                          'PLAY!',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
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
    print('NameInputステートは' + context.hashCode.toString());
    return sctest(context);
  }
}


Container sctest(BuildContext context){
  print('コンテナは'+context.hashCode.toString());
  String _tmp = '';

  ///////////////////////////
  _showMyDialog(context);
  print(_tmp);
  ///////////////////////////


  return Container(
    color: Colors.yellow,
    child: Row(
      children: [
        //Expanded(flex: 3,child: Scaffold(body: TextField(onChanged: (value){_tmp = value;},),)),
        Expanded(flex: 1,child: ElevatedButton(onPressed: (){pName = _tmp;pName  ='せと';print('カレントユーザーを' + pName+'に変更');Navigator.pushNamed(context, '/home');},child: Text('OK'),))
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context) async {
  /////////////////////////////
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(backgroundColor: Colors.red,content: TextField());
    },
  );
}