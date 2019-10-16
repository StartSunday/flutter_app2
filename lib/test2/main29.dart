import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '对话框详解',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlertDialogRoute(),
    ),
  );
}



class AlertDialogRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对话框详解'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('对话框1'),
              onPressed: () async{
                bool delete = await showDeleteConfirmDialog1(context);
                if(delete == null){
                  print('取消删除');
                }else{
                  print('已确认删除');
                }
              },
            ),
            RaisedButton(
              child: Text('对话框2'),
              onPressed: () async{
               changeLanguage(context);
              },
            ),
            RaisedButton(
              child: Text('对话框3'),
              onPressed: () async{
                showListDialog(context);
              },
            ),
            RaisedButton(
              child: Text('对话框4'),
              onPressed: () async{
                bool delete = await showCustomDialogTest(context);
                if(delete == null){
                  print('取消删除');
                }else{
                  print('已确认删除');
                }
              },
            ),
            RaisedButton(
              child: Text('对话框4，复选框可点击'),
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialog3(context);
                if(deleteTree== null){
                  print('取消删除');
                }else{
                  print('同时删除子目录 ：$deleteTree');
                }
              },
            ),

            RaisedButton(
              child: Text('对话框5，复选框可点击'),
              onPressed: () async {
                bool deleteTree = await showDeleteConfirmDialog4(context);
                if(deleteTree== null){
                  print('取消删除');
                }else{
                  print('同时删除子目录 ：$deleteTree');
                }
              },
            ),
            RaisedButton(
              child: Text('显示底部菜单列表'),
              onPressed: () async{
                int type = await _showModalBottomSheet(context);
                print(type);
              },
            ),
            RaisedButton(
              child: Text('loadingDailog'),
              onPressed: () async{
                showLoadingDialogRoute(context);
              },
            ),
            RaisedButton(
              child: Text('android时间选择'),
              onPressed: () async{
                _showDatePickerRoute(context);
              },
            ),
            RaisedButton(
              child: Text('ios时间选择'),
              onPressed: () async{
               _showDatePickerRoute2(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('提示'),
          content: Text('您确定要删除 当前文件吗'),
          actions: <Widget>[
            FlatButton(
              child:  Text('取消'),
              onPressed: () => Navigator.of(context).pop(),//关闭对话框
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: (){
                //关闭对话框 并返回true
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      }
    );
  }

  Future<void>changeLanguage(BuildContext context) async{
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  //返回1
                  Navigator.pop(context,1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  //返回2
                  Navigator.pop(context,2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              )
            ],
          );
    }
    );
    if(i != null){
      print('选择了：${i==1 ?'中文简体' : '美国英语'}');
    }
  }

  Future<void> showListDialog(BuildContext context) async{
    int index = await showDialog<int>(
        context: context,
        builder: (BuildContext context){
          var child = Column(
            children: <Widget>[
              ListTile(title: Text('请选择'),),
              Expanded(
                child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('$index'),
                          onTap: () => Navigator.of(context).pop(index),
                        );
                    },
                ),
              )
            ],
          );
          //使用AlertDialog 会报错
      return Dialog(child: child,);
      },
    );
    if(index != null){
      print('点击了：$index');
    }
  }
  
  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }){
    final ThemeData theme = Theme.of(context,shadowThemeOnly: true);
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation){
          final Widget pageChild = Builder(builder:  builder,);
          return SafeArea(
            child: Builder(builder: (BuildContext context){
              return theme != null ? Theme(data: theme, child: pageChild,): pageChild;
            },),
          );

        },
        barrierDismissible: barrierDismissible,
        barrierLabel:  MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor:  Colors.black87,//自定义遮罩颜色
        transitionDuration: const Duration(microseconds: 150),
        transitionBuilder: _buildMaterialDialogTransitions,
        );
    
  }
  

  Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  Future<bool> showCustomDialogTest<boll>(BuildContext context){
    return showCustomDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('取消'),
          content: Text('您确定要删除 当前文件吗？'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () =>Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('删除'),
              //执行删除 操作
              onPressed:() => Navigator.of(context).pop(true),
            )
          ],
        );
      }
    );
  }

  Future<bool> showDeleteConfirmDialog3(BuildContext context){
    bool _withTree = false;//记录复选框 是否选 中
    return showCustomDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('您确定要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('同时删除 当前文件吗？'),
                    DialogCheckbox(
                      value: _withTree,//默认不选 中
                      onChanged: (bool value){
                        //更新选中状态
                        _withTree = !_withTree;
                      },
                    )
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () =>Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('删除'),
                //将选中状态返回
                onPressed: () => Navigator.of(context).pop(_withTree),
              )
          ],
          );
        }
    );
  }

  Future<bool> showDeleteConfirmDialog4(BuildContext context){
    bool _withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('您确定要删除 当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录 ？'),
                    Checkbox(
                      value:_withTree,
                      onChanged: (bool value){
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () => Navigator.of(context).pop(_withTree),
              )
            ],
          );
        }
    );
  }
  //弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet(BuildContext context){
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context){
          return ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('$index'),
                    onTap: () => Navigator.of(context).pop(index),
                  );
              },
          );
        }
    );

  }
  Future<void> showLoadingDialogRoute(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,//点击遮罩不关闭
      builder: (context){
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child:
            AlertDialog(
              content: Column(
                mainAxisSize:  MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text('正在加载，请稍后...'),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Future<DateTime> _showDatePickerRoute(BuildContext context){
    var date = DateTime.now();
    return showDatePicker(context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(Duration(days: 30)),
        
    );
  }
  Future<DateTime> _showDatePickerRoute2(BuildContext context){
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (context){
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(Duration(days: 30)),
              maximumYear: date.year+1,
              onDateTimeChanged: (DateTime value){
                print(value);
              },
            ),
          );
        }
    );
  }

}


class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({Key key, this.value, @required this.onChanged,});
  final ValueChanged<bool> onChanged;
  final bool value;
  @override
  DialogCheckboxState createState() => new DialogCheckboxState();
}

class DialogCheckboxState extends State<DialogCheckbox> {
  bool value;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v){
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    value = widget.value;
    super.initState();
  }
}


