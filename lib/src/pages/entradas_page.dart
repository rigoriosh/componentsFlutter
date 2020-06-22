import 'package:flutter/material.dart';

class PaginaDeEntradas extends StatefulWidget {
  @override
  _PaginaDeEntradasState createState() => _PaginaDeEntradasState();
}

class _PaginaDeEntradasState extends State<PaginaDeEntradas> {
  String _nombre = '';
  String _correo = '';
  String _password;
  String _fecha;
  TextEditingController _inputFielDateCotroller = new TextEditingController();
  List<String> _poderes = [
    'Selecciona poder',
    'Volar',
    'Rayos X',
    'Super aliento',
    'super fuerza',
    'super rapido'
  ];
  String _opcionSeleccionada = 'Selecciona poder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Entradas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearContrasenia(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInputs() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre persona',
        labelText: 'nombre',
        helperText: 'solo el nombre',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (String data) {
        setState(() {
          _nombre = data;
          print(_nombre);
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text(
        'Name is: $_nombre',
        style: TextStyle(color: Colors.amber),
      ),
      subtitle: Text('emai: $_correo'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Ingresa un email',
          labelText: 'email',
          helperText: 'email Address',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        onChanged: (String data) => setState(() {
              _correo = data;
              print(_correo);
            }));
  }

  Widget _crearContrasenia() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Ingresa contraseña',
          labelText: 'contraseña',
          helperText: 'contraseña',
          suffixIcon: Icon(Icons.pages),
          icon: Icon(Icons.account_balance_wallet),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        onChanged: (String data) => setState(() {
              _password = data;
              print(_password);
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFielDateCotroller,
      enableInteractiveSelection: false, //no deja copear
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        labelText: 'fecha de nacimiento',
        helperText: 'fecha de nacimiento',
        suffixIcon: Icon(Icons.data_usage),
        icon: Icon(Icons.date_range),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFielDateCotroller.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDownn() {
    List<DropdownMenuItem<String>> myList = new List();
    _poderes.forEach((poder) {
      myList.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return myList;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesDropDownn(),
              onChanged: (option) {
                setState(() {
                  _opcionSeleccionada = option;
                  print(option);
                });
              }),
        ),
      ],
    );
  }
}
