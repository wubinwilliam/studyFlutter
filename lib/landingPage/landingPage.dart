import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding:EdgeInsets.all(10),
        color: Colors.teal[900],
        child:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: this._onBtnJumpMainPageClickListener(context),
                child: Text('Jump to Main Page'),
              ),
              RaisedButton(
                onPressed: _onBtnJumpFormPageClickListener(context),
                child: Text('Jump to Form Page'),
              ),
              RaisedButton(
                onPressed: _onBtnJumpScrollPageClickListener(context),
                child: Text('Jump to Scroll Page'),
              ),
            ],
          )
        )
      )
    );
  }

  Function _onBtnJumpMainPageClickListener(BuildContext context) {
    return () {
      Navigator.of(context).pushNamed('/mainPage');
    };
  }

  Function _onBtnJumpFormPageClickListener(BuildContext context) {
    return () {
      Navigator.of(context).pushNamed('/formPage');
    };
  }

  Function _onBtnJumpScrollPageClickListener(BuildContext context) {
    return () {
      Navigator.of(context).pushNamed('/scrollPage');
    };
  }
}