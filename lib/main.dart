import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'PlayPage.dart';
import 'dart:collection';
import 'global.dart';

final back = Image.asset('images/bg.jpg',fit: BoxFit.cover);

Text leaders(int mode){
  int num = 0;
  String tmp = 'LEADERS BOARD\n';
  final sortedMap = SplayTreeMap.from(data, (a, b) => data[b]![mode].compareTo(data[a]![mode]));
  List<String> top10 = [];
  sortedMap.forEach((key, value) {
    if(value[mode]>0){num++;top10.add(key.toString()+':'+value[mode].toString());}}
    );
  if(num>10){num=10;}//多すぎる場合はトップ10
  for(int i=0;i<num;i++){
    tmp += '\n';
    tmp += (i+1).toString()+' ';
    tmp += top10[i];
  }
  return Text(tmp,style: TextStyle(fontSize: 15,color: Colors.yellow));
}

int mode = 0; //基本は数字のモード
int score = 0;
int numOfCards = 16;
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'NewFont'), home: Splash());
        } else {
          return MaterialApp(
            theme: ThemeData(fontFamily: 'NewFont'),
            routes: {
              '/play': (BuildContext context) => PlayPage(),//いったんこっちを最初に表示してみる
              '/home': (BuildContext context) => HomePage(), //初期画面をこっちにしたい
            },

            home: HomePage(),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {//スプラッシュ的な画像
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.arrow_left,
          //Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}