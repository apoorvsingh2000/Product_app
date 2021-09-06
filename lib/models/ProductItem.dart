import 'package:flutter/material.dart';

class ProductItem {
  final _productUrl;
  final _videoUrl;

  ProductItem(this._productUrl, this._videoUrl);

  get videoUrl => _videoUrl;

  get productUrl => _productUrl;
}
// PageView.builder(
// itemCount: 5,
// scrollDirection: Axis.vertical,
// itemBuilder: (context, index) {
// return Stack(
// children: [
// Container(
// color: Colors.blue,
// child: Center(
// child: Text("$videoUrl \nbruh\n $productUrl $index"),
// ),
// ),
// Positioned(
// bottom: MediaQuery.of(context).size.height * 0.05,
// left: MediaQuery.of(context).size.width * 0.35,
// child: Material(
// color: Colors.transparent.withOpacity(0.2),
// borderRadius: BorderRadius.circular(30.0),
// child: MaterialButton(
// onPressed: () {},
// minWidth: 80.0,
// height: 10.0,
// child: Text(
// "View Product ",
// ),
// ),
// ),
// ),
// ],
// );
// },
// );
