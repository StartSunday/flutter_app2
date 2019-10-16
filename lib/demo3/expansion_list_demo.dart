import 'package:flutter/material.dart';
class ExpansionDemo extends StatefulWidget {
  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionDemo> {
  List<int> mList;
  List<Expansion> exList;
  _ExpansionDemoState(){
    mList = List();
    exList = List();
    for(int i =0 ;i<10;i++){
      mList.add(i);
      exList.add(Expansion(i, false));
    }
  }
  _setCureenIndex(int index, bool isExpand){
    setState(() {
      exList.forEach((item){
        if(item.index == index ){
          item.isopen = !isExpand;
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('展开列表'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index,bool){
              _setCureenIndex(index, bool);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title: Text('1111111'),
                );
              },
              body: ListTile(
                title: Text('222222'),
              ),
              isExpanded: exList[index].isopen,
            );
          }).toList(),
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

  @override
  void didUpdateWidget(ExpansionDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class Expansion{
  int index;
  bool isopen;
  Expansion(this.index,this.isopen);
}