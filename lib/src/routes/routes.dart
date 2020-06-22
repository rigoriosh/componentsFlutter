import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/entradas_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/listView_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'rutaContAnimado': (BuildContext context) => ContenedorAnimado(),
    'rutaInputs': (BuildContext context) => PaginaDeEntradas(),
    'rutaPageSlider': (BuildContext context) => PaginaSlider(),
    'rutaPageListView': (BuildContext context) => PaginaListView(),
  };
}
