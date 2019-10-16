import 'package:flutter/material.dart';
class ExpansionTitleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1111111'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('11111111'),
          leading: Icon(Icons.add_call),
          backgroundColor: Colors.black,
          children: <Widget>[
            ListTile(
              title: Text('list title'),
              subtitle: Text('111111111111'),
            )
          ],
          initiallyExpanded: false,//默认打开闭合
        ),
      ),
    );
  }
}
