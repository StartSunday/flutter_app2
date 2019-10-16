import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key ,this.initValue : 0}): super(key: key);
  final int initValue;

  @override
  CounterWidgetState createState() => new CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }
  @override
  void initState() {//第一次插入到widget树
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print('initState');
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('reassemble');
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}