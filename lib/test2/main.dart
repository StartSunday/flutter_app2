import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '按钮',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('按钮'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton.icon(
                color: Colors.blue,//按钮背景颜色
                textColor: Colors.white,//文字颜色
                disabledTextColor: Colors.grey ,  //按钮禁用时的文字颜色
                highlightColor: Colors.blue[700], //按钮按下时的背景颜色
                colorBrightness: Brightness.dark,//按钮主题，默认是浅色主题
                splashColor: Colors.tealAccent,// //点击时，水波动画中水波的颜色
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),//外形
                icon: Icon(Icons.send),
                onPressed: (){},
                label: Text('RaisedButton'),
                elevation: 2.0, //正常状态下的阴影
                highlightElevation: 8.0,//按下时的阴影
                disabledElevation: 0.0,// 禁用时的阴影
              ),
              FlatButton.icon(
                color: Colors.blue,//按钮背景颜色
                textColor: Colors.red,//文字颜色
                disabledTextColor: Colors.grey ,  //按钮禁用时的文字颜色
                highlightColor: Colors.blue[700], //按钮按下时的背景颜色
                colorBrightness: Brightness.dark,//按钮主题，默认是浅色主题 
                splashColor: Colors.tealAccent,// //点击时，水波动画中水波的颜色
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),//外形
                icon: Icon(Icons.add),
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                label: Text('FlatButton'),
                onPressed: (){},
              ),
              OutlineButton.icon(
                icon: Icon(Icons.info),
                label: Text('OutlineButton'),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: (){},
              ),

            ],
          ),
        ),
      ),
    ),
  );
}
