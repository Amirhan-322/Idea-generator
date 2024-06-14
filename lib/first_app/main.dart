import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _ColorChangeState createState() => _ColorChangeState();
}

class _ColorChangeState extends State<MyHomePage> {

  ThemeData currentTheme = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: randomColor()));
  var currentWord = WordPair.random();

  void changeColor() {
    currentTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: randomColor())
    );
  
  }

  void changeWord() {
    currentWord = WordPair.random();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amirhan",
      home: Scaffold (
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('A random idea:'),

              ElevatedButton(
                onPressed: () {
                  print("Button pressed");
                  changeWord();
                  changeColor();
                  setState((){});
                },
                child: Text(currentWord.asPascalCase),
              )
            ],
          )
        ),
        // backgroundColor: Colors.white,
      ),
      theme: currentTheme,
    );
  }
}



Color randomColor() {
  var random = Random();
  var color = Color(random.nextInt(0xFFFFFFFF));
  return color;
}