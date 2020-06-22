import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
// import 'package:componentes/src/provider/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Text("leading"),
        title: Text('Home Page'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listarMisWwidgets(snapshot.data, context),
        );
      },
    );

    /* print(menuProvider);
      menuProvider.cargarData().then((opciones){
      print(1111);
      print(opciones);
      print(22222);
    }); */
  }

  List<Widget> _listarMisWwidgets(List<dynamic> data, context) {
    final List<Widget> misWidgets = [];

    data.forEach((d) {
      var w = ListTile(
        title: Text(d['ruta']),
        leading: getIcon(d['icon']),
        subtitle: Text(d['texto']),
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.red,
        ),
        dense: true,
        onTap: () {
          //final route = MaterialPageRoute(builder: (context) =>  AlertPage());
          //Navigator.push(context, route);

          Navigator.pushNamed(context, d['ruta']);
        },
      );
      misWidgets..add(w)..add(Divider());
    });

    return misWidgets;
  }
}
