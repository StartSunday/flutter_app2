import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '流式布局',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage3(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Row(
        children: <Widget>[
          Text('xxx'*100)
        ],
      ),
    );
  }
}


class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Wrap(
        spacing: 8.0,//主轴（水平）方向间距
        runSpacing: 4.0,//纵轴（垂直）方向 间距
        alignment: WrapAlignment.center,//沿主轴方向剧中
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('A'),),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('B'),),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('C'),),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('D'),),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('E'),),
            label: Text('Hamilton'),
          ),
        ],
      ),
    );
  }
}

class HomePage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          Container(width: 80.0,height: 80.0,color: Colors.red,),
          Container(width: 80.0,height: 80.0,color: Colors.green,),
          Container(width: 80.0,height: 80.0,color: Colors.blue,),
          Container(width: 80.0,height: 80.0,color: Colors.yellow,),
          Container(width: 80.0,height: 80.0,color: Colors.brown,),
          Container(width: 80.0,height: 80.0,color: Colors.purple,),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate{
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren

    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for(int i = 0; i<context.childCount;i++){
      var w  = context.getChildSize(i).width + x+ margin.right;
      if(w< context.size.width){
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      }else{
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget（有优化）
        context.paintChild(i,transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left +margin.right;
      }

    }
  }
  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
