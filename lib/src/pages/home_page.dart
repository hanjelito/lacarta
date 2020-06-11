import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:resto/src/providers/restos_provider.dart';
import 'package:resto/src/search/search_delegate.dart';

import 'package:resto/src/widgets/home/card_widget.dart';

class HomePage extends StatelessWidget {

  final restosProvider = RestosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset('assets/icons/menu.png', fit: BoxFit.cover),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch()
              );
            },
          ),
        ],
      )
      ,
      body: Stack(
          children: <Widget>[
            _cardWidget(),
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

  Widget _cardWidget() {
    return FutureBuilder(
      future: restosProvider.getOnline(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.hasData){
            return CardWidget(restos: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  Widget _crearBottomNavigationBar()
  {
    
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