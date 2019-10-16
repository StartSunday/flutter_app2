import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var card = Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('1111111111',style: TextStyle(fontWeight: FontWeight.w400),),
            subtitle: Text('12456789'),
            leading: Icon(Icons.account_box,color: Colors.blue,),
          ),
          Divider(),
          ListTile(
            title: Text('1111111111',style: TextStyle(fontWeight: FontWeight.w400),),
            subtitle: Text('12456789'),
            leading: Icon(Icons.account_box,color: Colors.blue,),
          ),
          Divider(),
          ListTile(
            title: Text('1111111111',style: TextStyle(fontWeight: FontWeight.w400),),
            subtitle: Text('12456789'),
            leading: Icon(Icons.account_box,color: Colors.blue,),
          ),
          Divider(),
          ListTile(
            title: Text('1111111111',style: TextStyle(fontWeight: FontWeight.w400),),
            subtitle: Text('12456789'),
            leading: Icon(Icons.account_box,color: Colors.blue,),
          ),
          Divider(),
          ListTile(
            title: Text('1111111111',style: TextStyle(fontWeight: FontWeight.w400),),
            subtitle: Text('12456789'),
            leading: Icon(Icons.account_box,color: Colors.blue,),
          ),
        ],
      ),
    );

    // TODO: implement build
    return MaterialApp(
      title: 'Row widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1111111'),
        ),
        body:Center(
          child: card,
        )
      ),

    );
  }


}