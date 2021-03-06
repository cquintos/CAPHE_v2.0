import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/models/farmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final farmer = Provider.of<Farmer>(context);

    return Container(
      padding: EdgeInsets.fromLTRB(26,20,26,0),
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
           Expanded( flex: 2, 
            child: AutoSizeText(
              "Hello ${farmer.nickname}",
              maxLines: 2,
              stepGranularity: 2,
              minFontSize: 20,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded( flex: 2, 
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
                "Summary of your Coffee Farms:",
                maxLines: 2,
                stepGranularity: 2,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Spacer( flex: 1 ),
          // Expanded( flex: 1,
          //   child: ElevatedButton.icon(
          //     onPressed:() {}, 
          //     icon: Icon(Icons.arrow_back_ios_sharp), 
          //     label: Text("Other Farms"),
          //   ),
          // )
        ],
      ),
    );
  }
}