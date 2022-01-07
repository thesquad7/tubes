import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  @override
  MyApptate createState() => MyApptate();
  int _apptitle= 0;
  final appchange=[
    ,,,
  ];
}
class MyApptate extends State<MyApp>{
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: appchange[_apptitle],
        ),
      )
      );
  }
}


