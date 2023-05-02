import 'package:conversor_moedas/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

var request = Uri.https(
    'api.hgbrasil.com', '/finance', {"format": "json", "key": "5511f6f7"});

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white,
    ),
  ));
}

Future<Map> getDados() async {
  var response = await http.get(request);
  return convert.jsonDecode(response.body);
}
