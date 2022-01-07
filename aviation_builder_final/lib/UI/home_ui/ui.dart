import 'package:aviation_builder_final/penganturan/fungsilog.dart';
import 'package:aviation_builder_final/penganturan/listviewhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/src/provider.dart';

class Home extends StatelessWidget{
  set penambah(Map<String, dynamic> penambah) {}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child:Icon(Icons.mail),
            label:"Mail",
          ),
          SpeedDialChild(
            child:Icon(Icons.copy),
            label:"Copy",
          ),
        ],
      ),
      body: ListView(
          children: rule().data.map((data) {
            List hobby = data["penambah"];
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.indigo.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children: [
                            Text("Tipe: ${data['Tipe']}"),
                            Text("Biaya: USD. ${data['Biaya']}"),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: hobby.map((color){
                              return Container(
                                color: Colors.grey,
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 8,
                                ),
                                padding: EdgeInsets.all(10), 
                                child: Text(color),
                              );
                            }).toList(),
                          ),
                        ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
    );
  }      
}
class News extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: ListView(
        children:[
          Card(
            child: Row(
              mainAxisAlignment : MainAxisAlignment.start,
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextButton(
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                     ),
                    onPressed: () {context.read<authtentikasi>().Keluar();},
                    child: Text('Keluar'),
                    ),

                )
              ]
            )
          )
        ],
      ),
    );
  }
}
class Popular extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
            children: <Widget> [
              Row(
                  children: <Widget>[
                    Icon(Icons.archive),
                    Text('Hit Terbaru', style: new TextStyle(fontWeight: FontWeight.bold))
                  ]
              ),
              Card(
                  child: Column(
                      children: <Widget>[
                        Text('Belajar Flutter')
                      ]
                  )
              )
            ]
        )
    );
  }
}
