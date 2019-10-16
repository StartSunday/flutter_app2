import 'package:flutter/material.dart';
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('new route'),
      ),
      body: Center(
          child: Text('this is new route$args') ,
      ),
    );
  }
}