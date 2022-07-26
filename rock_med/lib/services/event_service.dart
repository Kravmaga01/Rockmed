import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class EventService extends ChangeNotifier {
  final String _baseUrl = 'rockmeddatabase-default-rtdb.firebaseio.com';
  final List<ModelEvent> Event = [];
  bool isLoading = true;

  EventsService() async {
    print('holas');
    await this.loadEvent();
  }

  Future loadEvent() async {
    final url = Uri.https(_baseUrl, 'Evento.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    print(productsMap);
  }
}
