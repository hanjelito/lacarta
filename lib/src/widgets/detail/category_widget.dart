import 'package:flutter/material.dart';
import 'package:resto/src/providers/category.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> datos = [
    Category(1, "Comida", "image.jpg"),
    Category(2, "Bebida", "image.jpg"),
    Category(3, "Tapas", "image.jpg"),
    Category(4, "Entradas", "image.jpg"),
    Category(5, "Coteles", "image.jpg"),

    // "Madrid", "Las Talbas", "Fuencarral", "Coslada"
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: datos.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                height: 50.0,
                width: 100.0,
                child: GestureDetector(
                  onTap: () {
                    print('Funciona');
                  },
                  child: Card(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        datos[index].name,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
