import 'package:flutter/material.dart';
import 'asset.dart';

class SearchDemo extends StatefulWidget {
  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('11111111111'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
            showSearch(context: context,delegate: searchBarDelegate());
            },
          )
        ],
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
  void didUpdateWidget(SearchDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
class searchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {//复写右侧图标
    // TODO: implement buildActions
    return [ IconButton(
      icon: Icon(Icons.clear),
      onPressed:()=>query = "" ,
    ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) { //复写左侧图标
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,progress:transitionAnimation,
      ),
      onPressed: () =>close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {//结果展示
    // TODO: implement buildResults
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {//推荐
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    // TODO: implement buildSuggestions
    return ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount:suggestionList.length,
        itemBuilder: (BuildContext context, int index) =>ListTile(
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text:  suggestionList[index].substring(query.length),
                  style: TextStyle(
                  color: Colors.grey,)
                )
              ]
            ),
          ),
        ) ,
    );
  }

}
