import 'package:flutter/material.dart';
import 'package:renda/global.dart';


Container highScoreBoard(){
  String high0 = getUserData(pName, 0);
  String high1 = getUserData(pName, 1);
  String high2 = getUserData(pName, 2);
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
                child: Text(high0,
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
                child: Text(high1,
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
                  high2,
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
