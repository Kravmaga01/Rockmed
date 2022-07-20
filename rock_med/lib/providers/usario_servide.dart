import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioService {
  static CollectionReference instance =
      FirebaseFirestore.instance.collection('usuarios');
}
