// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main(){
  runApp(MapObjek());
}

class Gambar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text("Image Widget"),
        ),
        body: Center(child: Container(
          width: 500,
          height: 500,
          color: Colors.amber,
          child: Image(
            fit: BoxFit.fitHeight,
            image: AssetImage("images/test.jpg"),
            
          )
        ))
      )
    );
  }
}

class pengeluar extends StatelessWidget{
  var faker = new Faker();
  @override
  Widget build(BuildContext context){ 
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Extract Widget")),
      body: ListView(
        children: [
          //Mode Hekel
          Luffy(imageUrl:"https://api.duniagames.co.id/api/content/upload/file/12192661971577444569.jpg",title:"Luffy" ,subtitle:faker.lorem.sentence()),
          //Mode Advance
          Divider(color: Colors.black,),
          ListTile(
            title: Text("Sanji"),
            subtitle: Text("Sanji adalah orang terbaik di bajak laut topi jerami, ia terkenal karena kemampuan mata mata yang ia miliki serta kemampuan memasak yang hebat"),
            leading: CircleAvatar(),
            trailing: Text("20:00 PM"),
          ),
          //isi Manual
          Divider(color: Colors.black,),
        ],
        ),
    ),
  );
  }
}

class pengeluarspeed extends StatelessWidget{
  var faker = new Faker();
  @override
  Widget build(BuildContext context){ 
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Extract Widget")),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index){
          return Zoro(imageUrl:"https://picsum.photos/id/$index/200/300",title:faker.person.name() ,subtitle:faker.lorem.sentence());
        },
      ),
    ),
  );
  }
}

class MapObjek extends StatelessWidget{

  set hobby(Map<String, dynamic> hobby) {}
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Mapping Objek"),),
        body: ListView(
          children: data().daftar.map((daftar) {
            List hobby = daftar["Hobby"];
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
                            Text("Nama: ${daftar['Nama']}"),
                            Text("Usia: ${daftar['Usia']}"),
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
      )
    );
  }
}

class data{
  final List<Map<String, dynamic>> daftar =[
    {
      "Nama"  : "Filemon",
      "Usia"  : 22,
      "Hobby" : ["Traveling", "Food Hunting", "Vibing", "Music", "Game", "Tame"],
    },
    {
      "Nama"  : "Dzikri",
      "Usia"  : 20,
      "Hobby" : ["Hiking", "SleepCalling", "Vibing", "Music", "Game"],
    },
    {
      "Nama"  : "Maulana",
      "Usia"  : 20,
      "Hobby" : ["Dating", "Food Hunting", "Vibing", "Music", "Game"],
    },
    {
      "Nama"  : "Rizky",
      "Usia"  : 20,
      "Hobby" : ["Traveling", "Food Hunting", "Sleeping", "Music", "Game"],
    }
  ];
}

class aturwaktu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Atur Waktu"),),
        body: Center(
          child: Text(DateFormat.EEEE().format(DateTime.now()), style: TextStyle(fontSize: 25,),),
          
        )
      )
    );
  }
}

class BarAplikasi extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            color: Colors.red,
          ),
          title: Text(""),
          actions:[],
        ),
      ),
    );
  }
}

class TestListView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.indigo.withOpacity(0.1),
              padding: EdgeInsets.all(7.0),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 75,
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("images/test.jpg"),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children:[
                        Container(
                          child: Text("I'm Strong"), 
                        ),
                        Container(
                          child: Text("Yet, in my dream"), 
                        ),
                      ]
                    )
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  Container(
                    child: Icon(Icons.add_circle_rounded),
                  ),
                ],
              ),
            )
          ]
        )
      )
    );
  }
}

class Zoro extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  Zoro({this.imageUrl, this.title,this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
      trailing: Text("20:00 PM"),
      
    );
  }
}

class Luffy extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  Luffy({this.imageUrl,this.title,this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
      trailing: Text("20:00 PM"),
      
    );
  }
}

class SusunDaftar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text("ListTile")
        ),
        body: ListView(
        children: [
          ListTile(
            title: Text("F22"),
            subtitle: Text("Pesawat dibuat pada 1992 oleh Boeing dan Lockhead Martin di Sector 32 Nevada, TX, USA dan menjadi pesawat tempur paling ganas di seri falcon LigthSpeed"),
            leading: CircleAvatar(),
            trailing: Text("20:00 PM"),
            dense: true,
          ),
          //Divider(color: Colors.black,),
          ListTile(
            title: Text("Falcon X15 America"),
            subtitle: Text("Model single Engine Dual Booster dengan kemampuan terbang 30000 Kaki, berbahan bakar Aftur dan Hidrogen Cair", maxLines: 2,),
            leading: CircleAvatar(),
            tileColor: Colors.cyan,
            trailing: Text("20:00 PM"),
          ),
          //Divider(color: Colors.black,),
          ListTile(
            title: Text("EuroTyphoon SR-443"),
            subtitle: Text("Pesawat dibuat oleh persatuan uni eropa pada tahun 1980"),
            leading: CircleAvatar(),
            trailing: Text("20:00 PM"),
            //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Pembawa()),
          ),
          //Divider(color: Colors.black,),
        ],
        ),
      ),
    );
  }
}

class Pembawa extends StatelessWidget{
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