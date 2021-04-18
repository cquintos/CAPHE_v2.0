import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class RegisterRecapContent extends StatelessWidget {
  final List<TextEditingController> controllers;
  
  const RegisterRecapContent( this.controllers, {Key key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = ["Phone", "Name", "Street", "Barangay", "City", "Province", "Country"];
    var myGroup = AutoSizeGroup();

    return Row(
      children: [ 
        Expanded( flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              for(int i=0; i<7; i++) 
                AutoSizeText(
                  titles[i],
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  stepGranularity: 2,
                  minFontSize: 10,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                  group: myGroup,
                )
            ]
          )
        ),
        Expanded( flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              for(int i=0; i<7; i++) 
                AutoSizeText(
                  i < 6? controllers[i].text : "Philippines",
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  stepGranularity: 2,
                  minFontSize: 10,
                  style: TextStyle( fontSize: 40, ),
                  group: myGroup,
                )
            ]
          ),
        ),
      ]
    );
  }
}