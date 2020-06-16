import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:resto/src/models/resto_model.dart';
import 'package:latlong/latlong.dart';


class MapDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Resto resto = ModalRoute.of(context).settings.arguments;
    //final ScanModel scan = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(resto.name),
      ),
      body: _crearFlutterMap(resto),
    );
  }
  Widget _crearFlutterMap(resto){
    return FlutterMap(
      options: MapOptions(
        //center: scan.getLatLng(),
        center: LatLng(resto.lat,resto.lng),
        zoom: 15
        ),
        layers: [
          _crearMapa(),
          _crearMarcadores(resto)
        ],
      );
  }
  _crearMapa(){
    return TileLayerOptions(
        urlTemplate: 'https://api.tiles.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
        'accessToken':'pk.eyJ1Ijoiam9yZ2VncmVnb3J5IiwiYSI6ImNrODk5aXE5cjA0c2wzZ3BjcTA0NGs3YjcifQ.H9LcQyP_-G9sxhaT5YbVow',
        'id': 'mapbox.streets'
        }
    );
  }
  _crearMarcadores(resto){
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: resto.getLatLng(),
          builder: (context) => Container(
            child: Icon(Icons.location_on,
            size: 70.0,
            color: Colors.red
            ) 
          )
        )
      ]
    );
  }
}