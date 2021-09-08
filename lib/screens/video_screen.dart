import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_app/models/ProductItem.dart';
import 'package:product_app/models/ProductItem.dart';
import 'package:product_app/models/VideoPlayer.dart';
import 'package:url_launcher/url_launcher.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: firestore.collection('products').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final products = snapshot.data.docs;
                    List productItemList = [];
                    for (var product in products) {
                      final productUrl = product.data()['product_url'];
                      final videoUrl = product.data()['video_url'];
                      final productToAdd = ProductItem(productUrl, videoUrl);
                      productItemList.add(productToAdd);
                    }
                    return PageView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            VideoPlayerCustom(),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.05,
                              left: MediaQuery.of(context).size.width * 0.35,
                              child: Material(
                                color: Colors.transparent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    launchURL(productItemList[index].productUrl);
                                  },
                                  minWidth: 80.0,
                                  height: 10.0,
                                  child: Text(
                                    "View Product ",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          );
        },
      ),
    );
  }

//forceWebView: true
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// return FutureBuilder(builder: (context, projectSnap) {
// return ListView.builder(
// itemCount: 3,//projectSnap.data.length,
// itemBuilder: (context, index) {
// //
// }
// });
