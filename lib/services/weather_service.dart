import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/models/temperature.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeatherService {
  final CollectionReference weatherCollection = FirebaseFirestore.instance.collection("weatherData");

  WeatherService();

  List<Temperature> _getTemperatures (List temperatures) {
    return temperatures.map((temp){
      Timestamp t = temp['date'];
      DateTime date = t.toDate();
      return Temperature(
        date: date,
        minTemp: temp['minTemp'].toDouble(),
        maxTemp: temp['maxTemp'].toDouble()
      );
    }).toList();
  }

  List<City> _weatherListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return City(
        name: doc['name'] ?? '',
        temperatures: _getTemperatures(doc['temperatures']) ?? null,
      );
    }).toList();
  } 

  Stream<List<City>> get weatherData {
    return weatherCollection.snapshots().map(_weatherListFromSnapshot);
  }

}