import 'package:caphe_v2/models/event.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeEvents extends StatefulWidget {
  HomeEvents( this.index, {Key key}) : super(key: key);
  final int index;

  @override
  _HomeEventsState createState() => _HomeEventsState(this.index);
}

class _HomeEventsState extends State<HomeEvents> {
  _HomeEventsState(this.index);
  int index;
  List<Event> events;

  @override
  Widget build(BuildContext context) {
    final farms = Provider.of<List<Farm>>(context);
    int i = this.widget.index;
    events = farms == null ? null : farms[i].events;

    return farms == null 
      ? SizedBox.shrink()
      : ListView.builder(
        itemCount: farms[i].events.length,
        itemBuilder: (BuildContext context, int index) {
          return !DateTime.now().isBefore(DateFormat('yMd').parse(events[index].date)) ? Container()
          : Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width*.9,
                  child: Card(
                    child: Container(
                    decoration: BoxDecoration(
                      color:index%2 == 0 ? Colors.white : Colors.grey.shade700,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0)
                      ),
                      border: Border.all(
                        color: Colors.grey.shade700,
                        width: 2,
                      )
                    ),
                    height: 60,
                    padding: EdgeInsets.fromLTRB(10,5,10,5),
                      child: Row(
                        children: [
                          Expanded(
                            flex:1,
                            child: Text("${events[index].date}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color:index%2 != 0 ? Colors.white : Colors.grey.shade700,
                              ),
                            )
                          ),
                          Expanded(
                            flex:2,
                            child: Text("${events[index].name}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color:index%2 != 0 ? Colors.white : Colors.grey.shade700,
                              ),
                            )
                          ),
                        ]
                      ),
                    )  
                  )
                ),
              ),
            ],
          );
        },
      );
  }
}