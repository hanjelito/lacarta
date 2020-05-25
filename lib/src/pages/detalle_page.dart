import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Scaffold(
            //backgroundColor: Colors.transparent,
            body: CustomScrollView(
              slivers: <Widget>[
                _crearAppbar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 10.0,),
                      _descripcion(),
                      
                    ]
                  )
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
  Widget _crearAppbar()
  {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'prueba',
          style: TextStyle(color: Colors.white, fontSize: 16.0)
        ),
        background: FadeInImage(
          image: AssetImage('assets/image/page1.jpg'),
          placeholder: AssetImage('assets/image/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _descripcion( )
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        'prueba',
        textAlign: TextAlign.justify
      ),
    );
  }
}