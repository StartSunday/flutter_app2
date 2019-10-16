import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CustomScrollView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomScrollViewTest(),
    ),
  );
}

class CustomScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned:  true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView'),
              background: Image.asset('.images/img_notavailable.jpeg',fit: BoxFit.cover,),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                  (context,index)=>
                  //创建子widget
                      Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100*(index%9)],
                        child: Text('grid item$index'),
                      ),
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                (context,index) =>
                //创建列表项      
                    Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100*(index%9)],
                      child: Text('list item$index'),
                    ),
              childCount: 50 //50个列表项
            ),
          )
        ],
      ),
    );
  }
}