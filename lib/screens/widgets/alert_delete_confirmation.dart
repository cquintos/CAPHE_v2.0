import 'package:auto_size_text/auto_size_text.dart';
import 'package:caphe_v2/services/database_service.dart';
import 'package:flutter/material.dart';

class AlertDeleteConfirmation extends StatefulWidget {
  AlertDeleteConfirmation(this.id);
  final String id;

  @override
  _AlertDeleteConfirmationState createState() => _AlertDeleteConfirmationState();
}

class _AlertDeleteConfirmationState extends State<AlertDeleteConfirmation> {
  @override
  Widget build(BuildContext context) {
    
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height*.2,
            width: MediaQuery.of(context).size.width*.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded( flex: 2,
                  child: AutoSizeText(
                    "Are you sure to delete this farm?",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25
                    ),
                  ),
                ),
                Expanded( flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: Text("DELETE"),
                        style: ElevatedButton.styleFrom( 
                          primary: Colors.red, 
                          onPrimary: Colors.white, 
                        ),
                        onPressed: () async {
                          await DatabaseService().deleteFarm(this.widget.id);
                          setState((){});
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text("CANCEL"), 
                        style: ElevatedButton.styleFrom( 
                          primary: Colors.grey, 
                          onPrimary: Colors.white, 
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        }, 
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }
}