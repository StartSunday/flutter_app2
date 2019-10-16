import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "111111111111111",
      home: Scaffold(
        appBar: AppBar(
          title: Text('listview widget'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('111111'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('111111'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('111111'),
            ),
            Image.network("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg"),
            Image.network("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg"),
            Image.network("http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg"),
          ],
        ),
      ),
    );
  }

}
