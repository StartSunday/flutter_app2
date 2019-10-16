import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '线性布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage3(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('线性布局'),
      ),
      body: Column(
//        textDirection: TextDirection.ltr,//布局顺序(是从左往右还是从右往左)
//        mainAxisSize: MainAxisSize.max,//表示尽可能多的占用水平方向的空间
//        mainAxisAlignment: MainAxisAlignment.start,//表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度。只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义
//        verticalDirection: VerticalDirection.down,//表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
        crossAxisAlignment: CrossAxisAlignment.start,//表示子组件在纵轴方向的对齐方式
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(" hello world ",style: TextStyle(fontSize: 30.0),),
              Text(" I am Jack "),
            ],
          ),

        ],
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('hi'),
            Text('world')
          ],
        ),
      );
  }
}

class HomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}