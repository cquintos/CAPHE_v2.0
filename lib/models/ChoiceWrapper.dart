import 'dart:io';

class ChoicesWrapper {
  String currentVariety;
  String currentStage;
  int jump;
  String finalBBCH;
  String location;
  String path;
  File imageURI;
  String imageFinalBBCH;
  bool isSatisfied;
  

  ChoicesWrapper(
    this.currentVariety, 
    this.currentStage, 
    this.jump, 
    this.finalBBCH,
    this.location,
    this.path,
    this.imageURI,
    this.imageFinalBBCH,
    this.isSatisfied
  );
}