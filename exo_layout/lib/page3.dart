import 'dart:ffi';

import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('page complex'),
        ),
        body : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //sized box afin que le height soit de 300 partout since i cant make a
            SizedBox(
                width: double.infinity,height: 300,child: Container(width: double.infinity,color: Colors.red,)
            ),
            Container(child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                child: Text('Bouton d\'en bas'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder()),
                ),
            )
            )

          ],
        )
    );
  }
}
