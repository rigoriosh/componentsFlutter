import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class WHomePageTemp extends StatelessWidget {
  
  final opciones = ["Uno", "Dos", "tres", 'cuatro', "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componente Temp"),
      ),
      body: ListView(
        children: _crearItemsOtraForma(),
      ),
    );
  }

  // List<Widget> _crearItems() {

  //   List<Widget> lista = new List<Widget>();

  //   for (var opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );
  //     lista..add(tempWidget)
  //           ..add(Divider(height: 0.0,endIndent: 5.0,thickness: 5.0,
  //             color: Color(0xffaaccee),));
  //   }


  //   return lista;
  // }

  List<Widget> _crearItemsOtraForma() {
    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('sub'+ item),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.access_alarm),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();
    
  }
}
