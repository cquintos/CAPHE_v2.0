import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/authentication_service.dart';

class HomeCarouselCardLeft extends StatefulWidget {
  const HomeCarouselCardLeft({Key key, this.title, this.data, this.isPressed}) : super(key: key);
  final String title;
  final String data;
  final bool  isPressed;

  @override
  _HomeCarouselCardLeftState createState() => _HomeCarouselCardLeftState(this.isPressed);
}

class _HomeCarouselCardLeftState extends State<HomeCarouselCardLeft> {
  bool isPressed;
  
  _HomeCarouselCardLeftState(this.isPressed);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 33; 

    return Container(
      child: Column(
        children: <Expanded> [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: AutoSizeText(
                this.widget.title,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                this.widget.data,
                maxLines: 1,
                textAlign: TextAlign.left,
                stepGranularity: 10,
                minFontSize: 10,
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              alignment: Alignment.topLeft,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <IconButton> [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed  = !isPressed;
                        });
                      },
                      icon: (isPressed)?Icon(Icons.notifications_active, size:iconSize, ):Icon(Icons.notifications, size:iconSize,),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.edit, size:iconSize, ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signOut();
                      }, 
                      icon: Icon(Icons.delete, size:iconSize, ),
                    )
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}