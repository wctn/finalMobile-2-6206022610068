import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String name, String sex, String age, String weight,
      String height, String bmi) async {
    try {
      await firestore.collection("BMI").add({
        'height': height,
        'sex': sex,
        'age': age,
        'name': name,
        'weight': weight,
        'bmi': bmi,
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
            "sex": doc["sex"],
            "age": doc["age"],
            "height": doc["height"],
            "weight": doc["weight"],
            "bmi": doc["bmi"]
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String name, String sex, String age,
      String weight, String height, String bmi) async {
    try {
      await firestore.collection("BMI").doc(id).update({
        'name': name,
        'sex': sex,
        'age': age,
        'weight': weight,
        'height': height,
        'bmi': bmi
      });
    } catch (e) {
      print(e);
    }
  }
}
