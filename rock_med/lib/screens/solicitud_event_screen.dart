import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/event_service.dart';
import '../widget/wiget.dart';

class SolicitudScreenEvent extends StatelessWidget {
  const SolicitudScreenEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    print(eventService.EventsService());

    return Scaffold(
      appBar: AppBar(),
      drawer: const SideMenu(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) => const SolicitudCard()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
