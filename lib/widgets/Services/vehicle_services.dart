import 'package:a_car_rental/widgets/Models/vehicle_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VehicleServices {
  ///Create Vehicle
  Future createVehicle(VehicleModel vehicleModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("Vehicle")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    return await docRef.set(vehicleModel.toJson(docRef.id));
  }

  Stream<List<VehicleModel>> fetchVehicle(String vehicleid) {
    return FirebaseFirestore.instance
        .collection("Vehicle")
        .where("vid", isEqualTo: vehicleid)
        .snapshots()
        .map((docList) =>
        docList.docs.map((e) => VehicleModel.fromJson(e.data())).toList());
  }

  /// fetch all Vehicles
  Stream<List<VehicleModel>> fetchAllVehicle() {
    return FirebaseFirestore.instance.collection("Vehicle").snapshots().map(
            (docList) =>
            docList.docs.map((e) => VehicleModel.fromJson(e.data())).toList());
  }

  Stream<VehicleModel> streamVehicles(String id) {
    return FirebaseFirestore.instance.collection("Vehicle")
        .doc(id)
        .snapshots()
        .map((event) => VehicleModel.fromJson(event.data()!));
  }
}
