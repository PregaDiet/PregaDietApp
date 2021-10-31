import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Emergency',
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.center,
      height: 200,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: RadialGradient(
          colors: [
            Color(0xffda0018),
            Color(0xff5d040a),
          ],
          radius: 30,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
