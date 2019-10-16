import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '进度指示器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('进度指示器'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: LinearProgressIndicator(
                    value: .5,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CircularProgressIndicator(
                  value: .5,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  strokeWidth: 4.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  strokeWidth: 4.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                 height: 3,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    strokeWidth: 4.0,
                  ),
                ),
              ),
              ProgressRoute(),
              ProgressRoute2(),
            ],
          )
        ),
      ),
    ),
  );
}

class ProgressRoute2 extends StatefulWidget {
  @override
  ProgressRoute2State createState() =>  ProgressRoute2State();
}

class ProgressRoute2State extends State<ProgressRoute2> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey,end: Colors.blue)
              .animate(_animationController),
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(()=>{}));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

}



class ProgressRoute extends StatefulWidget {
  @override
  ProgressRouteState createState() =>  ProgressRouteState();
}

class ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey,end: Colors.blue)
                  .animate(_animationController),
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(()=>{}));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

}