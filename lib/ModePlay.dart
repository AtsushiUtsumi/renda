import 'package:flutter/material.dart';
import 'main.dart';

class ModePlay extends StatefulWidget {
  @override
  _ModePlayState createState() => _ModePlayState();
}

class _ModePlayState extends State<ModePlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
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
                    //myInit();
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
          ],
        ),
    );
  }
}
