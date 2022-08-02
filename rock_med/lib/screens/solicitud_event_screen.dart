import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/models/models.dart';
import '../services/event_service.dart';
import '../widget/wiget.dart';

class SolicitudScreenEvent extends StatelessWidget {
  SolicitudScreenEvent({Key? key}) : super(key: key);
  int contador = 0;
  Future<void> refresh() async {
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    Future.delayed(const Duration(milliseconds: 1), () {
      if (contador < 1) {
        contador++;

        eventService.eventsService();
      }
    });
    return Scaffold(
      appBar: AppBar(),
      drawer: const SideMenu(),
      body: ListView.builder(
          itemCount: eventService.events.length,
          itemBuilder: (BuildContext context, index) => SolicitudCard(
                index: index,
                event: eventService.events[index],
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          eventService.selecEvent = ModelEvent(
            nombre: '',
            cover: false,
            fecha: '',
            remitente: '',
            descripcion: '',
            coverValor: 0,
          );
          Navigator.pushNamed(context, 'EvetForm');
        },
      ),
    );
  }
}
