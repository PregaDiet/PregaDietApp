import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/model/load_status.enum.dart';
import '../../common/screen/loading_screen.dart';
import '../cubit/scan_cubit.dart';
import 'scan_result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String text = '';

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.loaded) {
          //  if (state.product!.isGood) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ScanResultScreen(product: state.product!)));
          // } else {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => BadScreen()));
          // }
        }

        if (state.loadStatus == LoadStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error occure while scanning')));
        }
      },
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.initial ||
            state.loadStatus == LoadStatus.error ||
            state.loadStatus == LoadStatus.loaded) {
          return SafeArea(
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
                    'Not sure if the product is good for your health?',
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
                      // await scan();
                      await context.read<ScanCubit>().scanProduct();
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
          );
          // } else if (state.loadStatus == LoadStatus.loaded) {
          //   return GoodScreen();
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}
