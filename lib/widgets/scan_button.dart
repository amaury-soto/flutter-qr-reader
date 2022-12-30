import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qr_reader/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: ()async{
      /* String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#3D8BEF', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR); */
    final barcodeScanRes = 'https://fernando-herrera.com';                                         
    
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    scanListProvider.newScan(barcodeScanRes);
    scanListProvider.newScan('geo:15.33,15.66');


    }, child: Icon(Icons.filter_center_focus),);
  }
}