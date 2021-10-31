import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../model/product.model.dart';

class GoodScreen extends StatelessWidget {
  const GoodScreen({Key? key, required this.product}) : super(key: key);

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
      body: Column(
        children: [
          Spacer(),
          Text(product.name,
              style: TextStyle(
                fontSize: 50,
                color: product.isGood ? Colors.green : Colors.red,
                fontWeight: FontWeight.w300,
              )),
          Spacer(),
          Text(
            product.isGood
                ? 'This product is good for you :)'
                : 'This product is bad for pregnancy :(',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 60,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.width / 1.5,
            child: Lottie.asset(
                product.isGood ? 'assets/tick.json' : 'assets/cross.json'),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
