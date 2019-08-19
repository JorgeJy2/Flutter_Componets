import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPager extends StatefulWidget {
  @override
  _AnimatedContainerPagerState createState() => _AnimatedContainerPagerState();
}

class _AnimatedContainerPagerState extends State<AnimatedContainerPager> {
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration( seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(300).toDouble();
            _heigth = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                random.nextInt(255), 1);
            _borderRadius = BorderRadius.circular( random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
