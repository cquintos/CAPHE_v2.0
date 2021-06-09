import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/models/farmer.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/home_screen/home_title.dart';
// import 'package:caphe_v2/screens/home_screen/slide_builder.dart';
import 'package:provider/provider.dart';

import 'mid_section.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final farmer = Provider.of<Farmer>(context);
    final farm = Provider.of<List<Farm>>(context);

    return farmer == null || farm == null  ? Loading()
    : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(flex:2, child: HomeTitle() ),
          Expanded(flex:10, child: MidSection() ),
          Expanded(
            flex:2, 
            child: Container(
              padding: EdgeInsets.fromLTRB(25,0,75,0),
              child: Align(
                alignment: Alignment.centerRight,
                child: AutoSizeText(
                  "Hey farmer, click this to add a farm! >",
                  maxLines: 2,
                  stepGranularity: 2,
                  minFontSize: 10,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ),
        ]
      );
  }
}