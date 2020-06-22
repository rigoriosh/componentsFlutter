import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('data'),
            subtitle: Text(
                'Nulla porttitor accumsan tincidunt. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada.'),
          ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final tarjeta =  Container(
      //clipBehavior: Clip.antiAlias,
      
      child: Column(children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Neckertal_20150527-6384.jpg/1920px-Neckertal_20150527-6384.jpg'),
          placeholder: AssetImage('imagenes/original.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300.0,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Imagen'),
        )
      ]),
    );
    return Container(
      child: ClipRRect(
        child: tarjeta,
        borderRadius: BorderRadius.circular(20.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
            ),
            
        ]
      ),
    );
  }
}
