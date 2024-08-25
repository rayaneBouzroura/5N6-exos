import 'dart:math';
import 'package:flutter/material.dart';

// Roadmap:
// 1. Create a data source for names
// 2. Implement a function to shuffle the list
// 3. Create a ListTile widget for each name with up/down buttons
// 4. Use a ListView.builder for efficient list rendering
// 5. Implement logic to check if the list is in order
// 6. Display a message and reshuffle when the list is in order

class OrdrealphaPage extends StatefulWidget {
  @override
  State<OrdrealphaPage> createState() => _OrdrealphaPageState();
}

class _OrdrealphaPageState extends State<OrdrealphaPage> {
  // TODO 1: Create a list of 5 names as the data source
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];

  @override
  void initState() {
    super.initState();
    // TODO 2: Shuffle the list when the page is initialized
    shuffleList();
  }

  // TODO 3: Implement the shuffleList function
  void shuffleList() {
    setState(() {
      names.shuffle();
    });
  }

  // TODO 4: Implement the checkOrder function
  bool checkOrder() {
    for (int i = 0; i < names.length - 1; i++) {
      if (names[i].compareTo(names[i + 1]) > 0) {
        return false;
      }
    }
    return true;
  }

  // TODO 5: Implement the moveName function
  void moveName(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String item = names.removeAt(oldIndex);
      names.insert(newIndex, item);

      if (checkOrder()) {
        // TODO 6: Show a message when the list is in order
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('List is in order! Reshuffling...')),
        );
        shuffleList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ordre Alpha')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TODO 7: Implement the up button
                IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: index > 0
                      ? () => moveName(index, index - 1) 
                      : null,
                ),
                // TODO 8: Implement the down button
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: index < names.length - 1
                      ? () => moveName(index, index + 1)
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}