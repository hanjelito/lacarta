import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resto/src/widgets/detail/detail_widget.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                child: Container(
                    child: Text(
                  "La caña",
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 40,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 0.0),
                child: Container(
                    child: Text(
                  "Tu bar de birras",
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 20,
                  ),
                )),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 0.0), 
                  child: Container(
                      child: Text(
                    "Precio medio: €",
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
              Center(
                child: Container(
                    child: Text(
                  "Menú",
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 25,  
                  ),
                )),
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                leading: Text(
                  "Tortilla",
                  style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 16,
                  )
                ),
                trailing: Text(
                  "25 €",
                  style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 18,
                  )
                ),
              ),
              ListTile(
                leading: Text(
                  "Bocadillo",
                  style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 16,
                  )
                ),
                trailing: Text(
                  "7.5 €",
                  style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 16,
                  )
                ),
              ),
              ListTile(
                leading: Text(
                  "Patatas",
                  style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 16,
                  )
                ),
                trailing: Text(
                  "10 €",
                  style: GoogleFonts.barlowSemiCondensed(
                    fontSize: 16,
                  )
                ),
              ),
            ]),
          ),
          DetailWidget()
        ],
      ),
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
        // title: Text('La Caña',
        //     style: TextStyle(color: Colors.white, fontSize: 16.0)),
        background: FadeInImage(
          image: AssetImage('assets/image/page1.jpg'),
          placeholder: AssetImage('assets/image/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
