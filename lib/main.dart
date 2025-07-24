import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _randomNumber =
      0; //variáveis privadas sãi acessíveis apenas dentro do arquivo/biblioteca onde elas são declaradas.
  var _text = '???';
  var _alert = '';
  final List<int> _randomNumberList = [];

  void _generateRandom() {
    setState(() {
      _randomNumber = Random().nextInt(10) + 1;
      _text = _randomNumber.toString();
      if (_randomNumberList.contains(_randomNumber)) {
        _alert = 'Número $_randomNumber já sorteado! ❌';
      } else {
        _alert = '';
        _randomNumberList.add(_randomNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          title: const Text(
            'Número da Sorte 🎲',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hoje é seu dia de sorte!\nClique no botão abaixo e confira!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    _text,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  _alert,
                  style: TextStyle(
                    color: Color(0xff8716d5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _generateRandom,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8716d5),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 20,
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text('SORTE!'),
                  ),
                ),
                Text(
                  _randomNumberList.isEmpty
                      ? ''
                      : 'Números já sorteados: \n${_randomNumberList.toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8716d5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _randomNumberList.clear();
              _text = '???';
              _alert = '';
            });
          },
          backgroundColor: Colors.black87,
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }
}
