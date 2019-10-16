import 'package:flutter/material.dart';

class  WarpDemo extends StatefulWidget {
  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('1111'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.7,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.green,
            child: Wrap(
              children: list,
              spacing: 26,
            ),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget( oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget buildAddButton() {
    return GestureDetector(//手势识别
      onTap: (){
        if(list.length< 9){
          setState(() {
            list.insert(list.length-1, buldPhoto());
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 90,
          color: Colors.redAccent,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buldPhoto() {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 90,
          color: Colors.blue,
          child: Center(
            child: Text('照片'),
          ),

        ),
      );
  }
}