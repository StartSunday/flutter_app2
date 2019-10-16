import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:ui';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(//约束盒子组件
            constraints: BoxConstraints.expand(),
            child: Image.network('http://pic1.win4000.com/wallpaper/c/53cdd1f7c1f21.jpg'),
          ),
          Center(
            child: ClipRect(//可剪切的矩形
              child: BackdropFilter(//背景过滤器
                filter: prefix0.ImageFilter.blur(sigmaX: 5,sigmaY: 5),//图片过滤器，模糊
                child: Opacity(//透明度
                opacity: 0.2,//0 - 1
                child: Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(color: Colors.grey.shade200),//盒子修饰器
                  child: Center(
                    child: Text(
                      '1111',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}