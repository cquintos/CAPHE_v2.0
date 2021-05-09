import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/services/database_service.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';

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
  TextEditingController _formLocation;
  
  void initState() {
    super.initState();
    _formName = new TextEditingController(text: this.widget.farm.name);
    _formLocation = new TextEditingController(text: this.widget.farm.location);
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

    return SingleChildScrollView(
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
                _addTextField(_formLocation, Icons.location_pin, "Location Name"),
                Row(
                  children: <Widget>[
                    Text("Select Variety: "),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: DropdownButton<String> (
                        value: _value,
                        items: VARIETY_LIST
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        onChanged: (value) => setState(() => _value = value),
                      ),
                    ),
                  ],
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
                          Navigator.of(context).pop();
                          await DatabaseService()
                            .updateFarm(
                              _formName.text,
                              _formLocation.text,
                              _value,
                              this.widget.farm.id,
                              this.widget.farm.stage
                            );
                        }
                      },
                    ),
                    ElevatedButton(
                      child: Text('cancel'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
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