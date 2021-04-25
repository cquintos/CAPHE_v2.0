import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../about_screen.dart';

class LoginFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded( flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                "Powered by:",
                maxLines: 1,
                stepGranularity: 2,
                minFontSize: 10,
                maxFontSize: 30,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ),
          Expanded( flex: 2,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded( flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage( alignment: Alignment.topLeft, image: AssetImage("assets/dost-pcaarrd-uplb.png"), fit: BoxFit.contain, )
                    ),
                  ),
                ),
                Expanded( flex: 2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: Offset(10.0, 10.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: IconButton(
                        icon: Icon( Icons.add, color: Colors.white),
                        iconSize: 150, 
                        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen())); },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded( flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomLeft,
                  image: AssetImage("assets/header_green.png"),
                  fit: BoxFit.contain,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}