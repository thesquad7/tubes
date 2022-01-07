import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hexa"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                color : Colors.blue,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    height: 50,
                    width: 50,
                    color : Colors.red,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color : Colors.brown,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color : Colors.yellow,
                  ),

                ],
                ),
              ),
              Container(
                height: 50,
                width: 50,
                color : Colors.black,
              ),
            ],
          ),
        )
      ),
    );
  }
}