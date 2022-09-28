import 'package:flutter/material.dart';
import 'FrontScreen/MainScreen.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: "Attendence",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Attendence"),
        ),
        body: MainScreen(),
      )
    );
  }
}
