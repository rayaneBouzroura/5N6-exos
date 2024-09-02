import 'package:flutter/foundation.dart';
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
      home: const MyHomePage(title: 'List lambda'),
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
  static List<String> noms = [
    'dude',
    'dudette',
    'duderino',
    'dunderdude',
    'dudududededededede'
  ];
  //copy original list
  List<String> clonedNoms = List.from(noms);
  //clonedNoms.shuffle();

  //static List<String> noms  = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clonedNoms.shuffle();
    print(clonedNoms);
    print(listEquals(clonedNoms, noms));
  }

  void _goUp(int index) {
    //permutation algo (vive le premier cour de prog)
    //sinn ye
    if (index > 0) {
      setState(() {
        String temp = clonedNoms[index];
        clonedNoms[index] = clonedNoms[index - 1];
        clonedNoms[index - 1] = temp;
      });
    }
    listOrderCheck();
  }

  void _goDown(int index) {
    if (index < clonedNoms.length - 1) {
      setState(() {
        String temp = clonedNoms[index];
        clonedNoms[index] = clonedNoms[index + 1];
        clonedNoms[index + 1] = temp;
      });
    }
    listOrderCheck();
  }

  void listOrderCheck() {
    if (listEquals(clonedNoms, noms)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
                          content: Text("GG !"),
                          action: SnackBarAction(label: 'retry??', onPressed: () {  setState(() {
                              clonedNoms.shuffle();
                            });
                          },),
                          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: clonedNoms
              .map((nom) => ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: () {
                        _goUp(clonedNoms.indexOf((nom)));
                      },
                    ),
                    title: Center(child: Text(nom)),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: () {
                        _goDown(clonedNoms.indexOf(nom));
                      },
                    ),
                  ))
              .toList()),
      //body: Text("test"),
    );
  }
}
