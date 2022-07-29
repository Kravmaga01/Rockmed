import 'package:flutter/material.dart';
import 'package:rock_med/models/models.dart';

class EventFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ModelEvent? event;

  EventFromProvider(this.event);

  updateAvailability(bool value) {
    print(value);
    event!.cover = value;
    notifyListeners();
  }

  bool isValidFrom() {
    print(event!.coverValor);
    print(formkey.currentState?.validate());
    return formkey.currentState?.validate() ?? false;
  }
}
