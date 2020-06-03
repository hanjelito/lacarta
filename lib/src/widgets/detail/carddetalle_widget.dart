import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resto/src/providers/resto.dart';

class CarddetalleWidget extends StatelessWidget {
  final List<Restos> datos = [
    Restos(1, "http", "http://ialab.io", "La Caña", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 700, 1, 2.4),
    Restos(2, "http", "http://ialab.io", "Salero", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 20, 2, 20.2),
    Restos(3, "http", "http://ialab.io", "Burger King", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 45, 3, 6.7),
    Restos(4, "http", "http://ialab.io", "Malasaña", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 70, 4, 3.7),
    Restos(5, "http", "http://ialab.io", "Ratejo", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 800, 5, 3.2),

    // "Madrid", "Las Talbas", "Fuencarral", "Coslada"
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Card(
            elevation: 2.0,
            margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 6.0),
            child: Container(
              child: _mycards(context, index),
            ),
          );
        },
        childCount: datos.length,
      ),
    );
  }
  Widget _mycards(BuildContext context, int index){
  return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.black))),
          child: Icon(MdiIcons.beer),
        ),
        title: Text(
          datos[index].name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Text(datos[index].description)
          ],
        ),
        trailing:
            // Icon(Icons.keyboard_arrow_right, size: 30.0),
            Text((datos[index].costo).toString()+"EUR"),
    );
  }
}
