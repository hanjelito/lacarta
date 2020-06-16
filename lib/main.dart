import 'package:flutter/material.dart';
import 'package:resto/src/pages/detalle_page.dart';
import 'package:resto/src/pages/errorqr_page.dart';
import 'package:resto/src/pages/home_page.dart';
import 'package:resto/src/pages/map_detalle_page.dart';
import 'package:resto/src/pages/qr_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restuurant',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapdetalle': (BuildContext context) => MapDetallePage(),
        'detalle': (BuildContext context) => DetallePage(),
        'qr': (BuildContext context) => QrPage(),
        'errorqr': (BuildContext context) => ErrorqrPage(),
      },
      theme: ThemeData(
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
