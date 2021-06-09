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

const BBCH_STAGES_MAP = {
  "INFLORESCENCE" : [51, 53, 55, 57, 59],
  "FLOWERING" : [61, 65, 69], 
  "BERRY DEVELOPMENT" : [71, 73, 75, 77, 79],
  "BERRY RIPENING" : [81, 85, 88]
};

const List<String> NAV_TITLES = [
  "CAPHE V2", 
  "FARMS",
  "COFFEE FACTS", 
  "FEEDBACK"
];

const List<String> DATA_TITLES = [
  "Harvest on:    ", 
  "Farm Name:", 
  "Location:", 
  "Species:", 
  "Current Growth Stage:", 
  "Registered on:"
];

const List<String> FARM_REG_TITLES = [
  "Step 1: Fill up the basic details: Name, Location, and Variety",
  "Step 2: To calculate the BBCH, you need to choose a process.",
  "Step 3: Choose among the four main stages of coffee plant.",
  "Step 4: These are the possible BBCH stages of your coffee plant.",
  "Step 5: Confirm the result to register your farm.",
];

const List<String> FARM_REG_SUBTITLES = [
  "Click on the tiles.\nYour choice will be in a green tile!",
  "Swipe left or right!\n Click the one closest to your plant!",
  "Please scroll down, there is more option.",
  "Please recheck your answers!",
];

const UNS_MESS = "Results unreliable? Click here.";

const ERR_EMPTY_INPUT = "This field is required.";
const NO_FARM_YET = "There are no farms to show yet.";
const NO_FARM_YET_2 = "To register a farm, click the green button with the '+' icon then follow the steps indicated!";

const double ICON_SIZE = 38; 

const IMG_TO_STAGE_MAP = {
  1: [51,61,71,81],
  2: [53,65,73,83],
  3: [55,69,75,88],
  4: [57,77],
  5: [59,79]
};

const HEAT_UNITS = { 
  "ROBUSTA" : {
    51:0, 52:116.12, 53:315.76, 54:703, 55:1023.18, 56:1226.6,
    57:1356.49, 58:1486.37, 59:1598.57, 60:1683.5, 61:1727.95,
    62:1772.41, 63:1804.82, 64:1837.23, 65:1879.58, 66:1913.71, 
    67:1945.7, 68:1977.69, 69:2013, 70:2048.32, 71:2168.85, 
    72:2938.41, 73:3325.13, 74:3531.56, 75:3735.46, 76:3982.61, 
    77:4367.39, 78:4703.87, 79:5051.19, 80:5398.51, 81:5738.78, 
    82:6077.58, 83:6322.2, 84:6566.83, 85:6774.3, 86:6973.98, 87:7105.2, 88:7236.43,
  },
  "LIBERICA": { 
    51:0, 52:413.24, 53:637.18, 54:870.47, 55:1395.23, 56:1694.09, 
    57:1866.55, 58:2021.65, 59:2187.51, 60:2278.06, 61:2328.16, 62:2378.25, 
    63:2425.52, 64:2471.67, 65:2526.08, 66:2580.5, 67:2656.16, 68:2731.81, 
    69:2812.01, 70:2892.2, 71:3084.38, 72:3544.94, 73:4176.75, 74:4794.29, 
    75:5129.07, 76:5464.69, 77:5694.95, 78:5925.22, 79:6138.31, 80:6431.86, 
    81:6747.58, 82:7021.71, 83:7193.42, 84:7361.94, 85:7528.45, 86:7694.96,
    87:7859.67,88:8024.38,
  },

  "ARABICA" : { 
    51:0, 52:319.87, 53:649.05, 54:908.61, 55:1128.46, 56:1282.07, 
    57:1399.34, 58:1503.97, 59:1702.45, 60:1789.11, 61:1818, 62:1846.89, 
    63:1878.01, 64:1909.13, 65:1939.92, 66:1970.72, 67:2019.67, 68:2074.54, 
    69:2140.09, 70:2206.97, 71:2455.42, 72:2949.84, 73:3264.76, 74:3535.07, 
    75:3762.89, 76:4060.07, 77:4325.57, 78:4591.07, 79:4887.72, 80:5165.74, 
    81:5562.87, 82:5794.17, 83:5947.67, 84:6101.17, 85:6261.58, 86:6421.99,
    87:6563.63, 88:6705.26
  },

  "EXCELSA" : { 
    51:0, 52:290.29, 53:580.58, 54:926.88, 55:1318.84, 56:1727.65, 
    57:1919.25, 58:1998.56, 59:2077.87, 60:2133.5, 61:2175.87, 62:2207.25, 
    63:2238.63, 64:2269.35, 65:2299.1, 66:2332.91, 67:2364.48, 68:2397.98, 
    69:2431.49, 70:2476.58, 71:2521.68, 72:2623.08, 73:3805.56, 74:4687.63, 
    75:5031.85, 76:5268.98, 77:5522.68, 78:6131.34, 79:6508.41, 80:6804.76, 
    81:7101.1, 82:7256.22, 83:7411.34, 84:7519.25, 85:7627.16, 86:7725.89,
    87:7824.63, 88:7906.67,
  }
};

const List<String> TIPS = [
  "Spray with copper-based fungicides at 2-3 weeks interval.",
  "Remove weeds and scales that harbor the insects. (Apply insecticides if needed.)",
  "Make sure to prune to avoid big coffee trees.",
  "Keep the farm free of ripe berries that may host Coffee Berry Borrers.",
  "Observe for Coffee Brown-eye spot on the berries and leaves.",
  "Be causious with your chemicals as you might affect pollinators."
];

