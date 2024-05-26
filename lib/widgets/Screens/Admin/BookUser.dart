import 'package:a_car_rental/widgets/Models/add_user_model.dart';
import 'package:a_car_rental/widgets/Models/admin_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminHomeScreen.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminNotification.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminProfileScreen.dart';
import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:a_car_rental/widgets/Screens/Auth/AdminLoginScreen.dart';
import 'package:a_car_rental/widgets/Services/add_user_services.dart';
import 'package:a_car_rental/widgets/Services/admin_services.dart';
import 'package:a_car_rental/widgets/Utils/Utils_error.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserInformation.dart';

class BookUser extends StatefulWidget {
  const BookUser({Key? key}) : super(key: key);

  @override
  State<BookUser> createState() => _BookUserState();
}

class _BookUserState extends State<BookUser> {
  // --- Controllers ---
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController CNIC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    AddUserServices _userServices = AddUserServices();

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
                  'Add User',
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
                          'User Information',
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

                      //  Full Name text-field
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Container(                   //..Full Name Container
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: fullName,
                                  decoration: const InputDecoration(
                                    hintText: 'Full Name',
                                    border: InputBorder.none,
                                  ),
                                  validator: (fullName) =>
                                  fullName != null && fullName.length < 3
                                      ? 'Enter a name (at least 3 characters)'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(                         //..Email Container
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    border: InputBorder.none,
                                  ),
                                  validator: (email) =>
                                  email != null && !EmailValidator.validate(email)
                                      ? 'Enter a valid email'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(                      //..PhoneNo Container
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: phoneNo,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: 'PhoneNo',
                                    border: InputBorder.none,
                                  ),
                                  validator: (phoneNo) => phoneNo != null &&
                                      (phoneNo.length < 13 || phoneNo.length > 13)
                                      ? 'Enter +92 then phoneNo'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(                                 //..Address Container..//
                              height: 50,
                              width: 400,//MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                  controller: address,
                                  decoration: const InputDecoration(
                                    hintText: 'Address',
                                    border: InputBorder.none,
                                  ),
                                  validator: (fullName) =>
                                  fullName != null && fullName.length < 3
                                      ? 'Enter an address (at least 3 characters)'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
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
                                  controller: CNIC,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'CNIC',
                                    border: InputBorder.none,
                                  ),
                                  validator: (CNIC) => CNIC != null &&
                                      (CNIC.length < 13 || CNIC.length > 13)
                                      ? 'Enter 13 digits CNIC'
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
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
                                        _userServices
                                            .createUser(AddUserModel(
                                          uid: FirebaseAuth.instance.currentUser!.uid,
                                          fullName: fullName.text,
                                          email: email.text,
                                          phoneNo: phoneNo.text,
                                          address: address.text,
                                          CNIC: CNIC.text,
                                        ))
                                            .then((value) {
                                          Utils.showSnackBar(
                                              "User Created successfully");

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserInformation()));
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
}
