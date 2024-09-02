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
      title: 'Flutter Demo',
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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //recursive fib method

  int fibonnaci(int n) {
    if (n <= 1)
      return n;
    else
      return fibonnaci(n - 1) + fibonnaci(n - 2);
  }


  

  Color randomColor(){
    // multiply by 0xFFFFFF to get values qu on peut mettre in a 24bit color
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
  Color randomColorv2() {
  return Color.fromRGBO(
    Random().nextInt(256),
    128,
    128,
    1.0,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Jolie liste lambda")),
        body: ListView(
          children: List.generate(20, (n) =>
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        title: Center(child: Text("${fibonnaci(n)}", style: const TextStyle(fontSize: 20),)),
                        tileColor: randomColorv2(),
                        shape:  RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.cyanAccent,
                            ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      
                        ),
                    )
                          ),
        ));
  }
}
