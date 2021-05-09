import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/models/farmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final uid = FirebaseAuth.instance.currentUser.uid;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  DatabaseService();

  Future<void> updateUserData(String nickname, String street, String barangay, String municipality, String province) async {
                                                                  
    return await userCollection.doc(uid).set({
      'nickname': nickname,
      'street' : street + " " + barangay,
      'municipality' : municipality,
      'province' : province
    });
  }

  Future<void> addFarm(String name, String location, String variety, String stage, int days) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yMd').format(now);
    
    await userCollection.doc(uid).collection("farms").add({
      'name': name,
      'location': location,
      'date': formattedDate,
      'stage': stage,
      'days': days,
      'variety': variety,
    });
  }

  Future<void> updateFarm(String name, String location, String variety, String id, String stage) async {
    
    return await userCollection.doc(uid).collection('farms').doc(id).update({
      'name': name,
      'location': location,
      'variety': variety,
      'stage' : stage,
    });    
  }

  Future<void> deleteFarm(String id) async {
    
    await userCollection
      .doc(uid)
      .collection('farms')
      .doc(id)
      .delete()
      .catchError((error) => print("Failed to delete farm"));
  }

  //maps data from database to data model
  List<Farm> _farmListFromSnapshot(QuerySnapshot snapshot) {
 
    return snapshot.docs.map((doc) {
      return Farm(
        name: doc.data()['name'] ?? '',
        location: doc.data()['location'] ?? '',
        date: doc.data()['date'] ?? '',
        stage: doc.data()['stage'] ?? '',
        days: doc.data()['days'] ?? 000,
        variety: doc.data()['variety'] ?? '',
        id: doc.id
      );
    }).toList();
  }

  //returns list of farms to be streamed
  Stream<List<Farm>> get farms {
 
    return userCollection.doc(uid).collection('farms').orderBy("days", descending: false).snapshots()
      .map(_farmListFromSnapshot);
  }

  //maps data from database to data model 
  Farmer _farmerDataFromSnapshot(DocumentSnapshot snapshot) {

    return Farmer(
      uid: uid,
      nickname: snapshot.data()["nickname"],
      street: snapshot.data()["street"],
      municipality: snapshot.data()["municipality"],
      province: snapshot.data()["province"],
    );
  }

  //returns data of farmer to be streamed
  Stream<Farmer> get farmer {

    return userCollection.doc(uid).snapshots()
      .map(_farmerDataFromSnapshot);
  }
}