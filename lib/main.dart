import 'package:flutter/material.dart';
import 'package:lista_cursos/screens/linguagem_detalhes_screen.dart';
import 'package:lista_cursos/screens/linguagem_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Linguagem App',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/linguagem_screen': (context) => LinguagensScreen(),
        '/linguagem_detalhes': (context) => LinguagensDetalhesScreen(),
      },
    );
  }
}

/*
theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
*/
