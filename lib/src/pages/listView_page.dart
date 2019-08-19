
import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _numbers = new List();
  int _ultimoItem = 0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    
    _agregar10();

    _scrollController.addListener(() {
        if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
         // _agregar10();
         fetchData();
        }
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas'),),
      body: Stack(
        children: <Widget>[
            _crearLista(),
            _createLoading()
        ],
      ) 
      
     
    );
  }

 Widget  _crearLista() {
   return RefreshIndicator(
    onRefresh: obtenerPagina1,
    child: ListView.builder(
     controller: _scrollController,
     itemCount: _numbers.length,
     itemBuilder: (BuildContext context, int index) {
      final numberImge = _numbers[index];
      return FadeInImage(
        image: NetworkImage('https://picsum.photos/id/$numberImge/500/300'),
        placeholder: AssetImage('assets/jar-loading.gif'),
      );
     },
   ),
   );
 }

 Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _numbers.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
 }

 void _agregar10(){
   for(var i =1; i<10; i++){
     _ultimoItem++;
     _numbers.add(_ultimoItem);
     setState(() {
       
     });
   }
 }

  Future<Null> fetchData() async{
      _isLoading = true;
      setState(() {
        
      });
      final duration = Duration(seconds: 2);
      new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(microseconds: 250)
    );
    _agregar10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

 Widget _createLoading() {
   if( _isLoading) {

     return Column(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             CircularProgressIndicator()
          ],
        ),
        SizedBox(height: 15.0,)
       ],
     );
    
   }else {
     return Container();
   }
 }
}