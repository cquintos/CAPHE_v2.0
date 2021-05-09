import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/services/database_service.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/shared/header_bar.dart';
import 'package:flutter/material.dart';

class AddFarmPanel extends StatefulWidget {
  @override
  _AddFarmPanelState createState() => _AddFarmPanelState();
}

class _AddFarmPanelState extends State<AddFarmPanel> {
  final _newFarmKey = GlobalKey<FormState>();
  String _variety = "ROBUSTA";  
  String _stage = "flowering";
  int _bbch = 1;
  int _days = 0;
  int _backDays = 0;
  List <double> endDays; 
  TextEditingController _farmName = TextEditingController();
  TextEditingController _farmLocation = TextEditingController();
  int index = 0;
  var cardGroup = AutoSizeGroup();

  Widget _title(String title, int maxLines, Color color, double fontSize) {
    return AutoSizeText(
      title,
      maxLines: maxLines,
      stepGranularity: 0.1,
      minFontSize: 10,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Widget _addTextField(TextEditingController controller, IconData icon, String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: TextStyle( color: Colors.black, ),
        validator: ( String value ) {
          if(value.isEmpty) 
            return ERR_EMPTY_INPUT;
          return null;
        },
        decoration: BORDERED_TEXTFIELD_DECOR.copyWith(
          icon: Icon(
            icon, 
            color: Colors.black
          ),
          labelText: label, 
          suffixIcon: IconButton( 
            onPressed: controller.clear, 
            icon: Icon(Icons.clear), 
          ), 
        ) 
      ),
    );
  }

