
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  
  final options = ['One','Two', 'Three','Four','Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Componentes temp')) ,
      body: ListView(
        children:_crearListSmall(),
      ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> listWidget = new List<Widget>();

    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      listWidget..add(tempWidget)
                ..add(Divider());
    }
    return listWidget;  
  }

  List<Widget> _crearListSmall(){
    return  options.map((String opt) => Column(
      children: <Widget>[
        ListTile( 
          title: Text(opt +'!'),
          subtitle: Text('Subtitle.. any thing.'),
          leading: Icon(Icons.account_circle),
          trailing: Icon(Icons.keyboard_arrow_right),  
          onTap: () {
            
          },
        ),
        Divider()
      ],
    )).toList();
  }

}