import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // Variables pour gérer l'état de la page
  String _demoText = "Démo!";
  Color _topColor = Colors.red;
  Color _bottomColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_demoText),
        // AppBar en haut avec le texte "Démo!"
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Zone rouge à gauche (50% de la largeur)
                Expanded(
                  flex: 1,
                  child: Container(color: _topColor),
                ),
                // Colonne de droite
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // Zone blanche en haut à droite
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white,
                          child: Center(child: Text("YO")),
                        ),
                      ),
                      // Zone noire en bas à droite
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bouton bleu en bas
          Container(
            width: double.infinity,
            color: _bottomColor,
            child: ElevatedButton(
              child: Text("Bouton du bas"),
              onPressed: () {
                // Action du bouton à définir
                print("Bouton cliqué !");
              },
            ),
          ),
        ],
      ),
    );
  }
}