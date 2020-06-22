import 'dart:math';

import 'package:flutter/material.dart';

class ContenedorAnimado extends StatefulWidget {
  @override
  _ContenedorAnimadoState createState() => _ContenedorAnimadoState();
}

class _ContenedorAnimadoState extends State<ContenedorAnimado> {
  get child => null;

  double _with = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  //get _color => Colors.pink;

  //double _height = 50.0;

  //BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenedor Animado'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _with,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      _with = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
