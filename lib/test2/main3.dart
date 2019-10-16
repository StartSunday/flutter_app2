import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '输入框和表单',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextFieldTest()
  )
  );
}


class TextFieldTest extends StatefulWidget {
  @override
  TextFieldTestState createState() => new TextFieldTestState();
}

class TextFieldTestState extends State<TextFieldTest> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode _focusScopeNode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('输入框和表单'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: _focusNode,
                controller: _controller,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (v){
                  print('onChanged$v');
                },
              ),
              Container(
                  child: TextField(
                    controller: _controller2,
                    focusNode: _focusNode2,
                    decoration: InputDecoration(
                        labelText: '密码',
                        hintText: '您的登录密码',
                        border: InputBorder.none,//隐藏下划线
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 14.0),
                        prefixIcon: Icon(Icons.lock)),
                    obscureText: true,
                  ),
                decoration: BoxDecoration(
                  border: Border(bottom:BorderSide(color: Colors.grey[200],width: 1.0))
                ),
              ),


              Builder(builder: (ctx){
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('移动焦点'),
                      onPressed: (){
                        //将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        if(null == _focusScopeNode){
                          _focusScopeNode = FocusScope.of(context);
                        }
                        _focusScopeNode.requestFocus(_focusNode2);
                      },
                    ),

                    RaisedButton(
                      child: Text('隐藏键盘'),
                      onPressed: (){
                        _focusNode.unfocus();
                        _focusNode2.unfocus();
                      },
                    ),
                  ],

                );

              },)
            ],
          ),
        )
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      print(_controller.text);
    });
    _controller2.addListener((){
      print(_controller2.text);
    });
  }
}