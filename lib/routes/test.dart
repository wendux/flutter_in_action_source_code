import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestRoute extends StatefulWidget {
  @override
  _TestRouteState createState() => _TestRouteState();
}

class _TestRouteState extends State<TestRoute> {
  BuildContext ctx;
  static GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(title:Text("商品列表")),
      Expanded(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        }),
      ),
    ]);
  }

  @override
  void didUpdateWidget(TestRoute oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
}

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<BuildContext> ctx = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text("$index"));
    });
  }

  @override
  void didUpdateWidget(Test oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget test");
  }
}
