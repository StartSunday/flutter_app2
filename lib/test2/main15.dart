import 'package:flutter/material.dart';
import 'dart:math' as math;
void main() {
  runApp(
    MaterialApp(
      title: '变换Transform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('变换Transform'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children :<Widget>[
                  Container(
                    color: Colors.black,
                    child: Transform(
                      alignment: Alignment.topRight, //相对于坐标第原点的对齐方式,
                      transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: const Text('Apartment for rent!'),
                      ),
                    ),
                  ),
                  Text('您好',style: TextStyle(color: Colors.green,fontSize: 18.0),)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //默认原点为左上角，左移20像素，向上平衡5像素
                    child: Transform.translate(offset: Offset(-20.0,-5.0),child: Text('Hello world'),),
                )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    angle: math.pi/2,//旋转90度
                    child: Text('Hello world'),),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                        scale: 3.0, //放大到1.5倍
                        child: Text('Hello world'),),
                    ),
                    //由于第一个Text应用变换(放大)后，其在绘制时会放大，
                    // 但其占用的空间依然为红色部分，所以第二个Text会紧挨着红色部分
                    // ，最终就会出现文字重合。
                    Text('您好',style: TextStyle(color: Colors.green,fontSize: 18.0),)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: RotatedBox(
                      quarterTurns: 1,//旋转90（1/4圈）
                      child: Text('Hello word'),
                    ),
                  ),
                  Text('您好',style: TextStyle(color: Colors.green,fontSize: 18.0),)
                ],
              )

            ],
          )
      ),
    );
  }
}