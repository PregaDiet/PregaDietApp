import 'dart:math';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:prega_diet/scan/model/product.model.dart';

class ScanRepository {
  Future<Product?> getProductInfo() async {
    String? barCode;
    print('Scanning');
    final response = await FlutterBarcodeScanner.scanBarcode(
        '#9dcd5a', 'Cancle', true, ScanMode.BARCODE);

    if (response != '-1') {
      barCode = response;
    } else {
      return null;
    }

    await Future.delayed(Duration(seconds: 1));

    return dummyProducts[Random().nextInt(dummyProducts.length)];
  }
}
