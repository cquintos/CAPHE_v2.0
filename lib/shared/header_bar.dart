import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final Text text;
  const HeaderBar({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded( flex: 3,
            child: AutoSizeText(
              this.text.data,
              maxLines: 1,
              stepGranularity: 2,
              minFontSize: 10,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            )
          ),
          Expanded( flex:2,
            child: Image.asset(
              'assets/dost-pcaarrd-uplb.png',
              fit: BoxFit.fitHeight,
              // height: 32,
            ),
          )
        ]
      )
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight); 
}
