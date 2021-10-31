import 'dart:convert';
import 'dart:math';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../model/product.model.dart';
import 'package:http/http.dart' as http;

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

    // await Future.delayed(Duration(seconds: 1));
    // barCode = '8901719101038';
    // return dummyProducts[Random().nextInt(dummyProducts.length)];
    Uri url = Uri.http('172.104.206.215:8080', '/scan/$barCode');
    final httpResponse = await http.get(url);

    if (httpResponse.statusCode == 200) {
      final data = json.decode(httpResponse.body);

      Product product = Product.fromMap(data);

      return product;
    } else {
      print('not found $barCode');
    }
  }
}
