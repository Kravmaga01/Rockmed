import 'package:cloud_firestore/cloud_firestore.dart';

class BandaService {
  static CollectionReference instance =
      FirebaseFirestore.instance.collection('banda');
}
