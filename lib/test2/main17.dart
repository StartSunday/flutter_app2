import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Scaffold、TabBar、底部导航',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ScaffoldRoute(),
  ));
}

class ScaffoldRoute  extends StatefulWidget {
  @override
  _ScaffoldRouteState  createState() =>  _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute > with SingleTickerProviderStateMixin {
  int _selectedIndex = 1 ;
  TabController _tabController ;//需要定义一个Controller
  List tabs = ['新闻','历史','图片'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
      //  this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
      //  this.title,// 页面标题
      //  this.actions, // 导航栏右侧菜单
      //  this.bottom, // 导航栏底部菜单，通常为Tab按钮组
      //  this.elevation = 4.0, // 导航栏阴影
      //  this.centerTitle, //标题是否居中
      //  this.backgroundColor,
      appBar: new AppBar(
        title: new Text('Scaffold、TabBar、底部导航'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share),onPressed: (){},)
        ],
        leading: Builder(builder: (context){
          return IconButton(
            icon: Icon(Icons.dashboard,color: Colors.white,),
            onPressed: ()=>Scaffold.of(context).openDrawer(),
          );
        },),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=> Tab(text: e,)).toList()
        ),
      ),
      drawer: MyDrawer(),//抽屉
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),//// 底部导航栏打一个圆形的洞
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),),
            SizedBox(),//中间位置空出
            IconButton(icon: Icon(Icons.business),)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,//均分底部导航栏横向空间
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(//底部导航
//        items: <BottomNavigationBarm Item>[
//          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('home')),
//          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text('business')),
//          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text('school')),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(//悬浮按钮
        child: Icon(Icons.star,color: Colors.white,),
        backgroundColor: Colors.orange,
        onPressed: _onAdd,
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5,),
          );
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex  = value;
    });
  }

  void _onAdd() {
  }
}
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset('images/mimi1.gif',width: 80,),
                      ),
                    ),
                    Text('Wendux',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manage  accounts'),
                    ),
                  ],
                ),
              )
            ],
          )
      ),

    );
  }
}
