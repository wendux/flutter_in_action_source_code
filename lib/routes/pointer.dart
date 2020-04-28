import 'package:flutter/material.dart';

class PointerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("down0"),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
            child: Center(child: Text("左上角200*100范围内非文本区域点击")),
          ),
          onPointerDown: (event) => print("down1"),
          //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          //behavior: HitTestBehavior.opaque, // 放开此行后只会打印"down1"
        )
      ],
    );
  }
}
