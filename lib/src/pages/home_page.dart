import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resto/src/models/resto_model.dart';

import 'package:resto/src/pages/cards_page.dart';
import 'package:resto/src/providers/restos_provider.dart';
import 'package:resto/src/pages/map_page.dart';
import 'package:barcode_scan/barcode_scan.dart';




class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final restosProvider = RestosProvider();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _callPage(currentIndex),
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.qrcodeScan), 
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
  _scanQR() async{
    

    // print(restos);
    
    // 5edd6588ac5b3649630703b1
    var futureString;
    try{
      futureString = await BarcodeScanner.scan();
    } catch (e){
      futureString = e.toString();
    }

    // print('Future String: ${futureString.rawContent}');
    List<Resto> restos = await restosProvider.buscarQR((futureString.rawContent).toString());
    if(futureString != null) {
      if(restos.length > 0){
        Navigator.pushNamed(context, 'detalle',
             arguments: restos[0]);
      }
      else
      {
        Navigator.pushNamed(context, 'errorqr');
      }
    }
    
  }
  Widget _callPage(int paginaActual)
  {
    switch(paginaActual){
      case 0: return CardsPage();
      case 1: return MapPage();
      default:
        return CardsPage();
    }
  }


  Widget _crearBottomNavigationBar()
  {
    return BottomNavigationBar(
      //le dice a la barra que elementos tiene activo
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.mapMarkerDistance),
          title: Text('Cerca'),
          
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.mapLegend),
          title: Text('Mapa'),
        ),
      ],
    );
  }
}