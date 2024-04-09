import 'package:animation/detail_page.dart';
import 'package:flutter/material.dart';

class hero_animatio extends StatefulWidget {
  const hero_animatio({super.key});

  @override
  State<hero_animatio> createState() => _hero_animatioState();
}

class _hero_animatioState extends State<hero_animatio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'background',
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => detailpage()));
            },
            child: Image.asset(
              'assets/images/MVPM4848.JPG',
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
