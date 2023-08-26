import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';

import 'HomePage.dart';

class GaamePage extends StatefulWidget {
  int cnt;

  GaamePage(this.cnt);

  @override
  State<GaamePage> createState() => _GaamePageState();
}

class _GaamePageState extends State<GaamePage> {
  String sign = "";
  String result = "";
  List list = List.filled(9, "");
  int m = 0;
  int turn = 0;
  bool iszero = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff3b7197), Color(0xffa1e1fa)])),
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: Row(children: [button(0), button(1), button(2)]),
            ),
            Expanded(
              flex: 25,
              child: Row(children: [button(3), button(4), button(5)]),
            ),
            Expanded(
              flex: 25,
              child: Row(children: [button(6), button(7), button(8)]),
            ),
            Expanded(
                flex: 15,
                child: Container(
                  child: Center(
                    child: Text("$result",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.yellowAccent)),
                  ),
                )),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                      icon: Icon(
                        Icons.home,
                        size: 30,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          list = List.filled(9, "");
                          m = 0;
                          turn = 0;
                          result = "";
                        });
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  button(int i) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            setState(() {
              if (widget.cnt == 1) {
                if (m == 0) {
                  if (list[i] == "") {
                    list[i] = "0";
                    turn++;
                    if (turn <= 4) {
                      while (true) {
                        int r = Random().nextInt(9);
                        if (list[r] == "") {
                          list[r] = "X";
                          break;
                        }
                      }
                    }
                  }
                }
              } else {
                if (m == 0) {
                  if (list[i] == "") {
                    if (iszero == false) {
                      list[i] = "0";
                      iszero = true;
                    } else {
                      list[i] = "X";
                      iszero = false;
                    }
                  }
                }
              }

              clicked();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text("${list[i]}",
                    style: TextStyle(
                        color: Color(0xffa1e1fa),
                        fontSize: 100,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }

  void display(int i) {
    if (list[i] == "0") {
      result = widget.cnt == 1 ? "YOU WIN" : "Player1 WIN";
      m = 1;
    } else {
      result = widget.cnt == 1 ? "COMPUTER WIN" : "Player2 WIN";
      m = 1;
    }
  }

  void clicked() {
    if (list[0] == list[1] && list[0] == list[2] && list[0] != "") {
      display(0);
    } else if (list[0] == list[3] && list[0] == list[6] && list[0] != "") {
      display(0);
    } else if (list[0] == list[4] && list[0] == list[8] && list[0] != "") {
      display(0);
    } else if (list[1] == list[4] && list[1] == list[7] && list[1] != "") {
      display(1);
    } else if (list[1] == list[0] && list[1] == list[2] && list[1] != "") {
      display(1);
    } else if (list[2] == list[5] && list[2] == list[8] && list[2] != "") {
      display(2);
    } else if (list[2] == list[1] && list[2] == list[0] && list[2] != "") {
      display(2);
    } else if (list[2] == list[6] && list[2] == list[4] && list[2] != "") {
      display(2);
    } else if (list[3] == list[4] && list[3] == list[5] && list[3] != "") {
      display(3);
    } else if (list[3] == list[0] && list[3] == list[6] && list[3] != "") {
      display(3);
    } else if (list[4] == list[0] && list[4] == list[8] && list[4] != "") {
      display(4);
    } else if (list[4] == list[3] && list[4] == list[5] && list[4] != "") {
      display(4);
    } else if (list[4] == list[1] && list[4] == list[7] && list[4] != "") {
      display(4);
    } else if (list[4] == list[2] && list[4] == list[6] && list[4] != "") {
      display(4);
    } else if (list[5] == list[2] && list[5] == list[8] && list[5] != "") {
      display(5);
    } else if (list[5] == list[4] && list[5] == list[3] && list[5] != "") {
      display(5);
    } else if (list[6] == list[7] && list[6] == list[8] && list[6] != "") {
      display(6);
    } else if (list[6] == list[0] && list[6] == list[3] && list[6] != "") {
      display(6);
    } else if (list[6] == list[2] && list[6] == list[4] && list[6] != "") {
      display(6);
    } else if (list[7] == list[1] && list[7] == list[4] && list[7] != "") {
      display(7);
    } else if (list[7] == list[6] && list[7] == list[8] && list[7] != "") {
      display(7);
    } else if (list[8] == list[7] && list[8] == list[6] && list[8] != "") {
      display(8);
    } else if (list[8] == list[0] && list[8] == list[4] && list[8] != "") {
      display(8);
    } else if (list[8] == list[2] && list[8] == list[5] && list[8] != "") {
      display(8);
    } else if (!list.contains("")) {
      result = "DRAW !! Restart";
      m = 1;
    }
  }
}
