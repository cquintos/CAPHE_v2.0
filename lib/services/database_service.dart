import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caphe_v2/models/farm.dart';
import 'package:caphe_v2/models/farmer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final uid = FirebaseAuth.instance.currentUser.uid;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  DatabaseService();

  Future<void> updateUserData(String nickname, String municipality, String province) async {
                                                                  
    return await userCollection.doc(uid).set({
      'nickname': nickname,
      'municipality' : municipality,
      'province' : province
    });
  }

  Future<void> addFarm(String name, String location, String variety, String stage, int bbch, double heatUnits ) async {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yMd').format(now);
    
    await userCollection.doc(uid).collection("farms").add({
      'name': name,
      'location': location,
      'date': DateTime.now(),
      'currentStage': stage,
      'currentHeatUnits' : heatUnits,
      'stage': stage,
      'bbch': bbch,
      'variety': variety,
      'heatUnits' : heatUnits
    });
  }

  Future<void> updateFarm(String name, String location, String variety, String id, String currentStage, double currentHeatUnits) async {
    
    return await userCollection.doc(uid).collection('farms').doc(id).update({
      'name': name,
      'location': location,
      'variety': variety,
      'currentStage' : currentStage,
      'currentHeatUnits' : currentHeatUnits,
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
      Timestamp t = doc['date'];
      DateTime date = t.toDate();

      return Farm(
        doc.id,
        date ?? null,
        doc['heatUnits']  ?? 0.0,
        doc['stage'] ?? '',
        doc['bbch'] ?? 51,
        name: doc['name'] ?? '',
        location: doc['location'] ?? '',
        currentStage: doc['currentStage'] ?? '',
        variety: doc['variety'] ?? '',
        currentHeatUnits: doc['currentHeatUnits'],
      );
    }).toList(); 

  }
  //returns list of farms to be streamed
  Stream<List<Farm>> get farms {
 
    return userCollection.doc(uid).collection('farms').orderBy("date", descending: false).snapshots()
      .map(_farmListFromSnapshot);
  }

  //maps data from database to data model 
  Farmer _farmerDataFromSnapshot(DocumentSnapshot snapshot) {

    return Farmer(
      uid: uid,
      nickname: snapshot["nickname"],
      municipality: snapshot["municipality"],
      province: snapshot["province"],
    );
  }

  //returns data of farmer to be streamed
  Stream<Farmer> get farmer {

    return userCollection.doc(uid).snapshots()
      .map(_farmerDataFromSnapshot);
  }
}