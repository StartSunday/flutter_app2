import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '单选框和复选框',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('单选框和复选框'),
        ),
        body: SwitchAndCheckBoxTest(),
      ),
    ),
  );
}

class SwitchAndCheckBoxTest extends StatefulWidget {
  @override
  SwitchAndCheckBoxTestState createState() => new SwitchAndCheckBoxTestState();
}

class SwitchAndCheckBoxTestState extends State<SwitchAndCheckBoxTest> {
  bool _swithSelected = true;//维护单选开关状态
  bool _checkboxSelected = true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _swithSelected,//当前状态
          onChanged: (value){
            setState(() {
              _swithSelected = value;
              print(value);
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,//选中时的颜色
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
              print(value);
            });
          },
        )

      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(SwitchAndCheckBoxTest oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

//class  extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('单选框和复选框'),
//      ),
//    );
//  }
//}