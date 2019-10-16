import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'GridView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridView5(),
    ),
  );
}

class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,//横轴三个子widget
          childAspectRatio: 1.0,//宽高比为1时，子widget
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      ),
    );
  }
}

class GridView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      //GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount
      // 我们通过它可以快速的创建横轴固定数量子元素的GridView，
      body: GridView.count(//
        crossAxisCount: 3,//横轴三个子widget
        childAspectRatio: 1.0,//宽高比为1时，子widget
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      ),
    );
  }
}

class GridView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      //GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount
      // 我们通过它可以快速的创建横轴固定数量子元素的GridView，
      body: GridView(//
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,//为子元素在横轴上的最大长度
          childAspectRatio: 2.0,//宽高比为2
        ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ],
      ),
    );
  }
}

class GridView4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      //GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，
      // 我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView，上面的示例代
      // 码等价于：
      body: GridView.extent(
        maxCrossAxisExtent: 120.0,
        childAspectRatio: 2.0,
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
        ],
      ),
    );
  }
}
class GridView5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (context,index) =>
          Container(
            color: Colors.green,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          ),
          staggeredTileBuilder: (index)=>
              StaggeredTile.count(2, index.isEven ?2 :1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
      ),
    );
  }
}


class InfiniteGridView extends StatefulWidget {
  @override
  InfiniteGridViewState createState() => new InfiniteGridViewState();
}

class InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];//保存Icon数据
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:  3,//每行三列
            childAspectRatio: 1.0,//显示区域宽高相等
          ),
          itemCount: _icons.length,
          itemBuilder: (context,index){
            if(index == _icons.length -1 && _icons.length< 200){
              _retrieveicons();
            }
            return Icon(_icons[index]);
          }
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveicons();
  }

  void _retrieveicons() {
      Future.delayed(Duration(microseconds: 200)).then((e){
        setState(() {
          _icons.addAll([
            Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access,
            Icons.cake,
            Icons.free_breakfast
          ]);
        });
      });
  }

}