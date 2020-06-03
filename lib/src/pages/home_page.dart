import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:resto/src/providers/restos_provider.dart';

import 'package:resto/src/widgets/home/card_widget.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            CardWidget(),
          ],
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.qrcodeScan), 
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){},
      ),
    );
  }
  Widget _crearBottomNavigationBar()
  {
    final restosProvider = RestosProvider();
    restosProvider.getOnline();
    return BottomNavigationBar(
      //le dice a la barra que elementos tiene activo
      onTap: (index){
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.mapMarkerDistance),
          title: Text('Cerca'),
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.faceProfile),
          title: Text('Mis Datos'),
        ),
      ],
    );
  }
}