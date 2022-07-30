//Todo: servicio  para eventos
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

//* conexion a realdatabase.
class EventService extends ChangeNotifier {
  // se extiende de un chagenotifier
  final String _baseUrl =
      'rockmeddatabase-default-rtdb.firebaseio.com'; // urle de base de datos
  final List<ModelEvent> events = []; // objeto en el que se almacenaran
  ModelEvent? selecEvent;
  bool isLoading = true;
  bool isSaving = false; // se pregunta si esta cargando
  bool isDelete = false;

  eventsService() async {
    // se  inicializa la carga de los eventos

    await loadEvent();
    notifyListeners();
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
      // se guardan los valores en el objeto vacio
    });

    return events;
  }

  Future deleteEvent(ModelEvent? event) async {
    isDelete = true;
    notifyListeners();
    await _deleteEvent(event!);

    isDelete = false;
    notifyListeners();
  }

  Future seveOrCreateEvent(ModelEvent? event) async {
    isSaving = true;
    notifyListeners();
    if (event!.id == null) {
      //Esnecesario crear
      await createEvent(event);
    } else {
      // Actualizar

      await updateEvent(event);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateEvent(ModelEvent event) async {
    final url = Uri.https(_baseUrl, 'evento/${event.id}.json');
    final resp = await http.put(url, body: event.toJson());
    final decodeData = resp.body;
    final index = events.indexWhere((element) => element.id == event.id);
    events[index] = event;
    return event.id!;
  }

  Future<String> createEvent(ModelEvent event) async {
    final url = Uri.https(_baseUrl, 'evento.json');
    final resp = await http.post(url, body: event.toJson());
    final decodeData = json.decode(resp.body);
    event.id = decodeData['name'];
    events.add(event);
    return event.id!;
  }

  Future _deleteEvent(ModelEvent event) async {
    final url = Uri.https(_baseUrl, 'evento/${event.id}.json');
    final resp = await http.delete(url, body: event.toJson());
    final decodeData = resp.body;
    events.remove(event);
  }
}
