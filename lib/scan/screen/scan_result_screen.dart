import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../model/product.model.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(product.frontImage),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(product.backImage),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(product.name,
                  style: TextStyle(
                    fontSize: 40,
                    color: product.healthy ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w300,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                product.healthy
                    ? 'This product is good for you :)'
                    : 'This product is bad for pregnancy :(',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 60,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                child: Lottie.asset(
                    product.healthy ? 'assets/tick.json' : 'assets/cross.json'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.why,
                style: TextStyle(fontSize: 30, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
