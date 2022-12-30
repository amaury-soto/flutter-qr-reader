import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatelessWidget {
   
  const AddressPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, index) => ListTile(
              leading: Icon(Icons.web, color: Theme.of(context).primaryColor),
              title: Text(scanListProvider.scans[index].valor),
              subtitle: Text('${scanListProvider.scans[index].id}'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey,),
              onTap: () {
                print('Algooo');
              },
            ));
  }
}