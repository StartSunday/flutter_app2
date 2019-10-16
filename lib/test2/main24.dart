import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '导航返回拦截（WillPopScope）',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScopeTestRoute(),
    ),
  );
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() => new WillPopScopeTestRouteState();
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;//上次点击的时间
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航返回拦截（WillPopScope）'),),
      body:   WillPopScope(
        onWillPop: ()async{
          if(_lastPressedAt == null || DateTime.now().difference(_lastPressedAt)>Duration(seconds: 1)){
            //两次点击 间隔超过1秒刚重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text('1秒内连续按两次返回键退出'),
        ),
      ),
    );


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}