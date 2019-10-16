import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationRouteTest(),
    ),
  );
}

class NotificationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: NotificationListener(
        // ignore: missing_return
        onNotification: (notitication){
          switch(notitication.runtimeType){
            case ScrollStartNotification: print('开始滚动'); break;
            case ScrollUpdateNotification: print('正在滚动');break;
            case ScrollEndNotification: print('滚动停止'); break;
            case OverscrollNotification: print('滚动到边界');break;
          }
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
                return ListTile(title:  Text('$index'),);
            },
        ),
      ),
    );
  }
}
class MyNotification extends Notification{
  MyNotification(this.msg);
  final String msg;
}


class NotificationRouteTest extends StatefulWidget {
  @override
  NotificationRouteTestState createState() => new NotificationRouteTestState();
}

class NotificationRouteTestState extends State<NotificationRouteTest> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification){
          print(notification.msg);//打印通知
          return false;
        },
        child:  NotificationListener<MyNotification>(
          onNotification: (notification){
            setState(() {
              _msg+= notification.msg+" ";
            });
            return false;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//              RaisedButton(
//              onPressed: () => MyNotification('Hi').dispatch(context),
//                child: Text('Send Notification'),
//              ),

                Builder(
                  builder: (context){
                    return RaisedButton(
                      onPressed: () => MyNotification('Hi').dispatch(context),
                      child: Text('Send Notification'),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ),
      )
    );
  }
//  //遍历回调，会对每一个父级Element执行此回调
//  bool visitAncestor(Element element){
//    //判断当前element对应的widget是否是notificationlistenre
//    //由于notificationlisterner是继承自statelesswidget
//    //由于判断是否是statelessElement
//    if(element is StatelessElement){
//      //是StatelessElement，则获取element对应的widget,判断 是否是notificationlistener
//      final StatelessWidget widget = element.widget;
//      if(widget is NotificationListener<Notification>){
//        //是NotificationListener,则调用 该 notificationlistener
//        if(widget.d)
//      }
//    }
//  }
//  bool _dispathch(Notification notification,Element element){
//    //如果通知监听器不为空，并且当前通知类型是该NotificationListener
//    // 监听的通知类型，则调用当前NotificationListener的onNotification
//    if(notification != null && notification is T){
//      final bool result = o()
//    }
//  }

}