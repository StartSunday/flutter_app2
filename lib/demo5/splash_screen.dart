import 'package:flutter/material.dart';
import 'myhomepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() =>  _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568025734113&di=04084638c89af85ceed8107a999b05a2&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F08%2F20180308151257_mHwPu.jpeg',
      scale: 2.0,
      fit: BoxFit.cover,),

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePages()),
                (route) => route == null
           );
      }
    });
    _controller.forward();//播放动画
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SplashScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
