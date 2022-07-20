import 'dart:async';
import 'package:collection/src/iterable_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class BarService {
  static Map<String, dynamic> name = {
    'Nombre': '',
    'Password': '',
  };
  static bool validado = false;
  static CollectionReference instance =
      FirebaseFirestore.instance.collection('bar');
  static bool? comprobar(value) {
    FirebaseFirestore.instance.collection('bar').get().then((event) {
      for (var doc in event.docs) {
        if (doc.data().containsValue(value)) {
          print(doc.data());
          validado = true;
          return validado;
        }
      }
    });
    return false;
  }
} // obtienes el documento aquí

