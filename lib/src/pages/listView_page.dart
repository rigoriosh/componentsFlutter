import 'dart:async';

import 'package:flutter/material.dart';

class PaginaListView extends StatefulWidget {
  @override
  _PaginaListViewState createState() => _PaginaListViewState();
}

class _PaginaListViewState extends State<PaginaListView> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();

  bool _isLoading = false;

  var _ultimoItem = 0;

  @override
  void initState() {
    super.initState();
    print(44444);
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
            print(44444);
        //_agregar10();
        fetchData(); //traer informacion
      }
      //print('!Scroliliando');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); //limpiar memoria
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina list view'),
        ),
        body: Stack(
          children: <Widget>[
            _crearListas(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearListas() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('imagenes/original.gif'),
              // image: NetworkImage('https://i.picsum.photos/id/$index/800/600.jpg')
              image: NetworkImage('https://picsum.photos/800/600/?image=$imagen')
              );
        },
      ),
      onRefresh: obtenerPagina1,
    );
  }

  Future<Null> obtenerPagina1() async {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      _listaNumeros.clear();
      _ultimoItem++;
      print(333333);
      _agregar10();
    });
    return Future.delayed(duracion);
  }

  void _agregar10() {
    setState(() {
      print(22222);
      for (var i = 1; i < 10; i++) {
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
      }
    });
  }

  Future<Null> fetchData() async {
    print('11111111');
    _isLoading = true;
    setState(() {});
    final duracion = new Duration(seconds: 2);
    return new Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          Divider(),
          SizedBox(height: 20.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
