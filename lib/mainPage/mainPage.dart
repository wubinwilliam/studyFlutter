import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body:CustomScrollView(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: 400,
                    height: 300,
                    child: Text('fuck')
                  ),
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}