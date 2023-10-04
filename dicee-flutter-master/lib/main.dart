import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    int leftDiceNumber = 5;
    int rightDiceNumber = 5;

    void changeDiceFace() {
      setState(() {
        leftDiceNumber = Random().nextInt(6) + 1;
        rightDiceNumber = Random().nextInt(6) + 1;
      });
    }

    return Center(
      child: Row(children: [
        Expanded(
          child: TextButton(
              onPressed: () {
                changeDiceFace();
                //use setState really important
              },
              child: Image.asset('images/dice1.png')),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              changeDiceFace();
            },
            //use setState really important
            child: Image.asset('images/dice$rightDiceNumber.png'),
          ),
          //agr wo va leftdicenumber ke baad rkhte toh wo hot reload mei v change nhi hta
          //coz hot reload mei hamesha build method hi call hota hai
        ),
        //expanded widget helps to take the max space availabe for it and helps not to get out of screen
        //flex:1 saise flex use krke koisa bada chota krr skte ho
      ]),
    );
  }
}
