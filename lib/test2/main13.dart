import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '尺寸限制容器',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage2(),
    ),
  );
}

class HomePage extends StatelessWidget {
  Widget redBox  = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制容器'),
      ),
      //，我们发现有多重限制时，对于minWidth和minHeight来说，
      // 是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。
      body: ConstrainedBox(
        constraints: BoxConstraints(minHeight:  60.0,minWidth: 60.0),
        child: UnconstrainedBox(//‘去除’父级限制 UnconstrainedBox对父组件限制的“去除”并非是真正的去除：
          child: ConstrainedBox(
           constraints: BoxConstraints(minWidth: 90.0,minHeight: 20.0),
            child: redBox,
          ),
        ),
      ),

//      body: SizedBox(
//        width: 80.0,
//        height: 80.0,
//        child: redBox,
//      ),
//      body: ConstrainedBox(
//        constraints: BoxConstraints(
//          minWidth:  double.infinity,//宽度尽可能大
//          minHeight: 50.0,//最小高度为50像素
//          maxHeight: 80.0,//最大高度为80像素
//        ),
//        child: Container(
//          height: 200.0,
//          child: redBox,
//        ),
//      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  String _title = '尺寸限制容器';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
    );
  }
}