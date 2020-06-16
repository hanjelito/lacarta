import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resto/src/models/resto_model.dart';
import 'package:resto/src/widgets/detail/carddetalle_widget.dart';
import 'package:resto/src/widgets/detail/category_widget.dart';
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: _crearBotones(context, resto),
    );
  }
  Widget _crearBotones(context, resto) 
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "btn1",
          child: Icon(MdiIcons.mapMarkerDistance), 
          backgroundColor: Colors.red,
          onPressed: (){
            Navigator.pushNamed(context, 'mapdetalle',
            arguments: resto);
          },
        ),
        FloatingActionButton(
          heroTag: "btn2",
          child: Icon(MdiIcons.qrcode), 
          backgroundColor: Colors.red,
          onPressed: (){
            Navigator.pushNamed(context, 'qr',
            arguments: resto);
          },
        )
      ],
    );
    
    
  }
  Widget _crearAppbar(resto) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(resto.name,
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
        background: FadeInImage(
          image: 
            NetworkImage(resto.getCoverImg()),
            //AssetImage('assets/image/page1.jpg'),
          placeholder: AssetImage('assets/image/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
