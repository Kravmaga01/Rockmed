import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class EventService extends ChangeNotifier {
  final String _baseUrl = 'rockmeddatabase-default-rtdb.firebaseio.com';
  final List<ModelEvent> event = [];
  bool isLoading = true;

  EventsService() async {
    await loadEvent();
  }

  Future loadEvent() async {
    final url = Uri.https(_baseUrl, 'evento.json');
    final resp = await http.get(url);
    final Map<String, dynamic> eventsMap = json.decode(resp.body);

    eventsMap.forEach((key, value) {
      final tempEven = ModelEvent.fromMap(value);
      tempEven.id = key;
      this.event.add(tempEven);
    });
    print(event[0].fecha);
  }
}
