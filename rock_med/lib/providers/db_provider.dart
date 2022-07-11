import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:rock_med/models/model_banda.dart';
export 'package:rock_med/models/model_banda.dart';

// esta estructura esta basada en un singleton
class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initBD();

    return _database!;
  }

  Future<Database> initBD() async {
// path donde se almacena la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Rockmed.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE banda (
	cod_band	INTEGER NOT NULL,
	nombre_banda	TEXT NOT NULL,
	ubucacion	TEXT NOT NULL,
	num_cellbanda	NUMERIC NOT NULL,
	correo_band	TEXT NOT NULL,
	contraseña_banda	TEXT NOT NULL,
	PRIMARY KEY(cod_band AUTOINCREMENT)
);
''');
    });
  }

  nuevaBanda(ModelBanda nuevaBanda) async {
    //verificar la base de datos
    final db = await database;

    final res = await db.insert('banda', nuevaBanda.toJson());
    return res;
  }
}
