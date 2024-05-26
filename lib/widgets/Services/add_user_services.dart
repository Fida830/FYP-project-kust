import 'package:a_car_rental/widgets/Models/add_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddUserServices {
  ///Create add_user
  Future createUser(AddUserModel UserModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("Added User")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await docRef.set(UserModel.toJson(docRef.id));
  }

  Stream<List<AddUserModel>> fetchUser(String userid) {
    return FirebaseFirestore.instance
        .collection("Added User")
        .where("uid", isEqualTo: userid)
        .snapshots()
        .map((docList) =>
        docList.docs.map((e) => AddUserModel.fromJson(e.data())).toList());
  }

  /// fetch all add_users
  Stream<List<AddUserModel>> fetchAllUser() {
    return FirebaseFirestore.instance.collection("Added User").snapshots().map(
            (docList) =>
            docList.docs.map((e) => AddUserModel.fromJson(e.data())).toList());
  }

  Stream<AddUserModel> streamUsers(String id) {
    return FirebaseFirestore.instance.collection("Added User")
        .doc(id)
        .snapshots()
        .map((event) => AddUserModel.fromJson(event.data()!));
  }
}
