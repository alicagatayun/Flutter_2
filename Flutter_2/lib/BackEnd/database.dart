import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dikmen/models/user.dart';
import 'package:dikmen/models/user_register.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //Collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String name, String surname, String gender, String phoneNumber) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'surname': surname,
      'gender': gender,
      'phoneNumber': phoneNumber,
    });
  }

  //brew list from snapshot
  /*List<Register> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Register(
          name: doc.data['name'] ?? '',
          surname: doc.data['surname'] ?? '',
          gender: doc.data['gender'] ?? '',
          phoneNumber: doc.data['phoneNumber'] ?? '',
          adresler: doc.data['adresler'] ?? '');
    }).toList();
  }*/

  //user data from snapshot
  /*UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        surname: snapshot.data['surname'],
        gender: snapshot.data['gender'],
        phoneNumber: snapshot.data['phoneNumber'],
        adresler: snapshot.data['adresler']);
  }
*/
  //get userdata stream
  /*Stream<List<Register>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }*/

  /* Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }*/
}
