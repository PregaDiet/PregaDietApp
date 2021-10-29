import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
