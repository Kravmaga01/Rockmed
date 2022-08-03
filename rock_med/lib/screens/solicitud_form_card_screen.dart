import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rock_med/themes/themes.dart';
import 'package:rock_med/widget/wiget.dart';
import '../services/services.dart';

class EvenFormScreen extends StatelessWidget {
  EvenFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventService = Provider.of<EventService>(context);
    return ChangeNotifierProvider(
      create: (_) => EventFromProvider(eventService.selecEvent),
      child: _EventFromScreenBody(eventService: eventService),
    );
  }
}

class _EventFromScreenBody extends StatelessWidget {
  final EventService eventService;

  _EventFromScreenBody({
    Key? key,
    required this.eventService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventForm = Provider.of<EventFromProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  EventFromImage(eventService.selecEvent.flayer),
                  Positioned(
                      top: 60,
                      left: 20,
                      child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: AppTheme.primary,
                          ))),
                  Positioned(
                      top: 60,
                      right: 20,
                      child: IconButton(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final XFile? pickedFile = await picker.pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 100,
                            );
                            if (pickedFile == null) {
                              print('No selecciono nada');
                              return;
                            }

                            print('tenemos imagen${pickedFile.path}');
                            eventService
                                .updateSelecedProductImage(pickedFile.path);
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: AppTheme.primary,
                          )))
                ],
              ),
              EventForm(),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                  onPressed: eventService.isSaving
                      ? null
                      : () async {
                          await eventService.deleteEvent(eventForm.event);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
                  child: const Text('Eliminar Evento'))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: eventService.isSaving
                ? null
                : () async {
                    if (!eventForm.isValidFrom()) return;
                    final String? imageUrl = await eventService.uploadImage();
                    if (imageUrl != null) eventForm.event!.flayer = imageUrl;
                    await eventService.seveOrCreateEvent(eventForm.event);
                    Navigator.pop(context);
                  },
            child: eventService.isSaving
                ? const CircularProgressIndicator(
                    color: AppTheme.second,
                  )
                : const Icon(Icons.save_outlined)));
  }
}
