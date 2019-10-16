import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '跨组件状态共享（Provider）',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderRoute (),
    ),
  );
}

class Item{
  Item(this.price,this.count);
  double price;//商品单价
  int count;//商品份数
}

class CartModel extends ChangeNotifier{
  //用于保存购物车中的商品列表
  final List<Item> _items = [];
  //禁睛改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  //购物车中的商品的总价
  double get totalPrice => _items.fold(0, (value,item)=> value+ item.count * item.price);
  //将[item] 添加到购物车。这是唯一一种能从外部改变购物车的方法
  void remove(Item item){
    _items.remove(item);
    //通知监听器（订阅者），重新构建InheritedProvider,更新状态
    notifyListeners();
  }

  void add(Item item){
    _items.add(item);
    //通知监听器（订阅者），重新构建InheritedProvider,更新状态
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  @override
  ProviderRouteState createState() => new ProviderRouteState();
}

class ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('跨组件状态共享（Provider）'),),
      body:  Center(
        child: ChangeNotifierProvider<CartModel> (
          data: CartModel(),
          child: Builder(builder: (context){
            return Column(
              children: <Widget>[
                Consumer<CartModel>(
                  builder: (context,cart) =>Text('总价：${cart.totalPrice}'),
                ),
//                Builder(builder: (context){
//                  var cart = ChangeNotifierProvider.of<CartModel>(context);
//                  return Text('总价：${cart.totalPrice}');
//                },),
                Builder(builder: (context){
                  print('RaiseButton build');//在后面优化部分会用到

                  return RaisedButton(
                    child: Text('添加商品'),
                    onPressed: (){
                      //给购物车添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context,listen:false).add(Item(20.0,1));
                    },
                  );
                },),
//                Builder(builder: (context){
//                  print('RaiseButton build');//在后面优化部分会用到
//
//                  return RaisedButton(
//                    child: Text('减少商品'),
//                    onPressed: (){
//                      //给购物车添加商品，添加后总价会更新
//                      ChangeNotifierProvider.of<CartModel>(context).remove(Item(20.0,1));
//                    },
//                  );
//                },)
              ],
            );
          },) ,
        ),
      )
    );
  }
}
// 该方法用于在Dart中获取模板类型
Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
  Key key,
  this.data,
  this.child,
  });
  final Widget child;
  final T data;
//  //定义一个便捷方法，方便子树中的widget获取共享数据
//  static T of<T>(BuildContext context){
//    final type  = _typeOf<InheritedProvider<T>>();
//    final provider = context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
//    return provider.data;
//  }
  //定义一个listen参数，表示是否建立依赖关系
  static T of<T>(BuildContext context ,{bool listen = true}){
    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
    ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>
        : context.ancestorInheritedElementForWidgetOfExactType(type) ?.widget as InheritedProvider<T>;
    return provider.data;
  }


  @override
  ChangeNotifierProviderState<T> createState() => new ChangeNotifierProviderState<T>();
}

class ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider> {
 void update(){
//如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
   setState(() {

   });
}

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
  @override
  void didUpdateWidget(ChangeNotifierProvider<ChangeNotifier> oldWidget) {
    // TODO: implement didUpdateWidget
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if(widget.data != oldWidget.data){
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    //移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

}

class InheritedProvider<T> extends InheritedWidget{
  InheritedProvider({@required this.data, Widget child}): super(child: child);
  //共享状态使用泛型
  final T data;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }

}

class Consumer<T> extends StatelessWidget{
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  }):assert (builder != null), super(key: key);
  final Widget child;
  final Widget Function(BuildContext context,T value) builder;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context)//自动获取Model
    );
  }

}
