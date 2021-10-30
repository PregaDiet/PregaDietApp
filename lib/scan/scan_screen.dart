import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:prega_diet/app_colors.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String text = '';

  bool tapped = false;

  Future<void> scan() async {
    print('Scanning');
    final response = await FlutterBarcodeScanner.scanBarcode(
        '#9dcd5a', 'Cancle', true, ScanMode.BARCODE);

    if (response != '-1') {
      setState(() {
        text = response;
      });
    } else {
      print('cancled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Not sure if the product is good for your pregnancy?',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 60,
                  color: Colors.black87,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  // setState(() {
                  //   tapped = true;
                  // });
                  await scan();
                  // setState(() {
                  //   tapped = false;
                  // });
                },
                onTapUp: (_) {
                  setState(() {
                    tapped = false;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    tapped = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    setState(() {
                      tapped = false;
                    });
                  });
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 1.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: tapped ? 0 : 10,
                          color: Colors.black26,
                        )
                      ]),
                  child: Text(
                    'Click here to verify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Text(text),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
