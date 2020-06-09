import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' show utf8;

import 'package:resto/src/models/resto_model.dart';

class RestosProvider {
  String _url = 'ialab.io:3000';
  

  Future<List<Resto>>getOnline() async{
    final url = Uri.http(_url, 'clients', {
      'Content-type': 'application/json'
    });

    final resp = await http.get(url);
    final decodeData = json.decode(utf8.decode(resp.bodyBytes));
    final restos = new Restos.fromJsonList(decodeData);
    
    // print(restos.items.length);
    return restos.items;
  }

}