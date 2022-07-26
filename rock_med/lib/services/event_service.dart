import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class EventService extends ChangeNotifier {
  final String _baseUrl = 'rockmeddatabase-default-rtdb.firebaseio.com';
  final List<ModelEvent> Event = [];

  Future loadEvent() async {
    final url = Uri.http(_baseUrl, 'evento.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    print(productsMap);
  }

  bool isLoading = true;
  EventsService() {
    print('holas');
    this.loadEvent();
  }
}
