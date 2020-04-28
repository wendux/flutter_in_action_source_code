import 'package:flutter/material.dart';

class RetrieveStateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              //ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
              ScaffoldState _state = Scaffold.of(context);
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}
