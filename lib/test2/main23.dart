import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ScrollController',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollNotificationTestRoute(),
    ),
  );
}

class ScrollControllerTest extends StatefulWidget {
  @override
  ScrollControllerTestState createState() =>  ScrollControllerTestState();
}

class ScrollControllerTestState extends State<ScrollControllerTest> {
  ScrollController _controller = ScrollController();
  bool showToTopBth = false; //是否显示‘返回顶部’按钮
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController'),
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0,
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('$index'),);
            },
        ),
      ),
      floatingActionButton: !showToTopBth? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          //返回到顶部时执行动画
          _controller.animateTo(.0, duration: Duration(microseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }
  @override
  void initState() {
//    // TODO: implement initState
//    super.initState();
    _controller.addListener((){
      print(_controller.offset);//打印滚动位置
      if(_controller.offset <1000 && showToTopBth){
        setState(() {
          showToTopBth = false;
        });
      }else if(_controller.offset>= 1000 && showToTopBth == false){
        setState(() {
          showToTopBth = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

}

class ScrollNotificationTestRoute  extends StatefulWidget {

  @override
  ScrollNotificationTestRouteState createState() =>  ScrollNotificationTestRouteState();
}

class ScrollNotificationTestRouteState extends State<ScrollNotificationTestRoute> {
  String _progress = '0%';//保存进度百分比
  @override
  Widget build(BuildContext context) {
    return Scrollbar(//进度条
      //监听滚动通知
      //pixels：当前滚动位置。
      //maxScrollExtent：最大可滚动长度。
      //extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
      //extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
      //extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
      //atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification){
          double progress = notification.metrics.pixels/notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress ='${(progress *100).toInt()}%';
          });
          print('BottomEdge: ${notification.metrics.extentAfter == 0}');
          return true;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount:100 ,
                itemExtent:  50.0,
                itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('$index'),);
                },
            ),
            CircleAvatar(//显示 进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }

}