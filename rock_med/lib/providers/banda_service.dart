import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:rock_med/models/models.dart';
import 'package:http/http.dart' as http;

class BandaService extends ChangeNotifier {
  final String _baseUrl = 'databaserockmed-ac951-default-rtdb.firebaseio.com';
  final List<ModelBanda> bandas = [];
  bool isLoading = true;

  BandaService() {
    this.loadBanda();
  }
  // Todo: <list<MoldesBanda>>
  Future loadBanda() async {
    final url = Uri.http(_baseUrl, 'bandas.json');
    final resp = await http.get(url);
    final Map<String, dynamic> bandasMap = json.decode(resp.body);
    print(bandasMap);
  }
}
