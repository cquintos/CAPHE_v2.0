import 'dart:io';

import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
class ImageStage extends StatefulWidget {
  ImageStage(this.choices, {Key key}) : super(key: key);
  ChoicesWrapper choices;

  @override
  _ImageStageState createState() => _ImageStageState(this.choices);
}

class _ImageStageState extends State<ImageStage> {
  _ImageStageState(this.choices);
  final _picker = ImagePicker();
  ChoicesWrapper choices;
  File imageURI;
  var result;
  var finalResult;

  Future classifyFurther(String path, String stage) async {
    var output;
    stage = stage.replaceAll(" ", "");
    if(path!='')  {
      debugPrint(path);
      await Tflite.loadModel(
        model: "assets/$stage.tflite", 
        labels: "assets/$stage.txt"
      );
      output = await Tflite.runModelOnImage(
        path: path,
        threshold: 0.001,
        imageMean: 127.5,
        imageStd: 127.5
      );
      setState(() {
        finalResult = output;
        var result = finalResult[0]['label'].substring(2).split(' ');
        widget.choices.currentStage = result.length == 3 
          ? (result[0]+" "+result[result.length-2]).toLowerCase()
          : result[0].toLowerCase();
        choices.imageFinalBBCH = result[result.length-1]; 
        print(output[0]["confidence"].toStringAsFixed(3));

        _showResults();
      });
    }
  }

  Future classifyImage(String path) async {
    var output;
    if(path!='')  {
      debugPrint(path);
      await Tflite.loadModel(
        model: "assets/21.tflite", 
        labels: "assets/21.txt"
      );
      output = await Tflite.runModelOnImage(
        path: path,
        threshold: 0.001,
        imageMean: 127.5,
        imageStd: 127.5
      );
      setState(() {
        result = output;
        print(output[0]["confidence"].toStringAsFixed(3));
      });
      classifyFurther(path, result[0]['label'].substring(2));
    }
  }

  eraseImage() {
    setState(() {
      choices.imageURI = null;
      finalResult = null;
    });
  }

  Future getImageFromGallery(ImageSource source) async {
    try {
      PickedFile image = await _picker.getImage(source: source);
      if(image != null) {
        setState(() {
          imageURI = File(image.path);
          choices.path = image.path;
          choices.imageURI = imageURI;
        });
        classifyImage(choices.path);
      }
    } catch (e) {
      print("Error getting image from gallery");
    }
  }
  
  Widget _btn (IconData icon, String text) {
    return Container(
      decoration: BoxDecoration(
        color: icon == null ? Colors.green.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon == null ? SizedBox.shrink()
          : Icon(
            icon,
            size: 50,
            color: icon != null ? Colors.green.shade800 : Colors.white,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: icon != null ? Colors.green.shade800 : Colors.white,
              fontWeight: FontWeight.w700
            ),
          )
        ]
      ),
    );
  }

  Widget _tab (String text) {
    return Container(
      decoration: BoxDecoration(
        color: text == "CLICK HERE FOR GUIDELINES" 
          ? Colors.green.shade800
          : Colors.blue.shade800,  
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
          )
        ]
      ),
    );
  }

  openInstuctions() {
    return showDialog<String> (
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Image guidelines"),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width*.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Scroll Down!"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:20),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Results may be unreliable.\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("When you find the results unreliable, just click the blue bar.\n"),
                            Text("Upon clicking the blue bar, you will go directly to manual selection."),
                          ],
                        ),
                      ),
                    ),  
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Get close but not too close!\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("Try to upload a picture of the whole bud, flower, or group of berry!\n"),
                            Text("Examples: "),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/robusta/inflorescence.jpeg",
                                    height: 100.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/robusta/flowering3.jpeg",
                                      height: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5,5,5,10),
                                  child: Image.asset(
                                      "assets/robusta/berryripening3.jpeg",
                                      height: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),  
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "This app is about Coffee!\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("Please avoid uploading pictures unrelated to a coffee plant.\n"),
                            Text("Examples of what not to upload:\n"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/invalid1.jpg",
                                    height: 100.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/invalid2.jpg",
                                      height: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5,5,5,10),
                                  child: Image.asset(
                                      "assets/invalid3.jpg",
                                      height: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),  
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:20),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "So near yet so far...\n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("Unfocused pictures will yield a result but would not be as reliable as the ones focused.\n"),
                            Text("Examples of unfocused pictures: "),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/guidelines1.jpg",
                                    height: 100.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/guidelines2.jpg",
                                      height: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5,5,5,10),
                                  child: Image.asset(
                                      "assets/guidelines3.jpeg",
                                      height: 100.0,
                                      fit: BoxFit.fill,
                                    ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),  
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  _showResults() {
    int x = int.parse(finalResult[0]['label'].split(' ')[finalResult[0]['label'].split(' ').length-1]);
    String num = (BBCH_STAGES_MAP[result[0]['label'].substring(2).toUpperCase()].indexOf(x)+1).toString();

    return showDialog<String> (
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Image Stage Result"),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${finalResult[0]['label'].substring(2 )}\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.green.shade800
                    ),
                  ),
                  Text(
                    "Image shown is for reference to the result.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                    ),
                  ),
                  result != null && finalResult != null
                    ? Container(
                        margin: EdgeInsets.fromLTRB(5,10,5,10),
                        child: Image.asset(
                          "assets/${choices.currentVariety.toLowerCase()}/${(result[0]['label'].substring(2)).replaceAll(" ", "").toLowerCase()}$num.jpeg",
                          height: 200.0,
                          fit: BoxFit.contain,
                        )
                      )
                    : SizedBox.shrink(),
                  Text(
                    "CONFIDENCE: ${(finalResult[0]['confidence'] * 100).toStringAsFixed(1)}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: finalResult[0]['confidence'] * 100 < 59 
                        ? Colors.red.shade800 
                        : finalResult[0]['confidence'] * 100 < 79
                        ? Colors.yellow.shade800
                        : Colors.green.shade800
                    ),
                  ),
                  Text(
                    "(The higher, the better)\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                    ),
                  ),
                  Text(
                    "If your image is not similar to the result, you can go back to manual selection.\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                    ),
                  ),
                  ElevatedButton(
                    child: Text('close'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]
              )
            )
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: choices.imageURI == null
            ? Text(
              'Please pick between opening camera or opening gallery for your picture.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )
            : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                choices.imageURI,
                fit: BoxFit.cover
              ),
            ),
        ),
        Spacer(),
        Expanded(
          flex: 4,
          child: Container(
            child: Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 7,
                  child: InkWell(
                    onTap: choices.imageURI == null 
                      ? () => getImageFromGallery(ImageSource.camera) 
                      : () => eraseImage(),
                    child: choices.imageURI == null 
                      ? _btn(Icons.camera_alt, "Open Camera")
                      : _btn(Icons.replay_outlined, "Try another image")
                  )
                ),
                Spacer(),
                Expanded(
                  flex: 7,
                  child: InkWell(
                    onTap: choices.imageURI == null 
                      ? () => getImageFromGallery(ImageSource.gallery)
                      : () => _showResults(),
                    child: choices.imageURI == null
                      ? _btn(Icons.photo, "Open Gallery")
                      : _btn(Icons.center_focus_weak, "Show Results")
                  )
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex:2,
          child: Row(
            children: [
              Spacer(),
              Expanded(
                flex: 15,
                child: InkWell(
                  onTap: () => openInstuctions(),
                  child: _tab("CLICK HERE FOR GUIDELINES")
                )
              ),
              Spacer()
            ],
          ),
        ),
      ]
    );
  }
}