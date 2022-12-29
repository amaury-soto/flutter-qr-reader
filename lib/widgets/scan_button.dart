import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
    print('barcodeScanRes $barcodeScanRes');
    }, child: Icon(Icons.filter_center_focus),);
  }
}