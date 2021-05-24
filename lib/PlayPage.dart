import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

int showb = 1;
int elapsedTime = 0;//経過時間

final limitTime = [10000,60000,-1];//ミリ秒で時間制限
final ini = ['10.00','60.00','NO LIMIT'];

List<int> highScore = List.generate(3, (index) => 0);

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  int score = 0;

  bool shouldMove = false;//テロップを止めたいときはfalseにしとくガスの元栓みたいな感じ

  String timeBoard = '00.00';
  // ストリームコントローラにしかアクセスを認めない

  final StreamController<String> _streamController = StreamController();
  //////////////////////////////////////
  int rest = 10000;//ホントはPLAYボタンで初期化すべき

  bool timeMove = false;
  int startTime = 0;
  //int _counter = 0;//これ
  Future<void> timerStart() async{
    if(!shouldMove){print('ストリームの元栓にロックがかかっています。shouldMove=trueにしてから呼んで下さい。');}
    if(timeMove){return;}//すでにタイマーが起動中
    timeMove = true;
    startTime = DateTime.now().millisecondsSinceEpoch;
    while(shouldMove && mode<2){
      if(shouldMove){
        await Future<void>.delayed(Duration(milliseconds: 16));
        _decrementCounter();
      }
    }
    elapsedTime = limitTime[mode];//これ絶対0になるはずなんですが...
    timeMove = false;
    shouldMove = false;
    //setState(() {});
    scoreBoard = 'Time\'s up';
    return;
  }
  
  String ms2string(int ms){
    String tmp = (ms.toString().padLeft(5,'0'));
    return tmp[0]+tmp[1]+'.'+tmp[2]+tmp[3];
  }
  
  void _decrementCounter() {//ここ放置少女で言えばテロップに流す処理時間
    //TODO:ここでエンドレスならガードすべき
    if(mode==2){return;}

    elapsedTime = DateTime.now().millisecondsSinceEpoch - startTime;//経過時間を記録
    if(elapsedTime>=limitTime[mode]){elapsedTime = limitTime[mode];}
    if(elapsedTime==limitTime[mode] && showb==1){//正常クリアしたときの処理
      if(showb==1){
        if(score>highScore[mode]){
          highScore[mode] = score;
          data[pName]![mode] = score;print(pName+'がハイスコアを出しました' + score.toString());
        }
        setState(() {showb = 0;});//print('グリッド消したい');
      }
    }else{timeBoard = ms2string(elapsedTime
    );}
    _streamController.add(timeBoard);
  }
  //////////////////////////////////////

  int nowPlaying = 0; //プレイ中なら1boolにすべきじゃない?

  String scoreBoard = '   Press any\nbutton to start';

  @override
  Widget build(BuildContext context) {
    ////
    //return Container(child: FooWidget(),);
    ////
    return Scaffold(body: SafeArea(child: Stack(children: [Container(child: back,constraints: BoxConstraints.expand(),),
        Container(padding: EdgeInsets.only(bottom: 50),child: Column(children: [
                  Expanded(
                      flex: 3, //これで一番上のQUIT調節
                      child: Row(
                        children: [
                          //Expanded(flex: 1,child: FooWidget(),),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: StreamBuilder<String>(
                                  stream: _streamController.stream,
                                  initialData: ini[mode],
                                  builder: (context, snapshot) {
                                    return Align(alignment: Alignment.center,child:Text(
                                      '${snapshot.data}',
                                      style: TextStyle(fontSize: 30, color: Colors.white),
                                    ),);
                                  }
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent, //ボタンそのものの色透過させたいのでこの設定
                                    shadowColor: Colors.transparent,
                                    onPrimary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1,
                                          color: Colors.red),
                                    ),
                                  ),
                                  child: const Text(
                                    'QUIT',
                                    style: TextStyle(fontSize: 25, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    //初期化しないといけないのはこの5つだけ?
                                    nowPlaying = 0;
                                    shouldMove = false;
                                    timeMove = false;
                                    startTime = 0;
                                    Navigator.of(context).pushNamed('/home');
                                  }, //QUITボタンを押してリセット
                                ),
                              )),
                        ],
                      )),
                  Expanded(
                      flex: 10,
                      child: Container(
                          color: Colors.transparent,
                          child: Align(
                            child: Text(
                              mode==2 ? score.toString():scoreBoard,
                              style: TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            alignment: Alignment.center,
                          ))),

                  Expanded(
                    flex: 30,
                    child: Container(
                      width: 340,
                      color: Colors.transparent,
                      child: IndexedStack(
                        index: showb,
                        children: [
                          Align(alignment: Alignment.topCenter,child: Text('Time\'s Up!',style: TextStyle(fontSize: 40, color: Colors.white),),),
                          GridView.count(
                            //これ全表示できてない
                              mainAxisSpacing: 10, //行間幅調節
                              crossAxisSpacing: 10, //列間幅調節
                              physics: const NeverScrollableScrollPhysics(), //スクロール防止
                              crossAxisCount: 4, //列の数指定するけどほぼ必須とみていい
                              children: List.generate(numOfCards, (index) {
                                return Container(
                                    child: ElevatedButton(
                                      child: Text(''),
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                          Colors.transparent, //ボタンそのものの色透過させたいのでこの設定
                                          shadowColor: Colors.transparent,
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                style: BorderStyle.solid,
                                                width: 1,
                                                color: Colors.red),
                                          ),
                                        ),
                                        onPressed: () {
                                          if(mode==2){highScore[2] = score;data[pName]![mode] = score;}
                                          if (nowPlaying==0) {//初タッチ
                                            nowPlaying = 1;
                                            shouldMove = true;
                                            if(mode<2)timerStart();
                                          }else{score++;}
                                            setState((){scoreBoard = score.toString();});
                                        },
                                    ));
                              })),
                        ],
                      ),
                    ),
                  ),
                ]),),
    ],),),);
  }
}
