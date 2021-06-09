import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/image_result.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/image_stage.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/manual_bbch.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/manual_result.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step1.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step2.dart';
import 'package:caphe_v2/screens/navigation_screen/navigation_screen.dart';
import 'package:caphe_v2/services/database_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/shared/header_bar.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'manual_stage.dart';

class AddFarmPanel extends StatefulWidget {
  @override
  _AddFarmPanelState createState() => _AddFarmPanelState();
}

class _AddFarmPanelState extends State<AddFarmPanel> {
  var choices = ChoicesWrapper("", "inflorescence", 0, "", "", "", null, "51", true);
  TextEditingController farmName = TextEditingController();
  final newFarmKey = GlobalKey<FormState>();
  var subtitleGroup = AutoSizeGroup();
  var titleGroup = AutoSizeGroup();
  var cardGroup = AutoSizeGroup();
  int index = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    final cities = Provider.of<List<City>>(context);

    return isLoading ? Loading() 
    : Scaffold(
      appBar: HeaderBar(text: Text("Farm Registration")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top:20),
            padding: EdgeInsets.fromLTRB(10,0,10,10),
            width: MediaQuery.of(context).size.width*.9,
            height: MediaQuery.of(context).size.height*.85,
            child: farms == null || cities == null ? Loading()
            : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10,40,10,10),
                        child: IndexedStack(
                          alignment: Alignment.center,
                          index: index,
                          children: [
                            Step1(newFarmKey, farmName, choices, titleGroup),
                            Step2(index, choices, titleGroup, subtitleGroup),
                            ManualStage(titleGroup, subtitleGroup, choices),
                            ManualBBCH(titleGroup, subtitleGroup, choices),
                            ManualResult(farmName, choices, titleGroup, index),
                            ImageStage(choices),
                            ImageResult(farmName, choices, titleGroup, index),
                          ] 
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        index ==  0 ? Spacer(flex: 2,)
                        : Expanded( 
                            flex: 2,
                            child: ElevatedButton(
                              child: Text('BACK'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if(index == 5) {
                                    choices.imageURI = null;
                                  }  
                                  index = index == 5 ? index - 4 : index - 1;
                                });
                              },
                            )
                          ),
                        Spacer(),
                        Expanded( 
                          flex: 2,
                          child :ElevatedButton(  
                            child: index == 4 || index == 6 ? Text('REGISTER') : Text('NEXT'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade800,
                              onPrimary: Colors.white,
                            ),
                            onPressed: () async {
                              if (index == 4 || index == 6) {
                                setState(() {
                                  isLoading = true;
                                });
                                await DatabaseService().addFarm(
                                  farmName.text, 
                                  choices.location, 
                                  choices.currentVariety.toUpperCase(),
                                  choices.currentStage.toUpperCase(),
                                  index == 4 ? int.parse(choices.finalBBCH) : int.parse(choices.imageFinalBBCH),
                                  HEAT_UNITS[choices.currentVariety.toUpperCase()][int.parse(choices.finalBBCH)].toDouble()
                                );
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => NavigationScreen(1, farms.length)
                                  )
                                );
                              } else {
                                setState((){
                                  index = index == 1 
                                    ? index + choices.jump 
                                    : newFarmKey.currentState.validate() && choices.location != '' && choices.currentVariety != '' && index != 5 
                                    ? index + 1
                                    : choices.imageURI != null 
                                    ? index + 1
                                    : index + 0;
                                  FocusScope.of(context).unfocus();
                                });
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ),
                  index != 5 
                    ? Spacer() 
                    : Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              index = index - 3;
                              choices.currentStage = "inflorescence";
                              choices.imageURI = null;
                            });
                          }, 
                          child: Text("Go back to Manual selection"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue.shade800,
                            onPrimary: Colors.white,
                          ),
                        ),
                    ),
                ],
              )
          ),
        ),
      ),
    );
  }
}