import 'package:aviation_builder/penganturan/listviewhome.dart';
import 'package:flutter/material.dart';

class UserInterface extends StatefulWidget{
  @override
  _Ux createState() => _Ux();
}
class _Ux extends State<UserInterface> with SingleTickerProviderStateMixin{
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
final GlobalKey<ScaffoldState> _penyusun = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      key: _penyusun,
      appBar: AppBar(
        title: Center(child: Text("Aviation Builder"),),
        //tombol + dan - di Appbar
        /* actions:[
          FlatButton(onPressed: (){_penyusun.currentState.showSnackBar(SnackBar(content:Text("You Pressed Plus Icon"),duration: Duration(seconds: 1)));}, child: Icon(Icons.add,color:
          Colors.white,)),
          FlatButton(onPressed: (){_penyusun.currentState.showSnackBar(SnackBar(content:Text("You Pressed Minus Icon"),duration: Duration(seconds: 1)));}, child: Icon(Icons.remove,color:
          Colors.white,)),
        ],*/
        //array function untuk tab di AppBar
        bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.note),),
              Tab(icon: Icon(Icons.poll),),
            ]
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Home(),
          Popular(),
          News(),
        ]
      ),
      ),
    );
  }

}
class Home extends StatelessWidget{
  set penambah(Map<String, dynamic> penambah) {}
  @override
  Widget build(BuildContext context){
    return ListView(
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
        );
  }      
}
class reachpage extends StatelessWidget{
  final String value;
  const reachpage({ Key? key, required this.value}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("Waktu Pengerjaan adalah =" + "$value", style: TextStyle(fontSize:20),),
      )
    );
  }
}
//kode awal class "Home"
/*child: Column(
        children: <Widget> [
          Row(
            children: <Widget>[
              Icon(Icons.build_circle_sharp),
              Text('Fitur Tersedia', style: new TextStyle(fontWeight: FontWeight.bold))
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
      )*/
class News extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
            children: <Widget> [
              Row(
                  children: <Widget>[
                    Icon(Icons.archive),
                    Text('File Terbaru', style: new TextStyle(fontWeight: FontWeight.bold))
                  ]
              ),
              Card(
                  child: Column(
                      children: <Widget>[
                        Text('Bagian Fitur Utama')
                      ]
                  )
              )
            ]
        )
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