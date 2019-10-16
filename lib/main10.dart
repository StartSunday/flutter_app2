import 'package:flutter/material.dart';

void main() => runApp(MyApp(
    items: List<String>.generate(1000, (i) => "Item $i")
));
class MyApp extends StatelessWidget{
  final List<String> items;
  MyApp({Key key, @required this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '1111111111111',
      home: Scaffold(
        appBar: AppBar(
          title: Text('listview'),
        ),
        body:ListView.builder(itemCount: items.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text('${items[index]}'),
          );
        },) ,
      ),

    );
  }

}