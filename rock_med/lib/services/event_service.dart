//Todo: servicio  para eventos
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

//* conexion a realdatabase.
class EventService extends ChangeNotifier {
  // se extiende de un chagenotifier
  final String _baseUrl =
      'rockmeddatabase-default-rtdb.firebaseio.com'; // urle de base de datos
  final List<ModelEvent> event = []; // objeto en el que se almacenaran
  bool isLoading = true; // se pregunta si esta cargando

  EventsService() async {
    // se  inicializa la carga de los eventos
    await loadEvent();
  }

  Future loadEvent() async {
    // funcion asincrona que espera los datos.
    final url = Uri.https(_baseUrl,
        'evento.json'); //! se expecifica que colección se desea iterar
    final resp = await http.get(
        url); //! se pude la respuesta del get del mismo (trae un obj tipo json)
    final Map<String, dynamic> eventsMap =
        json.decode(resp.body); //! se decodifica el obj json en un map

    //* se itera el map previamente creado
    eventsMap.forEach((key, value) {
      //! la key trae el id de la coleccion.value trea el map
      final tempEven =
          ModelEvent.fromMap(value); //! se usa el metodo del modelo
      tempEven.id = key; //! se le asigna la key a el id del modelo
      this.event.add(tempEven); // se guardan los valores en el objeto vacio
    });
    print(event[0].fecha);
  }
}
