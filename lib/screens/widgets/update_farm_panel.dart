import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/city.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/services/database_service.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class UpdateFarmPanel extends StatefulWidget {
  UpdateFarmPanel(this.farm,{Key key}) : super(key: key);
  final Farm farm;
  
  @override
  _UpdateFarmPanelState createState() => _UpdateFarmPanelState(this.farm);
}

class _UpdateFarmPanelState extends State<UpdateFarmPanel> {
  _UpdateFarmPanelState(Farm farm);
  final _updateFarmPanelFormkey = GlobalKey<FormState>();

  String _value;  
  TextEditingController _formName;
  String _location;
  bool isLoading = false;

  void initState() {
    super.initState();
    _formName = new TextEditingController(text: this.widget.farm.name);
    _location = this.widget.farm.location;
    _value = this.widget.farm.variety.toUpperCase();
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

  @override
  Widget build(BuildContext context) {
    final cities = Provider.of<List<City>>(context);

    return isLoading ? Loading() 
    : SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Form(
            key: _updateFarmPanelFormkey,
            child: Column(
              children: <Widget>[
                AutoSizeText(
                    "UPDATE FARM",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    stepGranularity: 0.1,
                    minFontSize: 15,
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                _addTextField(_formName, Icons.agriculture, "Farm Name"),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_pin),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0)
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          )
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String> (
                            value:_location,
                            items: cities
                              .map<DropdownMenuItem<String>>((City value) {
                                return DropdownMenuItem<String>(
                                  value: value.name,
                                  child: Text(value.name),
                                );
                              }).toList(),
                            onChanged: (value) => setState(() {_location = value;}),
                            hint:Text(
                              "Please choose a location           ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.eco),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0)
                          ),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          )
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String> (
                            value: _value,
                            items: VARIETY_LIST
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(toBeginningOfSentenceCase(value.toLowerCase())),
                                );
                              }).toList(),
                            hint:Text(
                              "Please choose a variety              ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            onChanged: (value) { setState(() { _value = value;}); }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text('UPDATE'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade800,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        if(_updateFarmPanelFormkey.currentState.validate()) {
                          setState((){isLoading = true;});
                          await DatabaseService()
                            .updateFarm(
                              _formName.text,
                              _location,
                              _value,
                              this.widget.farm.id,
                              this.widget.farm.currentStage,
                              this.widget.farm.currentHeatUnits
                            ).whenComplete(() => {
                                Navigator.of(context).pop()
                            });
                        }
                      },
                    ),
                    ElevatedButton(
                      child: Text('CANCEL'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}