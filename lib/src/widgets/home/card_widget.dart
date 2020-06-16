import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resto/src/models/resto_model.dart';

class CardWidget extends StatefulWidget {
  final List<Resto> restos;

  CardWidget({@required this.restos});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: widget.restos.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detalle',
                      arguments: widget.restos[index]);
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
                                    width: 1200,
                                    height: 180.0,
                                    image: NetworkImage(
                                        widget.restos[index].getCoverImg()),
                                    // AssetImage('assets/image/imagen1.jpg'),
                                    placeholder:
                                        AssetImage('assets/image/no-image.png'),
                                    // height: 180.0,
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
                                          widget.restos[index].name,
                                          style: GoogleFonts.karla(
                                            textStyle: TextStyle(
                                              fontSize: 35.0,
                                              color: Colors.white,
                                              //fontWeight: FontWeight.bold,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 2.0,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          color: Colors.grey.withOpacity(0.5),
                                          child: Text(
                                            widget.restos[index]
                                                .getDecodeUtf8(),
                                            // restos[index].description,
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
                          widget.restos[index].getLatMeter(3700000, 0.6626),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                          // style: GoogleFonts.sourceSansPro(
                          //     textStyle: TextStyle(fontSize: 18.0),
                          //     fontSize: 21),
                        ),
                        Spacer(),
                        Text(
                          widget.restos[index].getValorizar(),
                          overflow: TextOverflow.ellipsis,

                          // style: GoogleFonts.sourceSansPro(
                          //     textStyle: TextStyle(fontSize: 18.0),
                          //     fontSize: 21),
                        ),
                        Icon(
                          Icons.star,
                          size: 20.0,
                          color: Colors.red,
                        )
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
