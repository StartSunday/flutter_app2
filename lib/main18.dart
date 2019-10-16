import 'package:flutter/material.dart';

class Product{
  final String title;
  final String description;
  Product(this.title,this.description);
}

void main() {
  runApp(MaterialApp(
    title: '导航的数据和传递和接收',
    home: ProductList(
        list: List.generate(20, (i) => Product('商品$i', '商品编号$i'))
    ),
  ));
}

class ProductList extends StatelessWidget {
  final List<Product> list;

  ProductList({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('11111111111'),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index].title),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProductDetail(product:list[index])
            ));
          },
        );
      }),
    );
  }
}
class ProductDetail extends StatelessWidget{
  final Product product;
  ProductDetail({Key key , @required this.product}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('${product.title}'),),
      body: Center(child: Text('${product.description}'),),
    );
  }
}