import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}

class GrowTransitionRoute extends StatefulWidget {
  @override
  _GrowTransitionRouteState createState() => new _GrowTransitionRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _GrowTransitionRouteState extends State<GrowTransitionRoute>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: Image.asset("imgs/avatar.png"),
      animation: animation,
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}