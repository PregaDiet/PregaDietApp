import 'package:flutter/material.dart';
import '../../../app_colors.dart';
import '../../../articles/screen/article_details.dart';
import '../../model/hospital.model.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalTile extends StatelessWidget {
  const HospitalTile({Key? key, required this.hospital}) : super(key: key);
  final Hospital hospital;

  void _call(String number) async {
    final url = 'tel:$number';
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  void _launchMap(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ArticleDetails(article: hospital)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        //height: 150,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(0, 2),
                //spreadRadius: 2,
                color: Colors.black38,
              )
            ]),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hospital.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    hospital.address,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          _launchMap(hospital.url);
                        },
                        child: Text(
                          'View on Map',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 20,
                        width: 1,
                        color: Colors.black26,
                      ),
                      InkWell(
                        onTap: () {
                          _launchMap(hospital.map);
                        },
                        child: Text(
                          'Get Directions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  _call(hospital.phoneNumber);
                },
                icon: Icon(
                  Icons.call,
                  color: AppColors.green,
                )),
          ],
        ),
      ),
    );
  }
}
