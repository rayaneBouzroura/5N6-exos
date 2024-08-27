
import 'package:flutter/material.dart';
import 'pleindecontainer_page.dart';
import 'passisimple_page.dart';
import 'placeholder_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exo_layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PleindecontainerPage(), PassisimplePage(), PlaceholderPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('exo_layout')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            
            ListTile(
              title: Text('Pleindecontainer'),
              onTap: () {
                setState(() { _selectedIndex = 0; });
                Navigator.pop(context);
              },
            ), 
            ListTile(
              title: Text('Passisimple'),
              onTap: () {
                setState(() { _selectedIndex = 1; });
                Navigator.pop(context);
              },
            ), 
            ListTile(
              title: Text('Placeholder'),
              onTap: () {
                setState(() { _selectedIndex = 2; });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
