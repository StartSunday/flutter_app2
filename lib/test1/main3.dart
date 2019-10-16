import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('1111'),
        ),
        body: Center(
          child: Text('Hello word' * 2, //字符串重复次数
            textAlign: TextAlign.center, //对齐方式
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.5,//缩放因子
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              //height：该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height。
              height: 1.2,
              //由于不同平台默认支持的字体集不同，所以在手动指定字体时一定要先在不同平台测试一下。
              fontFamily: 'courier',
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed
            ),
          ),
        ),
      )
    ),
  );
}
