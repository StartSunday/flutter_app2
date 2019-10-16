import 'package:flutter/material.dart';
class ToolTipDemo extends StatefulWidget {
  @override
  _ToolTipDemoState createState() => _ToolTipDemoState();
}

class _ToolTipDemoState extends State<ToolTipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('11111'),
      ),
      body: Center(
        child: Tooltip(
          message: '11111111111',
          child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568025734113&di=04084638c89af85ceed8107a999b05a2&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201803%2F08%2F20180308151257_mHwPu.jpeg',
          fit: BoxFit.cover,),
        ),
      ),
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


}