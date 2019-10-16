import 'package:flutter/material.dart';
import 'package:flutter_app2/demo9/contextroute.dart';
import 'package:flutter_app2/demo9/echo.dart';
import 'package:flutter_app2/demo9/newrouter.dart';
import 'package:flutter_app2/demo9/newrouter.dart';
import 'package:flutter_app2/demo9/tiproute.dart';
import 'common/config/config.dart';
import 'echo.dart';
import 'contextroute.dart';

void main() {
  runApp(MaterialApp(
    title: '',
    routes: {
      Config.NEW_ROUTE :(context) => NewRoute(),
      Config.TIP_ROUTE:(context) => TipRoute(text :'我是提示'),
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    color: Colors.white,
    onGenerateRoute: (RouteSettings settings){
      return MaterialPageRoute(builder: (cotext){
        String routeName = settings.name;
        return TipRoute(text: routeName,);
      });
    },
    home: MyhomePage(),
  ));
}

class  MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() =>  _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
//    return Echo(text: '1111', backgroutdColor: Colors.blue);
    return ContextRoute();

  }
//    return  Scaffold(
//      appBar:  AppBar(
//        title:  Text(''),
//      ),
//      body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              FlatButton(
//                child: Text('open new route'),
//                textColor: Colors.blue,
//                onPressed: () async{
//                  var result = await Navigator.pushNamed(context, Config.NEW_ROUTE,arguments: '1111');
////                  var result = await Navigator.push(context, MaterialPageRoute(
////                    builder: (context) => TipRoute(text :'我是提示'),
////                  ));
//                  print('返回值 $result');
//                },
//              )
//            ],
//          ),
//      ),
//    );
//  }
}

//void main () => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('fultter demo'),
//      ),
//      body: MyHomePage()
//    );
//  }
//}

