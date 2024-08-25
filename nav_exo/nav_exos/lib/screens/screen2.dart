
import 'package:flutter/material.dart';
//TWO PAGES USING ROUTING 
class Screen2 extends StatefulWidget {  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  //text controller
  final _textController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      //TEXT + BTN
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Entrez une chaine de characters")
              ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed:(){
                 Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context)=>ScreenB(data:_textController.text)));
                 },
               child: Text("go to ecran 2"),
               )
              
          ]
          ),
        )
    );
  }}



  class ScreenB extends StatelessWidget {
  final String data;

  //construct w data
  ScreenB({required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecran B"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("contenu de la valeur recu:"),
            SizedBox(height: 10),
            Text(data,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ElevatedButton(
              child: Text("back to screen1"),
              onPressed: (){
              Navigator.pop(context);
              },
             
             ),
          ],
        ),
      ),
    );
  }

  }
