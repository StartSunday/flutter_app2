import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListView2(),
    ),
  );
}

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
        ],
      ),
    );
  }
}

class ListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text('商品列表'),),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,//强制高度为50.0
              itemBuilder: (BuildContext context,int index){
                return ListTile(title: Text('$index'),);
              },),
          )
        ],
      )
    );
  }
}

class ListView3 extends StatelessWidget {
  //ListView.separated可以在生成的列表项之间添加一个分割组件，
  // 它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器。
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget drvider1 = Divider(color: Colors.blue,);
    Widget drvider2 = Divider(color: Colors.green,);
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text('$index'),);
        },
        //分割器构造器
        separatorBuilder: (BuildContext context,int index){
          return index%2 ==0 ? drvider1 :drvider2;
        },
      ),
    );
  }
}


class InfiniteListView extends StatefulWidget {
  @override
  InfiniteListViewState createState() =>  InfiniteListViewState();
}

class InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';//表尾标记
  var _words = <String>[loadingTag];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.separated(
          separatorBuilder: (context,index) => Divider(height: .0,),
          itemCount: _words.length,
          itemBuilder: (context,index){
            if(_words[index] == loadingTag){//如果到了表尾
              //不足100条，继续获取数据
              if(_words.length -1 <100){
                //获取数据
                _retrieveData();
                //加载时显示 loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  ),
                );

              }else{
                //已经加载了100条数据，不再获取数据
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text('没有更多了',style: TextStyle(color: Colors.grey),),
                );
              }
            }
            return ListTile(title: Text(_words[index]),);
          },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e){
      _words.insertAll(_words.length-1,
          //每次生成20个单词
        generateWordPairs().take(20).map((e)=>e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

}