import 'package:flutter/material.dart';

class detailpage extends StatelessWidget {
  const detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        child: Hero(
          tag: 'background',
          child: Image.asset('assets/images/MVPM4848.JPG'),
        ),
      ),
    );
  }
}
