import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'app_colors.dart';
import 'articles/screen/articles_screen.dart';
import 'contact/screen/contact_screen.dart';
import 'hospitals/screen/hospital_screen.dart';
import 'profile/screen/profile_screen.dart';
import 'scan/screen/scan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreen = 2;

  Widget _chooseScreen() {
    switch (selectedScreen) {
      case 0:
        return ArticlesScreen();
      case 1:
        return HospitalScreen();
      case 2:
        return ScanScreen();
      case 3:
        return ContactScreen();
      case 4:
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
      // appBar: AppBar(),
      body: _chooseScreen(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: AppColors.orange,
        color: Colors.black54,
        initialActiveIndex: selectedScreen,
        items: const [
          TabItem(icon: Icons.map, title: 'Articles'),
          TabItem(icon: Icons.local_hospital, title: 'Hospitals'),
          TabItem(icon: Icons.qr_code_scanner, title: 'Scan'),
          TabItem(icon: Icons.call, title: 'Contact'),
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
