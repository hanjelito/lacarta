import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Scaffold(
          //backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: <Widget>[
              _crearAppbar(),
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: 0.0,
                ),
                _descripcion(),
              ])),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _crearAppbar() {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('La Caña',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
        background: FadeInImage(
          image: AssetImage('assets/image/page1.jpg'),
          placeholder: AssetImage('assets/image/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _descripcion() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'La caña',
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Tu bar de birras',
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  ' Precio medio:  €',
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                //padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: const Center(child: Text('Entry A')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
