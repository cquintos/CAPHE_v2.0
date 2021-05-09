import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/models/farmer.dart';
import 'package:caphe_v2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:caphe_v2/screens/home_screen/home_title.dart';
import 'package:caphe_v2/screens/home_screen/slide_builder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final farmer = Provider.of<Farmer>(context);
    final farm = Provider.of<List<Farm>>(context);

    return farmer == null || farm == null  ? Loading()
    : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(flex:7, child: SlideBuilder() ),
          Expanded(flex:2, child: HomeTitle() ),
        ]
      );
  }
}