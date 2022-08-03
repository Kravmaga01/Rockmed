import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class UsuarioService {
  static CollectionReference instance =
      FirebaseFirestore.instance.collection('usuarios');
}
