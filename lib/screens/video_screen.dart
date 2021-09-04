import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text("hello $index"),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Material(
                  color: Colors.transparent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {},
                    minWidth: 80.0,
                    height: 10.0,
                    child: Text(
                      "View Product",
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Material(
// elevation: 5.0,
// color: Colors.transparent,
// borderRadius: BorderRadius.circular(30.0),
// child: Padding(
// padding: EdgeInsets.all(4.0),
// child: Material(
// color: Colors.transparent,
// borderRadius: BorderRadius.circular(30.0),
// child: MaterialButton(
// onPressed: () {},
// minWidth: 100.0,
// height: 30.0,
// child: Text(
// "View Product",
// ),
// ),
// ),
// ),
// ),
