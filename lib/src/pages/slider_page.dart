import 'package:flutter/material.dart';

class PaginaSlider extends StatefulWidget {
  @override
  _PaginaSliderState createState() => _PaginaSliderState();
}

class _PaginaSliderState extends State<PaginaSlider> {
  var _valorSlaider = 10.0;

  var _bloquearCheck = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pagina sliders'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                //Text('Pagina slidersdffffff'),
                _crearSlider(),
                _crearCheckBox(),
                _crearSwitch(),
                Expanded(child: _crearImagen()),
              ],
            ),
            color: Colors.white54),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 10,
      value: _valorSlaider,
      min: 0.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (v) {
              setState(() {
                //if (!_bloquearCheck) {
                _valorSlaider = v;
                print(v);
                //}
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRZAVa1kQSUmbk1rlB6vhFxeoS_pjM8zbk74O0hycDU31Epc6CK&usqp=CAU'),
      fit: BoxFit.contain,
      width: _valorSlaider,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (bool newValue) {
          setState(() {
            print(newValue);
            _bloquearCheck = newValue;
          });
        });
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (bool newValue) {
    //       setState(() {
    //         print(newValue);
    //         _bloquearCheck = newValue;
    //       });
    //     });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (bool newValue) {
          setState(() {
            _bloquearCheck = newValue;
          });
        });
  }
}
