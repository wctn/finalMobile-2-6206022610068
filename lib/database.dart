import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String name, String weight, String height, String sex,
      String year, String bm) async {
    try {
      await firestore.collection("BMI").add({
        'height': height,
        'name': name,
        'weight': weight,
        'sex': sex,
        'year': year,
        'bm': bm,
        'times': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("BMI").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('BMI').orderBy('times').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "name": doc['name'],
            "height": doc["height"],
            "weight": doc["weight"],
            "sex": doc["sex"],
            "year": doc["year"],
            "bm": doc["bm"]
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String name, String weight, String height,
      String sex, String year, String bm) async {
    try {
      await firestore.collection("BMI").doc(id).update({
        'name': name,
        'weight': weight,
        'height': height,
        'sex': sex,
        'year': year,
        'bm': bm
      });
    } catch (e) {
      print(e);
    }
  }
}
