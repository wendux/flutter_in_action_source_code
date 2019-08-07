import 'package:flutter/material.dart';

class ButtonRoute extends StatefulWidget {
  @override
  _ButtonRouteState createState() => _ButtonRouteState();
}

class _ButtonRouteState extends State<ButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        OutlineButton(
          child: Text("normal"),
          onPressed: () => {},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () => {},
        ),
        RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: _onPressed,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: _onPressed,
        ),
        FlatButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: _onPressed,
        ),
      ],
    );
  }

  void _onPressed() {
    print("button pressed");
  }
}
