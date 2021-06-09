import 'package:caphe_v2/models/calculationResult.dart';
import 'package:caphe_v2/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/services/database_service.dart';

class Farm {
  //stage = flowering, berry development..
  //bbch = numerical of stage
  final String id;
  final DateTime date;
  final double heatUnits;
  final String stage;
  final int bbch;

  //can be updated in ui : name, location, variety
  String name;
  String location;
  String variety;

  //updated in calculation
  String currentStage;
  double currentHeatUnits;
  DateTime harvestDate;
  List<Event> events;
  bool isCalculating = false;
  DateTime endDate;
  

  //updating location and variety will affect days and stage
  Farm(this.id, this.date, this.heatUnits, this.stage, this.bbch, {
    String name, 
    String location,
    String variety, 
    double currentHeatUnits,
    int bbchNumber, 
    String currentStage,
    DateTime harvestDate,
    List<Event> events
  }) {
    this.name = name;
    this.location = location; 
    this.variety = variety;
    this.currentHeatUnits = currentHeatUnits;
    this.currentStage = currentStage;
  }
   
  calculate(City city) async {
    Iterator weatherIterator = city.temperatures.iterator;
    var result = CalculationResult();
    var heatUnitsMap = HEAT_UNITS[this.variety];
    var flags = [0,0,0,0,0];
    var currentDate;
    // debugPrint(DateFormat('yMd').format(this.date));
    // events is composed of date, string event and current heatunits of that event    
    //first event of the farm which is registration
    result.events.add(Event(false, DateFormat('yMd').format(this.date), "Registration Date", Colors.green.shade800, Icons.calendar_today, ""));

    //give the base values to result
    result.heatUnits = this.heatUnits;
    result.stage = this.stage;

    this.isCalculating = true;
    while(weatherIterator.moveNext()) {
      var current = weatherIterator.current;
      currentDate = current.date;
      var currentDateString = DateFormat('yMd').format(currentDate);

      //timelines is from after registration date onwards
      if(currentDate.isAfter(this.date)) {
        
        //accumulation of gdd
        double gdd = ((current.minTemp + current.maxTemp) / 2.0) - 10.0;
        result.heatUnits += gdd;
        
        //get the stage at this point of the timeline
        var movingUp = result.heatUnits >= heatUnitsMap[81] 
          ? toBeginningOfSentenceCase(BBCH_STAGES[3].toLowerCase())
            : result.heatUnits >= heatUnitsMap[71] 
            ? toBeginningOfSentenceCase(BBCH_STAGES[2].toLowerCase())
              : result.heatUnits >= heatUnitsMap[61] 
              ? toBeginningOfSentenceCase(BBCH_STAGES[1].toLowerCase())
                : toBeginningOfSentenceCase(BBCH_STAGES[0].toLowerCase());
        
        //if the stage is different, it moves up;
        if(result.stage != movingUp) {
          result.stage = movingUp;
          result.events.add(Event.major(currentDateString, movingUp, Colors.green.shade800, movingUp, ""));
        }

        //update this.currentStage to database when its today
        //update this.currentHeatUnits to database when its today
        if(DateFormat('yMd').format(DateTime.now()) == DateFormat('yMd').format(currentDate)) {
          DatabaseService().updateFarm(
            this.name, 
            this.location, 
            this.variety, 
            this.id, 
            this.currentStage != result.stage ? result.stage : this.currentStage,
            result.heatUnits
          );
        }

        //gets the necessary events along the timeline
        if(currentDate.month == 6 && flags[3] != currentDate.year) {
          result.events.add(Event(false, currentDateString, "Start of Rainy Season", Colors.blue.shade900, Icons.cloud, ""));
          result.events.add(Event(true, currentDateString, "Keep an eye for Coffee rust", Colors.red.shade900, Icons.pest_control, TIPS[0]));
          flags[3] = currentDate.year;
        } else if(currentDate.month == 12 && flags[4] != currentDate.year) {
          result.events.add(Event(false, currentDateString, "Start of Dry Season", Colors.brown.shade900, Icons.wb_sunny, ""));
          result.events.add(Event(true, currentDateString, "Watch out for Mealy Bugs", Colors.red.shade900, Icons.pest_control, TIPS[1]));
          flags[4] = currentDate.year;
        }

        if(result.heatUnits >= heatUnitsMap[88]) {
          result.events.add(Event(false, currentDateString, "Harvest Time", Colors.green.shade900, Icons.agriculture, TIPS[2]));
          this.events = result.events;
          this.isCalculating = false;
          this.harvestDate = currentDate;
          break;
        } else if (result.heatUnits >= heatUnitsMap[86] && result.heatUnits < heatUnitsMap[88] && flags[0] == 0) {
          result.events.add(Event(false, currentDateString, "Almost Fully Ripe", Colors.green.shade900, Icons.done, ""));
          flags[0] = 1;
        } else if (result.heatUnits >= heatUnitsMap[73] && result.heatUnits <= heatUnitsMap[74] && flags[1] == 0) {
          result.events.add(Event(false, currentDateString, "Pest Immergence Period", Colors.red.shade900, Icons.warning, ""));
          result.events.add(Event(true, currentDateString, "Coffee Berry Borers", Colors.red.shade900, Icons.pest_control, TIPS[3]));
          result.events.add(Event(true, currentDateString, "Coffee Brown-eye Spot", Colors.red.shade900, Icons.pest_control, TIPS[4]));
          flags[1] = 1;
        } else if (result.heatUnits >= heatUnitsMap[57] && result.heatUnits <= heatUnitsMap[58] && flags[2] == 0) {
          result.events.add(Event(false, currentDateString, "Pre Flowering Stage", Colors.green.shade900,  Icons.emoji_nature, TIPS[5]));
          flags[2] = 1;
        }
      }
    }

    if(this.harvestDate == null) {
      this.endDate = currentDate;
      debugPrint(this.endDate.toString());
      this.events = result.events;
      this.isCalculating = false;
    }

  }
}