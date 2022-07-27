//Todo: servicio  para eventos
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:rock_med/screens/screens.dart';
import '../models/models.dart';

//* conexion a realdatabase.
class EventService extends ChangeNotifier {
  // se extiende de un chagenotifier
  final String _baseUrl =
      'rockmeddatabase-default-rtdb.firebaseio.com'; // urle de base de datos
  final List<ModelEvent> events = []; // objeto en el que se almacenaran
  ModelEvent? selecFlayer;
  bool isLoading = true; // se pregunta si esta cargando

  EventsService() async {
    // se  inicializa la carga de los eventos
    await loadEvent();
  }

  Future<List<ModelEvent>> loadEvent() async {
    // funcion asincrona que espera los datos.

    final url = Uri.https(_baseUrl, 'evento.json');
    final resp = await http.get(url);
    final Map<String, dynamic> eventsMap = await json.decode(resp.body);

    //* se itera el map previamente creado
    eventsMap.forEach((key, value) {
      final tempEven = ModelEvent.fromMap(value);
      tempEven.id = key;
      events.add(tempEven);
      print(events); // se guardan los valores en el objeto vacio
    });

    return events;
  }
}
