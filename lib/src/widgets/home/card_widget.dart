import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resto/src/providers/resto.dart';

class CardWidget extends StatelessWidget {
  final List<Restos> datos = [
    Restos(1, "http", "http://ialab.io", "La Caña", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 700, 1),
    Restos(2, "http", "http://ialab.io", "Salero", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 20, 2),
    Restos(3, "http", "http://ialab.io", "Burger King", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 45, 3),
    Restos(4, "http", "http://ialab.io", "Malasaña", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 70, 4),
    Restos(5, "http", "http://ialab.io", "Ratejo", "el mejor de todos",
        "asas/kjs.jpg", "asas/kjs.jpg", 800, 5),

    // "Madrid", "Las Talbas", "Fuencarral", "Coslada"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datos.length,
      itemBuilder: (BuildContext context, int index) =>
          _myCards(context, index),
    );
  }

  Widget _myCards(BuildContext context, int index) {
    final resto = datos[index];
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'detalle');
          },
          child: Card(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.0),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: new FadeInImage(
                              image: AssetImage('assets/image/tapa.jpg'),
                              placeholder:
                                  AssetImage('assets/image/no-image.png'),
                              height: 180.0,
                              //width: 600,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 39, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      resto.name,
                                      style: GoogleFonts.pacifico(
                                        textStyle: TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 3.0,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      color: Colors.grey.withOpacity(0.5),
                                      child: Text(
                                        resto.name,
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Text(
                    'Madrid (${resto.distancia}m)',
                    style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(fontSize: 18.0), fontSize: 21),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
