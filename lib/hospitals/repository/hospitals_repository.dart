import 'package:prega_diet/hospitals/model/hospital.model.dart';

class HospitalsRepository {
  Future<List<Hospital>> getHospitals() async {
    List<Hospital> hospitals = [];

    await Future.delayed(Duration(seconds: 2));

    for (final hospital in dummyHospitals) {
      hospitals.add(hospital);
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
