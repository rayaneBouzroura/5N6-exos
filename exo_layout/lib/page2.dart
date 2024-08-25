import 'dart:math';

import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //generate list of random numbers
    final random = Random();
    List<Color> colors = List.generate(
        10,
        //each index populate it w random nums
        (index) => Color.fromRGBO(
            random.nextInt(256), random.nextInt(256), random.nextInt(256), 1));

    //list of 3 random paddings
    List<double> paddings =
        List.generate(3, (index) => random.nextInt(50).toDouble());

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('page contrainte'),
        ),
        body: ListView.builder(
          itemCount: colors.length,
          //return 10 items w diff color
          itemBuilder: ((context, index) {
          return Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(height: 200, color: colors[index]));
        })));
  }
}
