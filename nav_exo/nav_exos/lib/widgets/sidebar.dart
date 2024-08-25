import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  Sidebar({super.key, required this.selectedIndex, required this.onItemSelected});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: ListView(
        children: [
          //header
          DrawerHeader(
            child: Text('Sidebar'),
            decoration: BoxDecoration(color: Colors.blue),
            ),
          //list tiles for screen names
          ListTile(
            //TODO : change name selon exo
            title: Text('Screen 1'),
            //indique si ont a select la list view via bool , here we check if sel ind is 0 .1 . 2 
            selected: selectedIndex ==0,
            //pass a function merde
            onTap:  () =>onItemSelected(0),
          ),
          ListTile(
            //TODO : change name selon exo
            title: Text('Screen 2'),
            //indique si ont a select la list view via bool , here we check if sel ind is 0 .1 . 2 
            selected: selectedIndex ==1,
            onTap: () =>onItemSelected(1),
          ),
          ListTile(
            //TODO : change name selon exo
            title: Text('Screen 3'),
            //indique si ont a select la list view via bool , here we check if sel ind is 0 .1 . 2 
            selected: selectedIndex ==2,
            onTap: () =>onItemSelected(2),
          ),
        ],
      ),
    );
  }

}