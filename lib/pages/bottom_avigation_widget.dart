import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'home_screen2.dart';
import 'home_screen3.dart';
import 'home_screen4.dart';

class BottomNavigationWidget extends StatefulWidget{
  _BottomNavgationWidgetState createState() => _BottomNavgationWidgetState();
}
class _BottomNavgationWidgetState extends State<BottomNavigationWidget>{
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    // TODO: implement initState
    list
        ..add(HomeScreen())
        ..add(HomeScreen2())
        ..add(HomeScreen3())
        ..add(HomeScreen4());
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home1',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home2',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home3',
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },

      ),
    );
  }

}
