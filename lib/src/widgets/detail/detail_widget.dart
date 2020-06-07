import 'package:flutter/material.dart';


class DetailWidget extends StatelessWidget {
  // final List<Restos> datos = [
  //   Restos(1, "http", "http://ialab.io", "La Caña", "el mejor de todos",
  //       "asas/kjs.jpg", "asas/kjs.jpg", 700, 1),
  //   Restos(2, "http", "http://ialab.io", "Salero", "el mejor de todos",
  //       "asas/kjs.jpg", "asas/kjs.jpg", 20, 2),
  //   Restos(3, "http", "http://ialab.io", "Burger King", "el mejor de todos",
  //       "asas/kjs.jpg", "asas/kjs.jpg", 45, 3),
  //   Restos(4, "http", "http://ialab.io", "Malasaña", "el mejor de todos",
  //       "asas/kjs.jpg", "asas/kjs.jpg", 70, 4),
  //   Restos(5, "http", "http://ialab.io", "Ratejo", "el mejor de todos",
  //       "asas/kjs.jpg", "asas/kjs.jpg", 800, 5),

  //   // "Madrid", "Las Talbas", "Fuencarral", "Coslada"
  // ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            // height: 50,
            // alignment: Alignment.center,
            // color: Colors.orange[100 * (index % 9)],
            // child: Text(datos[index].name),
          );
        },
        
      ),
    );
  }
}
