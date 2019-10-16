import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '原始指针事件处理',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage4(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  //定义一个状态 ，保存当前指针位置
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('原始指针事件处理'),
      ),
      //position：它是鼠标相对于当对于全局坐标的偏移。
      //delta：两次指针移动事件（PointerMoveEvent）的距离。
      //pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
      //orientation：指针移动方向，是一个角度值。
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300.0,
          height: 150.0,
          child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white),),
        ),
        onPointerMove: (PointerMoveEvent event) => setState(()=>_event = event),
        onPointerDown: (PointerDownEvent event) => setState(()=> _event =event),
        onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  HomePage2State createState() => new HomePage2State();
}

class HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Listener(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(330.0,150.0)),
          child: Center(child: Text('Box A'),),
        ),
        onPointerDown: (event) => print('down A'),
      ),
    );
  }
}

class HomePage3 extends StatefulWidget {
  @override
  HomePage3State createState() => new HomePage3State();
}

class HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0,200.0)),
              child: DecoratedBox(
               decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            onPointerDown: (event) => print('down0'),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0,100.0)),
              child: Center(child: Text('左上角200*100范围内非文本区域点击'),),
            ),
            onPointerDown: (event) => print('down1'),
          )
        ],
      ),
    );
  }
}

class HomePage4 extends StatefulWidget {
  @override
  HomePage4State createState() => new HomePage4State();
}

class HomePage4State extends State<HomePage4> {
  //假如我们不想让某个子树响应PointerEvent的话，我们可以使用IgnorePointer和AbsorbPointer，
  // 这两个组件都能阻止子树接收指针事件，不同之处在于AbsorbPointer本身会参与命中测试，
  // 而IgnorePointer本身不会参与,这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)
  // ，而IgnorePointer不可以。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Listener(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200.0,
              height: 100.0,
            ),
            onPointerDown: (event) =>print('in'),
          ),
        ),
        onPointerDown: (event) => print('up'),
      ),
    );
  }
}

