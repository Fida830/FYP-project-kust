import 'dart:io';

import 'package:a_car_rental/widgets/Models/vehicle_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminHomeScreen.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminNotification.dart';
import 'package:a_car_rental/widgets/Screens/Admin/VehicleInformation.dart';
import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:a_car_rental/widgets/Services/upload_file_services.dart';

import 'package:a_car_rental/widgets/Services/vehicle_services.dart';
import 'package:a_car_rental/widgets/Utils/Utils_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'UserInformation.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  // --- Controllers ---
  TextEditingController VehicleName = TextEditingController();
  TextEditingController VehicleModelYear = TextEditingController();
  TextEditingController VehicleNo = TextEditingController();
  TextEditingController VehicleColor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    VehicleServices _VehicleServices = VehicleServices();

    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminNotification()));
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.notification_add,
                size: 30,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Add Vehicle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),),
              ),
              const SizedBox(height: 10),
              Container(
                height: 600,
                width: 365,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          'Vehicle Information',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const Divider(
                        thickness: 6,
                        color: Colors.indigo,
                        indent: 20.0,
                        endIndent: 160,
                      ),


                      Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    clipBehavior: Clip.hardEdge,
                                    child: imageUrl == ''
                                        ? Image.asset(
                                      'assets/image/car.png',
                                      fit: BoxFit.cover,
                                    )
                                        : Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffE0C3F6),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 19,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Add Picture",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //  VehicleName text-field
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: VehicleName,
                                  decoration: const InputDecoration(
                                    hintText: 'Vehicle Name',
                                    border: InputBorder.none,
                                  ),
                                  validator: (Name) =>
                                  Name != null && Name.length < 3
                                      ? 'Enter a vehicle name (at least 3 characters)'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            //  VehicleModelYear text-field
                            Container(
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: VehicleModelYear,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Vehicle Model Year',
                                    border: InputBorder.none,
                                  ),
                                  validator: (year) => year != null &&
                                      (year.length < 4 || year.length > 4)
                                      ? 'Enter like this "2023"'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            //  VehicleNo text-field
                            Container(
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: VehicleNo,
                                  decoration: const InputDecoration(
                                    hintText: 'VehicleNo',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) =>
                                  value!.isEmpty ? 'Enter vehicle no' : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),

                            //  VehicleColor text-field
                            Container(
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: VehicleColor,
                                  decoration: const InputDecoration(
                                    hintText: 'Vehicle Color',
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) =>
                                  value!.isEmpty ? 'Enter vehicle color' : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const SizedBox(width: 65),
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 4,
                                          offset:
                                          Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminHomeScreen()));
                                    },
                                    child: const Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 4,
                                          offset:
                                          Offset(4, 8), // Shadow position
                                        ),
                                      ],
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _VehicleServices
                                            .createVehicle(VehicleModel(
                                          vid: FirebaseAuth.instance.currentUser!.uid,
                                          VehicleName: VehicleName.text,
                                          VehicleModelYear: VehicleModelYear.text,
                                          VehicleNo: VehicleNo.text,
                                          VehicleColor: VehicleColor.text,
                                          image: imageUrl,
                                        ))
                                            .then((value) {
                                          Utils.showSnackBar(
                                              "Vehicle Created successfully");

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VehicleInformation()));
                                        });
                                      }
                                    },
                                    child: const Center(
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  ImagePicker picker = ImagePicker();

  File? file;

  String imageUrl = "";

  Future getImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedFile != null && pickedFile.path != null) {
      file = File(pickedFile.path);
      setState(() {});
      imageUrl = await UploadFileServices().getUrl(context, file: file!);
      setState(() {});
    }
  }
}
