import 'dart:io';
import 'package:charcode/html_entity.dart';
void main(){

  var i = 10;
  const j = 10;
  final k =10;
  num h  = 1.00;
  StringBuffer stringBuffer = StringBuffer();
  stringBuffer..write('1')..write("2")..write("3");
  print(stringBuffer);
  stringBuffer.clear();
  print(stringBuffer);

  var list = List();
  list..add('1111')
  ..add("222")
  ..add('33');
  print(list.length);
  list.addAll(['11','22','33','44']);
  print(list.toString());
  var index = list.indexOf('11');
  print(index);

  var set = Set();
  set.addAll(['111','222','333']);
  set.add('111');

  print(set.length);
  
  var newSet = Set.from(['111','222']);
  var section = set.intersection(newSet);
  print(section.length);
  print(section.toString());

  var map = {'11': ['1111','222'],
    '22':['222','333'],
    '33':['333','444']
  };
//  map['22'] = ['111','2222'];
  print(map.toString());
//  map.remove('22');

  print(map.containsKey('22'));

  map.forEach((x,v) => print("$x\n $v"));
}