import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/pages/pages.dart';
import 'package:flutter_qr_reader/providers/db_provider.dart';
import 'package:flutter_qr_reader/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_qr_reader/providers/ui_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [IconButton(onPressed: () {
          Provider.of<ScanListProvider>(context, listen: false).deletedAll();

        }, icon: Icon(Icons.delete))],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener currentIndex from provider
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO reade db
    //DBProvider.db.getAllScans().then(print);

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadedScanByType('geo');
        return MapsHistory();
      case 1:
        scanListProvider.loadedScanByType('http');
        return AddressPage();
      default:
        return MapsHistory();
    }
  }
}
