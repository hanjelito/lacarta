import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  final List<dynamic> restos;

  CardWidget({@required this.restos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: restos.length,
        itemBuilder: (BuildContext context, int index) {
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
                                    image:
                                        AssetImage('assets/image/imagen1.jpg'),
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
                                          restos[index].name,
                                          style: GoogleFonts.karla(
                                            textStyle: TextStyle(
                                              fontSize: 45.0,
                                              color: Colors.white,
                                              //fontWeight: FontWeight.bold,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Colors.grey.withOpacity(0.5),
                                          child: Text(
                                            restos[index].description,
                                            style: GoogleFonts.sourceSansPro(
                                              textStyle: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                          'Madrid (10m)',
                          style: GoogleFonts.sourceSansPro(
                              textStyle: TextStyle(fontSize: 18.0),
                              fontSize: 21),
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
        });
  }
}
