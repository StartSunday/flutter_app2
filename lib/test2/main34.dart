import 'package:flutter/material.dart';
import 'dart:math' as math;

class Shakecurve extends Curve{
  @override
  double transform(double t) {
    // TODO: implement transform
    return math.sin(t* math.pi *2);
  }
}


void main() {
  runApp(MaterialApp(
    title: ' 动画基本结构及状态监听',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ScaleAnimationRoute1(),
  ));
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() =>  _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin{
 Animation<double> animation;
 AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  AppBar(
        title:  Text(' 动画基本结构及状态监听'),
      ),
      body: Center(
        child: Image.asset('images/img_not_available.jpeg',
        width: animation.value,
        height: animation.value,),
      ),
    );
  }
 @override
 void initState() {
   // TODO: implement initState
   super.initState();

   controller = AnimationController(
     duration: const Duration(seconds: 3),vsync: this);
   //使用弹性曲线
   animation = CurvedAnimation(parent: controller,curve: Curves.bounceIn);
   //图片宽高从0变到300
   animation = Tween(begin: 0.0,end:300.0).animate(controller)
   ..addListener((){
     setState(() {});
   });
   //启动动画
   controller.forward();
 }
 @override
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();

  }

}

class AnimatedImage extends AnimatedWidget{
  AnimatedImage({Key key,Animation<double> animation}): super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    // TODO: implement build
    return Center(
      child:  Image.asset('images/img_not_available.jpeg',width: animation.value,height: animation.value,),
    );
  }
}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  ScaleAnimationRoute1State createState() => new ScaleAnimationRoute1State();
}

class ScaleAnimationRoute1State extends State<ScaleAnimationRoute1> with SingleTickerProviderStateMixin {
 Animation<double> animation;
 AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画基本结构及状态监听'),
      ),
      body:
//        GrowTransition(
//          child: Image.asset('images/img_not_available.jpeg'),
//          animation: animation,
//        ),
//        child: AnimatedImage(animation: animation,),
         AnimatedBuilder(
          animation: animation,
          child: Image.asset('images/img_not_available.jpeg'),
          builder: (context,widget){
            return Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                child: widget,
              ),
            );
          },
        ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),vsync: this
    );
    //图片宽高从0到300
    animation = Tween(begin: 0.0,end: 300.0).animate(controller);

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        //动画执行结束时反向执行动画
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        //动画恢复到初始状态时执行动画
        controller.forward();
      }
    });

    //启动动画
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child,this.animation});
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context,widget){
          return Container(
            height: animation.value,
            width: animation.value,
            child: widget,
          );
        },
        child: child,
      ),
    );
  }
}