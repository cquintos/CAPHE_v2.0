import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/ChoiceWrapper.dart';
import 'package:caphe_v2/models/city.dart';
import 'package:intl/intl.dart';
import 'package:caphe_v2/screens/add_farm_screen.dart/step_title.dart';
import 'package:caphe_v2/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Step1 extends StatefulWidget {
  Step1(this.newFarmKey, this.farmName, this.choices, this.titleGroup);
  final Key newFarmKey;
  final TextEditingController farmName;
  final ChoicesWrapper choices;
  final AutoSizeGroup titleGroup;

  @override
  _Step1State createState() => _Step1State(
    this.newFarmKey, 
    this.farmName, 
    this.choices, 
    this.titleGroup
  );
}

class _Step1State extends State<Step1> {
  Key newFarmKey;
  TextEditingController farmName;
  ChoicesWrapper choices;
  AutoSizeGroup titleGroup;
  String _value;
  String _location;

  _Step1State(
    this.newFarmKey, 
    this.farmName, 
    this.choices,
    this.titleGroup
  );

  @override
  Widget build(BuildContext context) {
    final cities = Provider.of<List<City>>(context);

    return Form(
      key: widget.newFarmKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(flex:2, child: StepTitle(FARM_REG_TITLES[0], 2, Colors.green.shade800, 40, widget.titleGroup)),
          Expanded(flex:3, child: _addTextField(widget.farmName, Icons.account_box_rounded, "Farm Name")),
          Expanded(
            flex:3,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.location_pin),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                        onChanged: (value) => setState(() {widget.choices.location = _location = value;}),
                        hint:Text(
                          "Please choose a location",
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
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.eco),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                          "Please choose a variety  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        onChanged: (value) { setState(() { widget.choices.currentVariety = _value = value;}); }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      )
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
        textInputAction: TextInputAction.done,
        decoration: BORDERED_TEXTFIELD_DECOR.copyWith(
          icon: Icon(
            icon, 
            color: Colors.black
          ),
          labelText: label,
          suffixIcon: IconButton( 
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback( (_) => controller.clear());
            },
            icon: Icon(Icons.clear), 
          ), 
        ) 
      ),
    );
  }
}