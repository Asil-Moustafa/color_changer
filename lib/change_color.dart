import 'package:flutter/material.dart';
import 'dart:math';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});
  @override
  State<ChangeColor> createState() {
    return _ChangeColorState();
  }
}

class _ChangeColorState extends State<ChangeColor> {
  final Random _rand = Random();
  Color color = Color.fromARGB(255, 185, 84, 228);
  int r = 185;
  int g = 84;
  int b = 228;
  int index = 0;
  //final Random _random = Random();
  static const List<String> direction = [
    'Horizontal',
    'Vertical',
    'Left-Right',
    'Right-Left',
  ];
  Alignment begin() {
    switch (index) {
      case 0:
        return Alignment.topCenter;
      case 1:
        return Alignment.centerLeft;
      case 2:
        return Alignment.topRight;
      case 3:
        return Alignment.topLeft;
      default:
        return Alignment.topCenter;
    }
  }

  Alignment end() {
    switch (index) {
      case 0:
        return Alignment.bottomCenter;
      case 1:
        return Alignment.centerRight;
      case 2:
        return Alignment.bottomLeft;
      case 3:
        return Alignment.bottomRight;
      default:
        return Alignment.bottomCenter;
    }
  }

  void changec() {
    setState(() {
      r = _rand.nextInt(256);
      g = _rand.nextInt(256);
      b = _rand.nextInt(256);
      color = Color.fromARGB(255, r, g, b);
    });
  }

  void changed() {
    setState(() {
      index = (index + 1) % 4; //index = _random.nextInt(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, Color.fromARGB(199, 247, 245, 248), color],
              begin: begin(),
              end: end(),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: changec,
                  /*style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),*/
                  child: Text('Change Color'),
                ),
                SizedBox(height: 20),
                Text(
                  'Red: $r Green: $g Blue: $b',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                OutlinedButton(
                  onPressed: changed,
                  /* style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                  ),*/
                  child: Text('Change Direction'),
                ),
                SizedBox(height: 20),
                Text(
                  'Direction: ${direction[index]}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
