import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:prega_diet/app_colors.dart';
import 'package:prega_diet/articles/articles_screen.dart';
import 'package:prega_diet/profile/profile_screen.dart';
import 'package:prega_diet/scan/scan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreen = 1;

  Widget _chooseScreen() {
    switch (selectedScreen) {
      case 0:
        return ArticlesScreen();
      case 1:
        return ScanScreen();
      case 2:
        return ProfileScreen();
      default:
        return const Center(
          child: Text('Inappropriate Screen'),
        );
    }
  }

  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _chooseScreen(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: AppColors.orange,
        color: Colors.black54,
        initialActiveIndex: selectedScreen,
        items: const [
          TabItem(icon: Icons.map, title: 'Explore'),
          TabItem(icon: Icons.add, title: 'Scan'),
          TabItem(icon: Icons.message, title: 'Profile'),
        ],
        onTap: (val) {
          setState(() {
            selectedScreen = val;
          });
        },
      ),
    );
  }
}
