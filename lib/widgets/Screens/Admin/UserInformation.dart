import 'package:a_car_rental/widgets/Models/add_user_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminHomeScreen.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminNotification.dart';
import 'package:a_car_rental/widgets/Screens/Admin/EditUserInformation.dart';
import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:a_car_rental/widgets/Screens/Auth/AdminLoginScreen.dart';
import 'package:a_car_rental/widgets/Services/add_user_services.dart';
import 'package:a_car_rental/widgets/Services/admin_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/admin_model.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminNotification()));
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                // 'Update Users',
                'Users',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Users Information',
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
                    StreamProvider.value(
                      initialData: [AddUserModel()],
                      value: AddUserServices()
                          .fetchUser(FirebaseAuth.instance.currentUser!.uid),
                      builder: (context, ctx) {
                        List<AddUserModel> list = context.watch<List<AddUserModel>>();
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: list.length,
                            itemBuilder: (context, i) {
                              return Card(
                                child:
                                Column(children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Name'),
                                      ),
                                      const SizedBox(
                                        width: 55
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(list[i].fullName.toString()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children:  [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('CNIC'),
                                      ),
                                      const SizedBox(
                                        width: 60
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(list[i].CNIC.toString()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Email'),
                                      ),
                                      const SizedBox(
                                        width: 58
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(list[i].email.toString()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Contact'),
                                      ),
                                      const SizedBox(
                                        width: 43
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(list[i].phoneNo.toString()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Address'),
                                      ),
                                      const SizedBox(
                                        width: 43
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(list[i].address.toString()),
                                      ),
                                    ],
                                  ),
                                ]),
                              );
                            });
                      },
                    ),



                    const SizedBox(height: 150,),
                    // Center(
                    //   child: Container(
                    //     height: 40,
                    //     width: 80,
                    //     decoration: BoxDecoration(
                    //         boxShadow: const [
                    //           BoxShadow(
                    //             color: Colors.black38,
                    //             blurRadius: 4,
                    //             offset:
                    //             Offset(4, 8), // Shadow position
                    //           ),
                    //         ],
                    //         color: Colors.blue,
                    //         border: Border.all(color: Colors.black),
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: TextButton(
                    //       onPressed: () {
                    //
                    //         // Navigator.of(context).push(MaterialPageRoute(
                    //         //   builder: (context) => EditUserInformation(
                    //         //     fullname: userData.fullName.toString(),
                    //         //     email: userData.email.toString(),
                    //         //     phoneNo: userData.phoneNo.toString(),
                    //         //     address: userData.address.toString(),
                    //         //     CNIC: userData.CNIC.toString(),
                    //         //
                    //         //   ),
                    //         // ),
                    //         // );
                    //       },
                    //       child: const Center(
                    //           child: Text(
                    //             "Edit",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold),
                    //           )),
                    //     ),
                    //   ),
                    // ),




                    // StreamProvider.value(
                    //   initialData: UserModel(),
                    //   value: AddUserServices()
                    //       .fetchUser(FirebaseAuth.instance.currentUser!.uid),
                    //   builder: (context, child) {
                    //     UserModel userData = context.watch<UserModel>();
                    //     return
                    //       Center(
                    //         child: Container(
                    //           height: 40,
                    //           width: 80,
                    //           decoration: BoxDecoration(
                    //               boxShadow: const [
                    //                 BoxShadow(
                    //                   color: Colors.black38,
                    //                   blurRadius: 4,
                    //                   offset:
                    //                   Offset(4, 8), // Shadow position
                    //                 ),
                    //               ],
                    //               color: Colors.blue,
                    //               border: Border.all(color: Colors.black),
                    //               borderRadius: BorderRadius.circular(10)),
                    //           child: TextButton(
                    //             onPressed: () {
                    //
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                 builder: (context) => EditUserInformation(
                    //                   fullname: userData.fullName.toString(),
                    //                   email: userData.email.toString(),
                    //                   phoneNo: userData.phoneNo.toString(),
                    //                   address: userData.address.toString(),
                    //                   CNIC: userData.CNIC.toString(),
                    //
                    //                 ),
                    //               ),
                    //               );
                    //             },
                    //             child: const Center(
                    //                 child: Text(
                    //                   "Edit",
                    //                   style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.bold),
                    //                 )),
                    //           ),
                    //         ),
                    //       );
                    //
                    //   },
                    // ),



                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
