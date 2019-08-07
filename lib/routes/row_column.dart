import 'package:flutter/material.dart';

class CenterColumnRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("hi"),
          Text("world"),
        ],
      ),
    );
  }
}
