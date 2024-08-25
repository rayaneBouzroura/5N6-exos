import 'package:exo_layout/Page5.dart';
import 'package:exo_layout/page1.dart';
import 'package:exo_layout/page2.dart';
import 'package:exo_layout/page3.dart';
import 'package:exo_layout/page4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("exo layout"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: Text('Les exos',style: TextStyle(color: Colors.white,fontSize: 24),            
                ),
              ),
              ListTile(
                title: Text('page drapeau'),
                onTap: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => Page1())
                     );
                } 
                ),
              ListTile(
                title: Text('page contrainte'),
                onTap: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => Page2())
                     );
                } 
                 ), 
              ListTile(
                title: Text('page pas si simple'),
                onTap: () {
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => Page3())
                     );
                } 
                 ),
            ListTile(
                title: Text('page example prof 1'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page4())
                  );
                }
            ),
            ListTile(
                title: Text('page example prof 2 scroll chelou'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page5())
                  );
                }
            ),
          ],
        ),
      ),
      body: Center(child: Text('choisi une page')),
    );
  }
  
  }


