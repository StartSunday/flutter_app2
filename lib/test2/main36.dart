import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StaggerRoute(),
    ),
  );
}

class _StaggerAnimation  extends StatelessWidget {
  _StaggerAnimation({Key key, this.controller}): super(key: key){
    //高度动画
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0,0.6,//间隔，前60%的动画时间
        curve: Curves.ease,
      ),
      ),
    );
    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0,0.6,curve: Curves.ease //间隔，前60%的动画时间
      )
    ));

    padding = Tween<EdgeInsets>(
      begin:EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(CurvedAnimation(parent: controller,curve: Interval(
      0.6,1.0,//间隔，后40%的动画时间
      curve: Curves.ease,
    )));
  }
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        builder: _buildAnimation,
        animation: controller,

    );
  }
  Widget _buildAnimation(BuildContext context,Widget child) {
      return Container(
        alignment: Alignment.bottomCenter,
        padding: padding.value,
        child: Container(
          color: color.value,
          width: 50.0,
          height: height.value,
        ),
      );
  }

}
class StaggerRoute extends StatefulWidget {
  @override
  StaggerRouteState createState() => new StaggerRouteState();
}

class StaggerRouteState extends State<StaggerRoute> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body:  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          child: _StaggerAnimation(controller: _controller,),
        ),
      ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),vsync: this
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  Future<Null> _playAnimation() async{
    try{
      //先正向执行动画
      await _controller.forward().orCancel;
      //再返回执行动画
      await _controller.reverse().orCancel;
    }on TickerCanceled{}
  }


}