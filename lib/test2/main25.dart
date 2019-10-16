import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '数据共享（InheritedWidget）',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InheritedWidgetTestRoute(),
    ),
  );
}
class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => new _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {

      //使用InheritedWidget中的共享数据
    return  Text('111111111');
//      Text(ShareDataWidget.of(context).data.toString());

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('didChangeDependencies change');
  }
}
class  InheritedWidgetTestRoute  extends StatefulWidget {
  @override
  InheritedWidgetTestRouteState createState() => new InheritedWidgetTestRouteState();
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute > {
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: ShareDataWidget(//使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(),//子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text('Increment'),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(()=> ++count),
              ),
            ],
        ),
        ),
      ),
    );
  }
}


class ShareDataWidget extends InheritedWidget {
  final int data; //需要在子树中共享的数据，保存点击次数
  ShareDataWidget({
    @required this.data,
    Widget child
  }): super(child: child);
  ////定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context){
//    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  
      return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }

}