import 'package:flutter/material.dart';
import 'package:rock_med/models/models.dart';

class EventFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ModelEvent? event;

  EventFromProvider(this.event);

  updateAvailability(bool value) {
    event!.cover = value;
    notifyListeners();
  }

  bool isValidFrom() {
    return formkey.currentState?.validate() ?? false;
  }
}
