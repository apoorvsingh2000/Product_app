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
                bottom: MediaQuery.of(context).size.height * 0.075,
                left: MediaQuery.of(context).size.width * 0.35,
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Link"),
                  color: Colors.transparent,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
