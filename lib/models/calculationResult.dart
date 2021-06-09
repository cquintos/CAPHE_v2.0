import 'package:caphe_v2/models/event.dart';

class CalculationResult {
  String stage;
  double heatUnits;
  List<Event> events = List.empty(growable:true);
  DateTime harvestDate;
}
