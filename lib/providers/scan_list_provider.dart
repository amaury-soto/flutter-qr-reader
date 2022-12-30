import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_models.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String valor) async {
    final newScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (selectedType == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadedScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  loadedScanByType(String tipo) async {
    final scans = await DBProvider.db.getScansByType(tipo);
    this.scans = [...scans!];
    selectedType = tipo;
    notifyListeners();
  }

  deletedAll() async {
    await DBProvider.db.deletedAllScans();
    scans = [];
    notifyListeners();
  }
  deletedByScan(int id) async {
    await DBProvider.db.deletedScan(id);
    loadedScanByType(selectedType);
    //notifyListeners();
  }
}
