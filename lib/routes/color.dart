import 'package:flutter/material.dart';

class ColorRoute extends StatefulWidget {
  @override
  _ColorRouteState createState() => _ColorRouteState();
}

class _ColorRouteState extends State<ColorRoute> {
  static Color _white = Color(0xFFFFFFFF);
  static MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: _white,
      100: _white,
      200: _white,
      300: _white,
      350: _white,
      400: _white,
      500: _white,
      600: _white,
      700: _white,
      800: _white,
      850: _white,
      900: _white,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue, //使用白色主题
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("颜色"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NavBar(color: Colors.blue, title: "标题"),
            ),
            NavBar(color: Colors.white, title: "标题"),
          ]
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
