import 'dart:convert';

import 'package:location/location.dart';
import 'package:prega_diet/common/get_location.dart';

import '../model/hospital.model.dart';
import 'package:http/http.dart' as http;

class HospitalsRepository {
  Future<List<Hospital>> getHospitals() async {
    List<Hospital> hospitals = [];

    // await Future.delayed(Duration(seconds: 2));
    // for (final hospital in dummyHospitals) {
    //   hospitals.add(hospital);
    // }

    final location = await getLocation();

    String lat = location.latitude.toString();
    String long = location.longitude.toString();
    Uri url = Uri.http('172.104.206.215:8080', '/hospitals/$lat/$long');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['hospitals'];

      for (final hospital in data) {
        hospitals.add(Hospital.fromMap(hospital));
      }
    }

    return hospitals;
  }
}

List dummyHospitals = [
  Hospital(
    name: 'Metro Health Hospital',
    address:
        'Jaipur, NH-8, Delhi Jaipur Highway, Kotputli, Kotputli, Rajasthan 303108, India',
    map:
        'https://www.google.com/maps/dir/?api=1&origin=27.710740735430075,76.18658048458713&destination=27.698396,76.1903111',
    phoneNumber: '093142 41100',
    rating: 4.5,
    url: 'https://maps.google.com/?cid=2193942335616965331',
  ),
  Hospital(
    name: 'SANJEEVANI HOSPITAL',
    address:
        'Jaipur, NH-8, Delhi Jaipur Highway, Kotputli, Kotputli, Rajasthan 303108, India',
    map:
        'https://www.google.com/maps/dir/?api=1&origin=27.710740735430075,76.18658048458713&destination=27.698396,76.1903111',
    phoneNumber: '093142 41100',
    rating: 3.4,
    url: 'https://maps.google.com/?cid=5707100178143607662',
  ),
  Hospital(
    name: 'Metro Health Hospital',
    address:
        'Jaipur, NH-8, Delhi Jaipur Highway, Kotputli, Kotputli, Rajasthan 303108, India',
    map:
        'https://www.google.com/maps/dir/?api=1&origin=27.710740735430075,76.18658048458713&destination=27.698396,76.1903111',
    phoneNumber: '093142 41100',
    rating: 4.5,
    url: 'https://maps.google.com/?cid=2193942335616965331',
  ),
  Hospital(
    name: 'SANJEEVANI HOSPITAL',
    address:
        'Jaipur, NH-8, Delhi Jaipur Highway, Kotputli, Kotputli, Rajasthan 303108, India',
    map:
        'https://www.google.com/maps/dir/?api=1&origin=27.710740735430075,76.18658048458713&destination=27.698396,76.1903111',
    phoneNumber: '093142 41100',
    rating: 3.4,
    url: 'https://maps.google.com/?cid=5707100178143607662',
  ),
];
