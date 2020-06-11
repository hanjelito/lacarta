import 'package:flutter/material.dart';
import 'package:resto/src/models/resto_model.dart';
import 'package:resto/src/widgets/detail/carddetalle_widget.dart';
import 'package:resto/src/widgets/detail/category_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:resto/src/widgets/detail/detail_widget.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Resto resto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(resto),
          CategoryWidget(),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
          CarddetalleWidget(),
          //DetailWidget(),
        ],
      ),
    );
  }

  Widget _crearAppbar(resto) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            centerTitle: true,
            title: Text(resto.name,
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            background: FadeInImage(
              image: NetworkImage(resto.getCoverImg()),
              //AssetImage('assets/image/page1.jpg'),
              placeholder: AssetImage('assets/image/no-image.png'),
              fit: BoxFit.cover,
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.fromLTRB(370.0, 10.0, 0.0, 0.0),
          //   child: ClipOval(
          //     child: Material(
          //       color: Colors.black, 
          //       child: InkWell(
          //         splashColor: Colors.red, 
          //         child: SizedBox(width: 45, height: 45, child: Icon(Icons.map, color: Colors.red)),
          //         onTap: () {
          //           launch("url de la ubicación");
          //         },
          //       ),
          //     ),
          //   ),
          // ),
          // IconButton(
          //   padding: EdgeInsets.all(100),
          //   icon: Icon(FontAwesomeIcons.map),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
