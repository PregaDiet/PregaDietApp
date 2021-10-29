import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          ElevatedButton(
              onPressed: () async {
                print('Scanning');
                final response = await FlutterBarcodeScanner.scanBarcode(
                    '#4d2c91', 'Cancle', true, ScanMode.BARCODE);

                if (response != '-1') {
                  setState(() {
                    text = response;
                  });
                } else {
                  print('cancled');
                }
              },
              child: Text('Scan')),
          Text(text)
        ],
      ),
    );
  }
}
