
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
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
          children: _obtenerListaItems(context, snapshot.data),
        );
      },
    );
    
    // return ListView(
    //   children: _obtenerListaItems(),
    // );
  }

  List<Widget> _obtenerListaItems(BuildContext  context, List<dynamic> data) {
    final List<Widget> opciones = [];
  

    data.forEach( (opt)  {
        final widgetTemps =  ListTile(
          title:  Text(opt['texto']),
          subtitle: Text("Ruta : ${opt['ruta']}" ),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
          onTap: () {
            
            // final route = MaterialPageRoute(
            //   builder: (context ) => AlertPage()
            // );

            // Navigator.push(context, route);

            Navigator.pushNamed(context,  opt['ruta']);
          },
          );
        opciones..add(widgetTemps)
          ..add(Divider());
    }); 

    return opciones;
  }
}