import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AnimatedSwitcherCounterRoute(),
  ));
}

class AnimatedSwitcherCounterRoute  extends StatefulWidget {
  @override
  _AnimatedSwitcherCounterRouteState createState() => new _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute > {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation){
//                return ScaleTransition(child: child, scale: animation,);
              var tween = Tween<Offset>(begin: Offset(1,0),end: Offset(0,0));
//              return MySlideTransition(
//                child: child,
//                position: tween.animate(animation),
//              );
              return SlideTransitionX(
                child:  child,
                direction: AxisDirection.up,//上入下出
                position: animation,
              );
              },
              child: Text(
                '$_count',
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text('+1'),
              onPressed: () => setState(() =>_count += 1),
            )
          ],
        ),
      ),
    );
  }
}

class MySlideTransition extends AnimatedWidget{


  MySlideTransition({Key key,
  @required Animation<Offset> position,
  this.transformHitTests = true ,
  this. child,}):
  assert(position != null), super(key: key,listenable: position);
  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现 ‘从左边'
    if(position.status == AnimationStatus.reverse){
      offset = Offset(-offset.dx,offset.dy);
    }

    // TODO: implement build
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }

}

class SlideTransitionX extends AnimatedWidget{
  SlideTransitionX({
    Key key ,@required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  }): assert(position != null) ,super(key :key,listenable:position){
    //偏移在内部处理
    switch(direction){
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0,1),end: Offset(0,0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1,0),end: Offset(0,0));
        break;
        case AxisDirection.down:
      _tween = Tween(begin: Offset(0,-1),end: Offset(0,0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1,0),end: Offset(0,0));
        break;
    }

  }
  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  //退场（出）方向
  final AxisDirection direction;
  Tween<Offset> _tween;


  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    // TODO: implement build
    if(position.status == AnimationStatus.reverse){
      switch(direction){
        case AxisDirection.up:
          offset = Offset(offset.dx,-offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx,offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx,-offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx,offset.dy);
          break;
      }
    }


    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }

}