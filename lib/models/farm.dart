import 'package:caphe_v2/services/database_service.dart';
import 'package:caphe_v2/shared/constants.dart';

class Farm {
  
  //date = date added to the database
  //days = days left before harvest
  String name;
  String location;
  String date;
  String stage;
  int days;
  String variety;
  String id;
  List<double> bbchDays; 

  //can be updated : name, location, variety
  //updating location and variety will affect days and stage
  Farm({String name, String location, String date, String stage, int days, String variety, String id}) {
    this.name = name;
    this.location = location; 
    this.date = date;
    this.stage = stage;
    this.days = days;
    this.variety = variety;
    this.id = id;
    this.bbchDays = getbbchDays(variety);
    this.updateStage(stage);
  }

  List<double> getbbchDays(String variety) {
    List<double> bbchDays;

    final days = {
      'robusta': [95.0,37.0,227.0,57.0], 
      'arabica': [77.0,21.0,178.0,88.0], 
      'excelsa': [84.0,84.0,232.0,48.0], 
      'liberica': [100.0,68.0,201.0,86.0]
    };

    days.forEach((key, value) {
      if(key == variety.toLowerCase()) {
        bbchDays = value;
      }
    });
    
    return bbchDays;
  }

  //gets the total amount of days before harvest with respect to the variety 
  //e.g. robusta : 95+37+227+57
  double getTotalDays() {
    return this.bbchDays.fold(0, (p, c) => p + c);
  }

  //if the current stage is not aligned with the days per bbch
  Future<void> updateStage(String currentStage) async {
    double currentDay = this.getTotalDays()-this.days;

    for(int i=0, j=0; ;i++) {
      if(this.bbchDays[i]+j >= currentDay) {
        await DatabaseService().updateFarm(
          this.name, 
          this.location, 
          this.variety, 
          this.id, 
          BBCH_STAGES[i]
        );
        break;
      }
      j = (this.bbchDays[i]+j).toInt();
    }
  }
}