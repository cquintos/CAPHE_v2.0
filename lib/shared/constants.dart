import 'package:flutter/material.dart';

const BORDERED_TEXTFIELD_DECOR = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.green, width: 2.0),
  ),
  labelStyle: TextStyle(
    color: Colors.black, 
    fontSize: 15
  ),
);

const STAGE_DAYS_MAP = {
  'robusta': [95.0,37.0,227.0,57.0], 
  'arabica': [77.0,21.0,178.0,88.0], 
  'excelsa': [84.0,84.0,232.0,48.0], 
  'liberica': [100.0,68.0,201.0,86.0]
};

const List<String> VARIETY_LIST = [
  "ROBUSTA", 
  "LIBERICA", 
  "ARABICA", 
  "EXCELSA"
];

const List<String> BBCH_STAGES = [
  "INFLORESCENCE",
  "FLOWERING",
  "BERRY DEVELOPMENT",
  "BERRY RIPENING"
];

const List<String> NAV_TITLES = [
  "CAPHE V2", 
  "CALENDAR", 
  "COFFEE FACTS", 
  "FEEDBACK"
];

const List<String> DATA_TITLES = [
  "Harvest in: ", 
  "Farm Name:", 
  "Location:", 
  "Species:", 
  "Current Growth Stage:", 
  "Date Added:"
];

const List<String> FARM_REG_TITLES = [
  "Step 1: Fill up the basic details: Name, Location, and Variety",
  "Step 2: To calculate the BBCH, you need to choose a process.",
  "Step 3: What stage is your coffee plant?",
  "Step 4: These are BBCH stages of coffee plant.",
  "Step 5: Confirm the result to register your farm.",
];

const List<String> FARM_REG_SUBTITLES = [
  "Either try our new image processing or manually identify it through a series of questions!",
  "Please select the one closest to your plant.",
  "Please scroll down, there is more option.",
  "Please recheck your answers!",
];

const ERR_EMPTY_INPUT = "This field is required.";
const NO_FARM_YET = "Wala ka pang pananim ng kape.";
const NO_FARM_YET_2 = "Upang mag dadag ng pananim, maaari lamang na pindutin ang berdeng pindutan sa gawing kanang ilalim ng screen.";

const double ICON_SIZE = 33; 