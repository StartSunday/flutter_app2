import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//class Faderoute extends PageRoute{
//
//  Faderoute({@required this.builder,
//  this.transtitionDuration = const Duration(microseconds: 300),
//  this.opaque = true,
//    this.barrierDismissible = false,
//    this.barrierColor,
//    this.barrierLablel,
//    this.maintainState = true
//  });
//
//  final WidgetBuilder builder;
//  @override
//  final Duration transtitionDuration;
//  @override
//  final bool opaque;
//  @override
//  final bool barrierDismissible;
//
//  @override
//  final String barrierLablel;
//
//  @override
//  final Color barrierColor;
//
//  @override
//  final bool maintainState;
//  @override
//  // TODO: implement barrierLabel
//  String get barrierLabel => null;
//
//  @override
//  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//    // TODO: implement buildPage
//    return builder(context);
//  }
//
//  @override
//  // TODO: implement transitionDuration
//  Duration get transitionDuration => null;
//
//  @override
//  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
//    // TODO: implement buildTransitions
//    return FadeTransition(opacity: animation,child: builder(context),);
//  }
//}



void main() {
  runApp(
    MaterialApp(
      title: '',
      theme: ThemeData(
       primaryColor: Colors.blue
      ),
      home: HeroAnimationRoute (),
    ),
  );
}

class HeroAnimationRoute  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: 'avatar',//唯一标记，前后 两个路由面hero的tag必须相同
            child: ClipOval(
                child: Image.asset('images/img_not_available.jpeg',width: 50.0,),
            ),
          ),
          onTap: (){
            //打开B路由
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context,Animation animation,Animation
                  secondaryAnimation){
                  return FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text('原图'),
                      ),
                      body:  HeroAnimationRouteB(),
                    ),
                  );
              }
            ));
          },
        ),
    );
  }
}

class HeroAnimationRouteB  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(
        tag: 'avatar',//唯一标记，前后两个路由页hero的tag必须传
        child: Image.asset('images/img_not_available.jpeg'),
      ),
    );
  }
}