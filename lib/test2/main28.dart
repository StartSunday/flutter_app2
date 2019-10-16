import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '异步UI更新（FutureBuilder、StreamBuilder）',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:StreamBuilderRoute(),
    ),
  );
}

class FutureBuilderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步UI更新（FutureBuilder、StreamBuilder）'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future:mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            //请求结束
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                //请求失败，显示错误
                return Text('Error: ${snapshot.error}');
              }else{
                //请求成功，显示数据
                return Text('Contents: ${snapshot.data}');
              }
            }else{
              return CircularProgressIndicator();
            }
          }

        ),
      ),
    );
  }
  Future<String> mockNetworkData()async{
    return Future.delayed(Duration(seconds: 2),()=> '我是从互联网上获取的数据');
  }

}

class StreamBuilderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步UI更新（FutureBuilder、StreamBuilder）'),
      ),
      body:StreamBuilder<int>(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          if(snapshot.hasError)
            return Text('Error: ${snapshot.error}');
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active:${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
          return null;//unreadchable
        },
      ) ,
    );
  }

  Stream<int> counter(){
    return Stream.periodic(Duration(seconds: 1),(i)=> i);
  }
}