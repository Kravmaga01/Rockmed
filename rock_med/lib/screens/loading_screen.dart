import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/themes/themes.dart';

import '../services/services.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    eventService.EventsService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: AppTheme.primary,
        ),
      ),
    );
  }
}
