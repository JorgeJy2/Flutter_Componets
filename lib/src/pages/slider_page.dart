import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              Divider(),
              _crearCheckBox(),
              _crearSwitch(),
              Expanded(child: _crearImagen()),
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      onChanged: (_blockCheck)
          ? null
          : (valor) {
              setState(() => _valorSlider = valor);
            },
      max: 400.0,
      min: 10.0,
      value: _valorSlider,
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      image: NetworkImage('https://octodex.github.com/images/nyantocat.gif'),
      width: _valorSlider,
      fit: BoxFit.contain,
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
    );
  }

   _crearCheckBox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   activeColor: Colors.red,
    //   onChanged: (value) {
    //     print(value);
    //     setState(() {
    //       _blockCheck = value;
    //     });
    //   },
    // );

    return CheckboxListTile(
      value: _blockCheck,
      title: Text('Bloquear slider'),
      activeColor: Colors.red,
      onChanged: (value) {
        print(value);
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

 Widget _crearSwitch() {
   return SwitchListTile(
      value: _blockCheck,
      title: Text('Bloquear slider'),
      onChanged: (value) {
        print(value);
        setState(() {
          _blockCheck = value;
        });
      },
   );
 }
}
