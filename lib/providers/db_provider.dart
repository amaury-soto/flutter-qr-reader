import 'dart:io';

import 'package:flutter_qr_reader/models/scan_models.dart';
export 'package:flutter_qr_reader/models/scan_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    //path, where is DB
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    //create DB
    return await openDatabase(path, version: 1, onOpen: ((db) {}),
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY, 
          tipo TEXT,
          valor TEXT
        )  
      ''');
    });
  }

  /* Future<int> newScan(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;

    //verificamos db
    final db = await database;
    final res = await db.rawInsert('''
        INSERT INTO Scans(id, tipo, valor)
        VALUES($id, '$tipo', '$valor')
      ''');
    return res; 
  } */
  Future<int> newScan(ScanModel newScan) async {
    //verificamos db
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    //verificamos db
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    //verificamos db
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<List<ScanModel>?> getScansByType(String tipo) async {
    //verificamos db
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
  ''');

    return res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    //verificamos db
    final db = await database;
    final res = await db.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);
    return res;
  }

  Future<int> deletedScan(int id) async {
    //verificamos db
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deletedAllScans() async {
    //verificamos db
    final db = await database;
    final res = await db.delete('Scans');
    /*   final res = await db.rawDelete('''
        DELETE FROM Scans
      '''); */
    return res;
  }
}
