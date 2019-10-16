import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '手势识别',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: GestureConflictTestRoute(),
  ));
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = 'No Gesture detected';//保存事件名
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('手势识别'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation,style: TextStyle(color: Colors.white),),
          ),
          onTap: () => updateText('Tap'),//点击
          onDoubleTap: () => updateText('doubleTap'),
          onLongPress: () => updateText('longpress'),
        ),
      ),
    );
  }

  updateText(String s) => setState(() =>_operation = s);
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> {
  double _top = 0.0;//距顶部的偏移
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A'),),
              //手指按下时触发此回调
              onPanDown: (DragDownDetails e){
                //打印手指按下的位置（相对于屏幕）
                print('用户手指按下:${e.globalPosition}');
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e){
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left+= e.delta.dx;
                  _top = e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e){
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _top += details.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0 ;//通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),

      body: Center(
        child: GestureDetector(
          child: Image.asset('./images/img_not_available.jpeg',width: _width,),
          onScaleUpdate: (ScaleUpdateDetails details){
            setState(() {
              //缩放倍数在0.8到10倍这间
              _width =200*details.scale.clamp(.8,10.0);
            });
          },
        ),
      ),
    );
  }
}

class _GestureRecognizerTestRout extends StatefulWidget {
  @override
  _GestureRecognizerTestRoutState createState() => new _GestureRecognizerTestRoutState();
}

class _GestureRecognizerTestRoutState extends State<_GestureRecognizerTestRout> {
  TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;//变色开关
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
     body: Text.rich(TextSpan(children: [
       TextSpan(text: '你好世界'),
       TextSpan(text: '点我变色',style: TextStyle(
         fontSize: 30.0,
         color: _toggle? Colors.blue: Colors.red
       ),
         recognizer: _gestureRecognizer
           ..onTap =(){
             setState(() {
               _toggle = !_toggle;
             });
        },
       ),
       TextSpan(text: '你好世界'),
     ])),

    );
  }

}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() => new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A'),),
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _top += details.delta.dy;
                  print(_top);
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _left+= details.delta.dx;
                  print(_left);
                });
              },
            ),
          )

        ],
      ),
    );
  }
}

class GestureConflictTestRoute extends StatefulWidget {
  @override
  GestureConflictTestRouteState createState() => new GestureConflictTestRouteState();
}

class GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;
  double _left2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A'),),//要拖动和点击 的widget,
              onHorizontalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details){
                print('onHorizontalDragEnd');
              },
              onTapDown: (details){
                print('down');
              },
              onTapUp: (details){
                print('up');
              },
            ),
          ),
          Positioned(
            top: 80.0,
            left: _left2,
            child: Listener(
              onPointerDown: (details){
                print('down');
              },
              onPointerUp: (details){
                //会触发
                print('up');
              },
              child: GestureDetector(
                child: CircleAvatar(child: Text('B'),),
                onHorizontalDragUpdate: (DragUpdateDetails details){
                  setState(() {
                    _left2 += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details){
                  print('onHorizontalDragEnd');
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}