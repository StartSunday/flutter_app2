import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(
    title: '1111',
    home: FirstPage(),
  ));
}

class FirstPage  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('1111'),),
      body: RouteButton(),
    );
  }
}

class RouteButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: (){_navigeteTo(context);},
      child: Text('222222'),
    );
  }

  _navigeteTo(BuildContext context) async{
    final result = await Navigator.push(context, MaterialPageRoute(
      builder: (context) => XXX()
    ));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result'),));
  }
}

class XXX  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('555555'),),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('111111'),
              onPressed: (){
                Navigator.pop(context,'1111111111');
              },
            ),
            RaisedButton(
              child: Text('22222'),
              onPressed: (){
                Navigator.pop(context,'1111111111');
              },
            )
          ],
        ),
      ),
    );
  }
}