import 'package:flutter/material.dart';
import 'package:renda/global.dart';


Container highScoreBoard(){
  return Container(
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
                  getUserData(pName, 0),
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
                  getUserData(pName, 1),
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
                  getUserData(pName, 2),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/*
class HighScore extends StatefulWidget {

  @override
  _HighScoreState createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    getUserData(pName, 0),
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
                    getUserData(pName, 1),
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
                    getUserData(pName, 2),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/