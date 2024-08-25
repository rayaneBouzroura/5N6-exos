import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tape le putain de lapin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;
  //cree state widget to keep track of les flip et les flaps
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //generer index lapin random
  int _indexLapin = 0;
  

  //keep track des W/L
  int _flops = 0;//gg
  int _flaps = 0;// :<

  //tracker pour les W/L
  int attempts = 0;
  int wins = 0;



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tape l'esti dlapin"),
    ),
    //to center the btns
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('flaps = $_flaps'),
          Text('flops = $_flops'),]

        
      ),
    )
    );
  }
}
