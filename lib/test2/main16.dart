import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Container容器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  // this.alignment,
  //  this.padding, //容器内补白，属于decoration的装饰范围
  //  Color color, // 背景色
  //  Decoration decoration, // 背景装饰
  //  Decoration foregroundDecoration, //前景装饰
  //  double width,//容器的宽度
  //  double height, //容器的高度
  //  BoxConstraints constraints, //容器大小的限制条件
  //  this.margin,//容器外补白，不属于decoration的装饰范围
  //  this.transform, //变换
  //  this.child,
  //容器的大小可以通过width、height属性来指定，也可以通过constraints来指定；
  // 如果它们同时存在时，width、height优先。实际上Container内部会根据width、
  // height来生成一个constraints。color和decoration是互斥的，如果同时设置它们
  // 则会报错！实际上，当指定color时，Container内会自动创建一个decoration。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container容器'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 120.0),
        ////容器外填充
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
        //卡片大小
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0,2.0),
              blurRadius: 4.0,
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2),//卡片倾斜变换
        alignment: Alignment.center,
          child: Text(
            '5.20',style: TextStyle(color: Colors.white,fontSize: 40.0),
          ),
      ),
    );
  }
}