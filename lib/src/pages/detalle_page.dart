import 'package:flutter/material.dart';
import 'package:resto/src/widgets/detail/detail_widget.dart';

class DetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _crearAppbar(),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildListDelegate([
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ]),
        ),
        DetailWidget()
      ],
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
}