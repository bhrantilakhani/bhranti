import 'package:flutter/material.dart';

class tweenanimation extends StatefulWidget {
  const tweenanimation({super.key});

  @override
  State<tweenanimation> createState() => _tweenanimationState();
}

class _tweenanimationState extends State<tweenanimation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 200.0, end: 20.0).animate(animationController);

    animationController.addListener(() {
      print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.purple,
        ),
      ),
    );
  }
}
