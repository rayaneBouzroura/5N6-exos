import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('page drapeau'),
      ),
      body: Center(
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.white,)),
              Expanded(child: Container(color: Colors.red,)),
              Expanded(child: Container(color: Colors.green,)),
            ],
          )),
    );
  }
}
