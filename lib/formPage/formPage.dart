import 'package:flutter/material.dart';
// import 'package:hello_world/formPage/formStructure.dart';

class _InputValue {
  String inputValue1;
  String inputValue2;

  _InputValue(this.inputValue1, this.inputValue2);
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey _showBoxKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  AnimationController _controller;
  Animation<Offset> _offset;

  _InputValue _inputValue = _InputValue("", "");

  bool _bShowFlag = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _offset = Tween<Offset>(begin: Offset.zero, end: Offset(-0.5, 0)).animate(_controller)
      ..addStatusListener(_onStatusChanged);
    _focusNode.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusNodeListener);
    _offset.removeStatusListener(_onStatusChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: RaisedButton(
                  onPressed: ()=>{
                    (this._bShowFlag == true && this._controller.status == AnimationStatus.completed) ? this.setState((){this._bShowFlag = false; this._controller.reverse();}) : null
                  },
                  child: Text('click'),
                )
              ),
            ),
            SlideTransition(
              position: _offset,
              child: Container(
                key: _showBoxKey,
                height: 450,
                width: 350,
                color: Colors.grey[300],
                padding: EdgeInsets.all(20),
                child: _buildForm(),
              )
            ),
            _buildExtraBox(context),
          ],
        )
      )
    );
  }

  Widget _buildForm() {
    // return FormStructure(mark: this._mark, onPressed: onPressed,);
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: Padding(padding: EdgeInsets.symmetric(vertical: 5),child:_buildSelectBox(context))),
            Expanded(flex: 1, child: Padding(padding: EdgeInsets.symmetric(vertical: 5),child:_buildTextField(context))),
            // Expanded(flex: 1, child: ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5),child:_buildSubmitButton(context))
          ],
        )
      )
    );
  }

  Widget _buildSelectBox(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, 
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('My Value', style: TextStyle(color: Colors.black)),
                    Text('fuck', style: TextStyle(color: Colors.black)),
                  ],
                )
              ),
            
            Container(
              child: Icon(Icons.arrow_forward),
            )
          ],
        )
      )
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Input something.',
        labelStyle: TextStyle(color: Colors.grey)
      ),
      validator: (String v){
        if (v.isEmpty) return 'Please input something';
      },
      focusNode: _focusNode,
      onSaved: (String v){
        _inputValue.inputValue2 = v;
      },
    ));
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ButtonTheme(
      height: 60,
      minWidth: 180,
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        child: Text('Submit', style: TextStyle(color: Colors.white)),
        onPressed: (){
          if(_formKey.currentState.validate()) {
            _formKey.currentState.save();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(_inputValue.inputValue1 + ' || ' + _inputValue.inputValue2),
                );
              }
            );
          }
        }
      ),
    );
  }

  Widget _buildExtraBox(BuildContext contxt) {
    if (_bShowFlag == false) return Container();
    RenderBox renderBox = _showBoxKey.currentContext.findRenderObject();
    Offset pos = renderBox.localToGlobal(Offset.zero);
    return Positioned(
      left: pos.dx + 350 + 10,
      top: pos.dy,
      child: Container(
        height: 450,
        width: 200,
        color: Colors.white,
      )
    );
  }

  Function onPressed() {
    return (){
      // showDialog(context: context, builder: (BuildContext context) {
      //   return AlertDialog(title: Text('FUCK'),);
      // });
      // print('focus status: ' + _focusNode.hasFocus.toString());
      if(_controller.status == AnimationStatus.dismissed) {
        if(_focusNode.hasFocus) {
          // if user hides keyboard by force, it must remove the focus status in order to fix keyboard bug.
          FocusScope.of(context).requestFocus(FocusNode());
        }
        // print('focus status2: ' + _focusNode.hasFocus.toString());
        _controller.forward();
      }
    };
  }

  void _onStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
          // _controller.reverse();
          this.setState((){
            _bShowFlag = true;
          });
        }
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus && _bShowFlag) {
      _focusNode.unfocus();
    }
  }
}