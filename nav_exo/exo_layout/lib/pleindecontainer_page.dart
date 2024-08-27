
import 'package:flutter/material.dart';

class PleindecontainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Container(color: Colors.green,),flex: 1),
        Expanded(child: Container(color: Colors.white,),flex: 1),
        Expanded(child: Container(color: Colors.red),flex: 1,),
        ]
    );
  }
}
