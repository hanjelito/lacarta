import 'package:flutter/material.dart';
import 'package:resto/src/providers/resto.dart';


class CardWidget extends StatelessWidget {

  final List<Restos> datos = [
    Restos(1, "http", "http://ialab.io", "mi resto1", "el mejor de todos",  "asas/kjs.jpg", "asas/kjs.jpg", 700, 1),
    Restos(2, "http", "http://ialab.io", "mi resto2", "el mejor de todos",  "asas/kjs.jpg", "asas/kjs.jpg", 20, 2),
    Restos(3, "http", "http://ialab.io", "mi resto3", "el mejor de todos",  "asas/kjs.jpg", "asas/kjs.jpg", 45, 3),
    Restos(4, "http", "http://ialab.io", "mi resto4", "el mejor de todos",  "asas/kjs.jpg", "asas/kjs.jpg", 70, 4),
    Restos(5, "http", "http://ialab.io", "mi resto5", "el mejor de todos",  "asas/kjs.jpg", "asas/kjs.jpg", 800, 5),
    
    // "Madrid", "Las Talbas", "Fuencarral", "Coslada"
    ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemCount: datos.length,
        itemBuilder: (BuildContext context, int index) => _myCards(context, index),
    );
  }
  Widget _myCards(BuildContext context , int index) {
    final resto = datos[index];
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'detalle');
      },
      child: Card(
        elevation: 8.0,
        child: Padding(    
          padding: EdgeInsets.all(0.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
                children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 75.0),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: new FadeInImage(
                          image: AssetImage('assets/image/tapa.jpg'),
                          placeholder: AssetImage('assets/image/no-image.png'),
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 150.0, bottom: 0.0, left: 4.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(height: 40.0),
                          Text(resto.name,
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0, bottom: 2.0, left: 4.0, right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text((resto.distancia).toString()+"m"),
                          Spacer(),
                          Icon(Icons.favorite,
                          color: Colors.red,),
                        ],
                      ),
                    ),
                  ],
                ),
              ]
            ), 
          ),
        ),
      ),
    );
  }
}