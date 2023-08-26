import 'package:flutter/material.dart';

import 'GamePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff3b7197), Color(0xffa1e1fa)])),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 200,
              width: 200,
              child: Center(
                  child: Image(
                image: AssetImage("images/tic-tac-toe.png"),
                fit: BoxFit.fill,
              ))),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            onPressed: () {
              setState(() {
                cnt = 1;
              });

              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return GaamePage(cnt);
                },
              ));
            },
            child: Text("1 Player", style: TextStyle(color: Color(0xffa1e1fa))),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            onPressed: () {
              setState(() {
                cnt = 2;
              });

              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return GaamePage(cnt);
                },
              ));
            },
            child: Text("2 Player", style: TextStyle(color: Color(0xffa1e1fa))),
          ),
        ]),
      ),
    );
  }
}
