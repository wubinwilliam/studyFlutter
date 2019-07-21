import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  ScrollPage({Key key}) : super(key: key);

  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // color: Colors.white,
              width: 400,
              // height: 700,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  children: <Widget>[
                    Container(color: Colors.red, height: 300,),
                    Container(color: Colors.yellow, height: 300,),
                    Container(color: Colors.green, height: 300,),
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Container(
                width: 400,
                height: 400,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AppBar(
                      title: Text('Back'),
                    ),
                    Text('Try scroll'),
                  ],
                )
              ),
            ),
          ],
        )
      )
    );
  }
}