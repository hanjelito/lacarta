import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:resto/src/models/resto_model.dart';

class QrPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final Resto resto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("QR"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(resto.name, style: TextStyle(fontSize: 24.0),),
            QrImage(
              data: resto.id,
              size: 300.0,
            )
          ]
        ),
      ),
    );
  }
}