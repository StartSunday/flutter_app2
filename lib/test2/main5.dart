import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '图片和icon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('图片和icon'),
        ),
        body: Center(
          child: Column(
            //this.width, //图片的宽
            //  this.height, //图片高度
            //  this.color, //图片的混合色值
            //  this.colorBlendMode, //混合模式
            //  this.fit,//缩放模式
            //  this.alignment = Alignment.center, //对齐方式
            //  this.repeat = ImageRepeat.noRepeat, //重复方式
            children: <Widget>[
              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fill,),//填充
              Image.asset('images/mimi2.gif',width: 50.0,height: 50.0, fit: BoxFit.contain,), //尽可能和原图片完全相同
              Image(image: NetworkImage(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568623002024&di=d810c26ae672782ff021cfbcd924f16a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb1cce6f996734bdbb9b3fb9ef7705deabc980e35493b-ysf8BZ_fw658'),
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,//尽可能覆盖目标框
              ),
              Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568623002024&di=d810c26ae672782ff021cfbcd924f16a&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb1cce6f996734bdbb9b3fb9ef7705deabc980e35493b-ysf8BZ_fw658',
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth, //保证全宽
              ),
              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fitHeight,),//保证全高
              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.scaleDown,),//Box大于父控件，则采用与contain一致的缩放模式，否则采用none缩放模式
              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.none,),////不进行任何缩放操作
              Image(image: AssetImage('images/mimi1.gif'),
                width: 100.0,
                height: 50.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(image: AssetImage('images/mimi1.gif'),
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              ),
//              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fitHeight,),//保证全高
//              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fitHeight,),//保证全高
//              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fitHeight,),//保证全高
//              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fitHeight,),//保证全高
//              Image(image: AssetImage('images/mimi1.gif'),width: 100.0,height: 50.0,fit: BoxFit.fitHeight,),//保证全高

            ].map((e){
              return Row(
                children: <Widget>[
                  Padding (
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        )
      ),
    ),
  );
}
//
//class  extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('图片和icon'),
//      ),
//    );
//  }
//}