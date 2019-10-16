import 'package:flutter/material.dart';
import 'main22.dart';

class BottomAppBarDemo extends StatefulWidget{
  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}
class _BottomAppBarState extends State<BottomAppBarDemo>{
  List<Widget> _eachView;
  int index = 0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = List();
    _eachView..add(EacView("home"))..add(EacView('page'));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _eachView[index],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return EacView("111111");
          }));
        },
        tooltip: '1111111111111',
        child: Icon(Icons.accessible,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize:  MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home,color: Colors.deepOrange,),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.home,color: Colors.deepOrange,),
              color: Colors.white,

              onPressed: (){
                setState(() {
                  index = 1 ;
                });
              },

            ),
          ],
        ),
      ),

    );
  }

}