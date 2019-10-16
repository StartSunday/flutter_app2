import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '表单form',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: FormTest(),
  ));
}

class  FormTest extends StatefulWidget {
  @override
  _FormTestState createState() =>  _FormTestState();
}

class _FormTestState extends State<FormTest> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  GlobalKey _formKey = GlobalKey<_FormTestState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  AppBar(
        title:  Text('form test'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 12.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus:  true,
                controller: _controller,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  icon: Icon(Icons.person)
                ),
                validator: (v){
                  return v
                      .trim()
                      .length>0 ? null: '用户名不能为空';
                },
              ),
              TextFormField(
                controller: _controller2,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    icon: Icon(Icons.lock)
                ),
                obscureText: true,
                validator: (v){
                  return v
                      .trim()
                      .length>5 ? null: '密码不能少于6位';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Builder(builder: (context){
                        return  RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text('登录'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。

                          //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                          if(Form.of(context).validate()){
                            //验证通过提交数据
                            print('登录成功');
                          }
//                          if((_formKey.currentState as FormState).validate()){
//                            //验证通过提交数据
//                          }
                        },
                        );
                      },
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}