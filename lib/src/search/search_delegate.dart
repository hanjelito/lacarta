import 'package:flutter/material.dart';
import 'package:resto/src/models/resto_model.dart';
import 'package:resto/src/providers/restos_provider.dart';

class DataSearch extends SearchDelegate{

  String seleccion = '';

  final restosProvier = RestosProvider();

  final restos = [
    'restobar Las rosas',
    'gola gola',
    'La chalota restaurant',
    'Mi hermano y yo',
    'Asador de Bulnes',
    'Gastrobar Origen',
    'Maduk',
    'Cervezas la Virgen',
    'La Manuela',

  ];
  final restosRecientes = [
    'wapi Grill',
    'Taberna de moe'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      // las acciones de nuestro appbar
      return [
        IconButton(
          icon:  Icon( Icons.clear),
          onPressed: (){
            query = '';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del appbar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Crea los resultados que mostraremos
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color:Colors.blueAccent,
          child: Text(seleccion),
        )
      );
    }
  
    @override
 
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: restosProvier.buscarResto(query),
      builder: (BuildContext context, AsyncSnapshot<List<Resto>> snapshot) {

        if ( snapshot.hasData){

          final restos = snapshot.data;

          return ListView(
            children: restos.map((resto){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(resto.getCoverImg()),
                  placeholder: AssetImage('assets/image/no-image.png'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(resto.name),
                subtitle: Text(resto.description),
                onTap: (){
                  close(context, null);
                  Navigator.pushNamed(context, 'detalle',
                      arguments: resto);
                },
              );
            }).toList(),
          );
        } else {
          return  Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }



}