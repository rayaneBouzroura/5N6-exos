import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('example scroll chelou'),
      ),
      body: Container(
        color: Colors.black12,
        //height: 500.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              width: 170.0,
              height: 120,
              color: Colors.red,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 170.0,
              height: 120,
              color: Colors.blue,
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 160.0,
                    color: Colors.red,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 160.0,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 160.0,
                    color: Colors.green,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 160.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 160.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 160.0,
              height: 150,
              color: Colors.yellow,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 20.0,
              height: 150,
              color: Colors.orange,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 20.0,
              height: 150,
              color: Colors.green,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}