import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'home_carousel_card.dart';

class FARM {
  
}

class HomeCarousel extends StatefulWidget {
  HomeCarousel({Key key}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int index = 0; 
  int count = 0;
  List<FARM> farmList; 

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // int _focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    
    return ScrollSnapList(
      onItemFocus: _onItemFocus,
      itemSize: deviceWidth*.9, 
      itemBuilder: _buildListItem,
      itemCount: count,
    );
  }
 
  @override
  void initState() { 
    super.initState();
    getFarmData();  
  }

  void _onItemFocus(int index) {
    setState(() {
      // _focusedIndex = index;
    });
  }
  
  Widget _buildListItem(BuildContext context, int index) {
    double deviceWidth = MediaQuery.of(context).size.width;

    index= index+1;
    return Container (
      width: deviceWidth*.9,
      child: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ HomeCarouselCard(), ],
        ),
      ),
    );
  }
  
  Future getFarmData() async {
    if(_auth.currentUser != null) {
      await _firestore
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('farms')
        .get()
        .then((QuerySnapshot snap) {
          setState(() {
            count = snap.size;
          });
        });
    }
  }

}