  Widget _getBasicDetails() {
    return  SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Form(
            key: _newFarmKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _title(FARM_REG_TITLES[0], 2, Colors.green.shade800, 40),
                _addTextField(_farmName, Icons.account_box_rounded, "Farm Name"),
                _addTextField(_farmLocation, Icons.location_pin, "Farm Location"),
                Row(
                  children: <Widget>[
                    Text("Select Variety: "),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: DropdownButton<String> (
                        value: _variety,
                        items: VARIETY_LIST
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        onChanged: (value) => setState(() => _variety = value),
                      ),
                    ),
                  ],
                ),
              ]
            )
          )
        ]
      )
    );
  }

  Widget _imageProcessingCard() {
    return GestureDetector(
      onTap: (){
        setState(() {
          index = 5;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*.1,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.photo_camera,
                color: Colors.green.shade800,
              )
            ),
            Expanded(
              flex:1,
              child: AutoSizeText(
                "Kindly upload an image of your coffee plant, then we'll do the rest!",
                textAlign: TextAlign.center,
                maxLines: 2,
                stepGranularity: 0.1,
                minFontSize: 10,
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 20,
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Column (
                children: [
                  Expanded(
                    flex: 1,
                    child: AutoSizeText(
                      "Examples:",
                      minFontSize: 8,
                      stepGranularity: 0.1,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                      )
                    ),
                  ),  
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image:AssetImage("arabica/berrydevelopment.jpeg")),
                        Image(image:AssetImage("arabica/flowering.jpeg")),
                        Image(image:AssetImage("arabica/berryripening.jpeg")),
                      ],
                    )
                  )
                ],
              )
            ),
          ]
        )
      )
    );
  }

  Widget _manualProcessingCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = index + 1;
        });
      },
      child: Container (
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*.1,
        decoration: BoxDecoration(
          color: Colors.green.shade800,
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
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                Icons.grid_view,
                color: Colors.white,
              )
            ),
            Expanded(
              flex:1,
              child: AutoSizeText(
                "Just pick the image closest to your plant!",
                maxLines: 2,
                stepGranularity: 0.1,
                minFontSize: 10,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )
              )
            ),
            Spacer(flex: 2,)
          ]
        )
      ),
    );
  }

  Widget _getProcess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:1, child: _title(FARM_REG_TITLES[1], 2, Colors.green.shade800, 40)),
        Expanded(flex:1, child: _title(FARM_REG_SUBTITLES[0], 2, Colors.black, 15)),
        Spacer(),
        Expanded(
          flex:6,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              _imageProcessingCard(),
              _manualProcessingCard(),
            ],
          ),
        ),
      ],
    );

  }
  
  Widget _getImage() {
    return Text("Image processing here/ upload/ result");

  }

  Widget _stageCard(String stage, int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _stage = stage;
          STAGE_DAYS_MAP.forEach((key, value) {
            if(key == _variety.toLowerCase()) {
              for(int j = 0; j!=i+1; j++){
                endDays = value;
                _days = _days+endDays[j].toInt();
                _backDays = _days;
              }
            }
          });
          print("days = $_days");
          index = index + 1;
        });
      },
      child: Container (
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*.1,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(
          children: [
             Expanded(
              flex:1,
              child: AutoSizeText(
                BBCH_STAGES[i],
                maxLines: 1,
                stepGranularity: 0.1,
                minFontSize: 10,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                group: cardGroup,
              )
            ),
            Expanded(
              flex: 3,
              child: Image(image:AssetImage("${_variety.toLowerCase()}/${stage.replaceAll(" ", "")}.jpeg")),
            )
          ]
        )
      ),
    );
  }

  int updateDays(int i) {
    int up;
    print(_stage);
    int x = endDays[BBCH_STAGES.indexOf(_stage.toUpperCase())].toInt();
    print(x);
    up = _days - x;
    print((x~/_checkCount())*_bbch);
    up = up + (x~/_checkCount())*_bbch;
    
    return up;
  }

  Widget _bbchCard(String bbch, int i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print(index);
          if(index == 3) {
            index = index + 1;
            _bbch = i;
            _days = updateDays(i);
          }
            print("updated days = $_days");
        });
      },
      child: Container (
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height*.1,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image(image:AssetImage("${_variety.toLowerCase()}/$bbch.jpeg")),
            )
          ]
        )
      ),
    );
  }

  int _checkCount() {
    return _stage == "flowering" || _stage == "berry ripening" ? 4 : 6;
  }

  Widget _getStage() {  
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:1, child: _title(FARM_REG_TITLES[2], 2, Colors.green.shade800, 40)),
        Expanded(flex:1, child: _title(FARM_REG_SUBTITLES[1], 2, Colors.black, 15)),
        Spacer(),
        Expanded(
          flex:10,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: [
              _stageCard("inflorescence", 0),
              _stageCard("flowering", 1),
              _stageCard("berry development", 2),
              _stageCard("berry ripening", 3),
            ]
          ),
        ),
      ],
    );
  }
  
  List<Widget> children(){
    var children = List<Widget>.empty(growable: true);
    for(int i = 1; i < _checkCount(); i++ ) {
      children.add(_bbchCard(_stage.replaceAll(" ", "")+(i.toString()), i));
    }
    return children == null ? Container() : children;
  } 

  Widget _getBBCH() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:1, child: _title(FARM_REG_TITLES[3], 2, Colors.green.shade800, 40)),
        Expanded(flex:1, child: _title(FARM_REG_SUBTITLES[1], 2, Colors.black, 15)),
        _checkCount() == 4 ? SizedBox.shrink()
        : Expanded(flex: 1, child: _title(FARM_REG_SUBTITLES[2], 2, Colors.black, 15)),
        Spacer(),
        Expanded(
          flex:10,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children: children(),
          ),
        ),
      ],
    );
  }

  Widget _showResult(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex:1, child: _title(FARM_REG_TITLES[4], 2, Colors.green.shade800, 40)),
        Expanded(flex:1, child: _title(FARM_REG_SUBTITLES[3], 2, Colors.black, 15)),
        Spacer(),
        Expanded(flex:1, child: _title("Name: "+_farmName.text, 1, Colors.green.shade800, 40)),
        Expanded(flex:1, child: _title("Location: "+_farmLocation.text, 1, Colors.green.shade800, 40)),
        Expanded(flex:1, child: _title("Variety: "+_variety, 1, Colors.green.shade800, 40)),
        Expanded(
          flex:10,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children:[
              _bbchCard(_stage.replaceAll(" ", ""), 0),
              _bbchCard(_stage.replaceAll(" ", "")+_bbch.toString(), 0)
            ],
          ),
        ),
      ],
    );
  }


  Widget _showImageResult(){
    return Text("show _showImageResult");
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: HeaderBar(text: Text("Farm Registration")),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20,40,20,40),
          width: MediaQuery.of(context).size.width*.9,
          height: MediaQuery.of(context).size.height*.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: IndexedStack(
                  alignment: Alignment.center,
                  index: index,
                  children: [
                    _getBasicDetails(),
                    _getProcess(),
                    _getStage(),
                    _getBBCH(),
                    _showResult(),
                    _getImage(),
                    _showImageResult(),
                  ] 
                ),
              ),
              Expanded(
                flex: 2,
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
                          onPressed: () async {
                            setState(() {
                              if(index == 4)
                                _days = _backDays;
                              if(index == 3)
                                _days = 0;
                              index = index == 5 ? index - 4
                                : index - 1;

                            });
                          },
                        )
                      ),
                    Spacer(),
                    index != 0 && index <4 ? Spacer(flex: 2,)
                    : Expanded( 
                      flex: 2,
                      child :ElevatedButton(  
                        child: index == 4 || index == 6 ? Text('FINISH') : Text('NEXT'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade800,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          if(index == 4 || index == 6) {
                            Navigator.of(context).pop();
                            await DatabaseService().addFarm(
                              _farmName.text, 
                              _farmLocation.text, 
                              _variety.toUpperCase(),
                              _stage.toUpperCase(),
                              endDays.fold(0, (p, c) => p + c) - _days, 
                            );
                          }
                          else if(_newFarmKey.currentState.validate()) {
                            setState(() {
                              index = index + 1;
                            });
                          }
                        },
                      ),
                    )
                  ],
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}