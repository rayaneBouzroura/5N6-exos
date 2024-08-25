
import 'package:flutter/material.dart';
import 'ordrealpha_page.dart'; import 'jolielistlambda_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exo_list',
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
    OrdrealphaPage(), JolielistlambdaPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('exo_list')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            
            ListTile(
              title: Text('Ordrealpha'),
              onTap: () {
                setState(() { _selectedIndex = 0; });
                Navigator.pop(context);
              },
            ), 
            ListTile(
              title: Text('Jolielistlambda'),
              onTap: () {
                setState(() { _selectedIndex = 1; });
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
