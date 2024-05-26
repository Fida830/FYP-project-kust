import 'package:a_car_rental/widgets/Models/vehicle_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:a_car_rental/widgets/Screens/User/google_map_screen.dart';
import 'package:a_car_rental/widgets/Services/vehicle_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Container.dart';
import 'UsersDetails.dart';

class VehicleManagement extends StatefulWidget {
  const VehicleManagement({Key? key}) : super(key: key);

  @override
  State<VehicleManagement> createState() => _VehicleManagementState();
}

class _VehicleManagementState extends State<VehicleManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
        title: const Text('Vehicle Management'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 1;
                        });
                      },
                      child: Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Text('All',
                                style: TextStyle(
                                  color: selectIndex == 1 ? Colors.red : null,
                                )),
                            const SizedBox(height: 8),
                            Container(
                              height: 3,
                              width: 100,
                              color: selectIndex == 1 ? Colors.red : null,
                            )
                          ],
                        ),
                      ))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 2;
                        });
                      },
                      child: Expanded(
                          child: Column(
                        children: [
                          Text('Booked ',
                              style: TextStyle(
                                color: selectIndex == 2 ? Colors.red : null,
                              )),
                          const SizedBox(height: 5),
                          Container(
                            height: 3,
                            width: 100,
                            color: selectIndex == 2 ? Colors.red : null,
                          )
                        ],
                      ))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = 3;
                        });
                      },
                      child: Expanded(
                          child: Column(
                        children: [
                          Text('Location ',
                              style: TextStyle(
                                color: selectIndex == 3 ? Colors.red : null,
                              )),
                          const SizedBox(height: 5),
                          Container(
                            height: 3,
                            width: 100,
                            color: selectIndex == 3 ? Colors.red : null,
                          )
                        ],
                      ))),
                ],
              ),
            ),
            const SizedBox(height: 20),



            if (selectIndex == 1)
              StreamProvider.value(
                initialData: [VehicleModel()],
                value: VehicleServices()
                    .fetchVehicle(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, ctx) {
                  List<VehicleModel> list = context.watch<List<VehicleModel>>();
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2016/04/01/12/16/car-1300629_1280.png"), //list[i].image.toString()
                            ),
                            title: Text(list[i].VehicleName.toString()),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(list[i].VehicleModelYear.toString()),
                                Text(list[i].VehicleNo.toString()),
                                Text(list[i].VehicleColor.toString()),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),

              // Center(
              //     child: Container(
              //         child: ListView.builder(
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             itemCount: 2,
              //             itemBuilder: (context, i) {
              //               return Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: CarTile(
              //                     imageUrl: 'assets/image/car_2.png',
              //                     carName: 'Marsides',
              //                     num: 2),
              //               );
              //             }))),
            if (selectIndex == 2)
              StreamProvider.value(
                initialData: [VehicleModel()],
                value: VehicleServices()
                    .fetchVehicle(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, ctx) {
                  List<VehicleModel> list = context.watch<List<VehicleModel>>();
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2017/03/05/15/29/aston-martin-2118857_1280.jpg"), //list[i].image.toString()
                            ),
                            title: Text(list[i].VehicleName.toString()),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(list[i].VehicleModelYear.toString()),
                                Text(list[i].VehicleNo.toString()),
                                Text(list[i].VehicleColor.toString()),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              // Center(
              //     child: ListView.builder(
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemCount: 2,
              //         itemBuilder: (context, i) {
              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: CarTile(
              //                 imageUrl: 'assets/image/car_2.png',
              //                 carName: 'Honda',
              //                 num: 2),
              //           );
              //         })),




            //============ Ye RUN mei ERROR KI WAJA YE CODE HAI ================
            //============ Incorrect use of ParentDataWidget.
            //==================================================================
            if (selectIndex == 3)
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                      color: Colors.blue,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleMapScreen()));
                    },
                    child: const Center(
                        child: Text(
                      "Google Map Location",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
