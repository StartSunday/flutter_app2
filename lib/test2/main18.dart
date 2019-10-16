import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '剪裁（Clip）',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClipTestRoute (),
    ),
  );
}

class ClipTestRoute  extends StatelessWidget {
  Widget avatar = Image.asset('images/img_not_available.jpeg',width: 60.0,color: Colors.black,);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('剪裁（Clip）'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            avatar,//不剪裁
            ClipOval(child: avatar,),
            ClipRRect(//剪裁为圆角矩形
              borderRadius: BorderRadius.circular(10.0),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
                Text('你好世界',style: TextStyle(color: Colors.green),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect(//将溢出部分剪裁
                 child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                ),
                Text('你好世界',style: TextStyle(color: Colors.green),)
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: ClipRect(
                child: avatar,
                clipper: MyClipper(),//使用自定义的clipper
              ),
            )
            
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect>{
  //getClip()是用于获取剪裁区域的接口，由于图片大小是60×60，我们返
  // 回剪裁区域为Rect.fromLTWH(10.0, 15.0, 40.0, 30.0)，及图片中部40×30像素的范围。
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
//shouldReclip() 接口决定是否重新剪裁。如果在应用中，剪裁区域始终不会发生变化时应该返回false，
// 这样就不会触发重新剪裁，避免不必要的性能开销。如果剪裁区域会发生变化（比如在对剪裁区域
// 执行一个动画），那么变化后应该返回true来重新执行剪裁。
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}