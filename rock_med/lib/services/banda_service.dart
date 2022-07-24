import 'package:flutter/widgets.dart';

import '../models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'rockmeddatabase-default-rtdb.firebaseio.com';
  final List<ModelBanda> bandas = [];
}
