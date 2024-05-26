import 'package:a_car_rental/widgets/Models/add_user_model.dart';
import 'package:a_car_rental/widgets/Models/vehicle_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminHomeScreen.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminNotification.dart';
import 'package:a_car_rental/widgets/Screens/Admin/EditUserInformation.dart';
import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:a_car_rental/widgets/Screens/Auth/AdminLoginScreen.dart';
import 'package:a_car_rental/widgets/Screens/User/fill_details.dart';
import 'package:a_car_rental/widgets/Services/add_user_services.dart';
import 'package:a_car_rental/widgets/Services/admin_services.dart';
import 'package:a_car_rental/widgets/Services/vehicle_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../../Models/admin_model.dart';

class VehicleDetail extends StatefulWidget {
  final String id;

  const VehicleDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  bool isLoading = false;
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<FavoriteProvider>(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: StreamProvider.value(
          initialData: VehicleModel(),
          value: VehicleServices().streamVehicles(widget.id),
          builder: (context, ctx) {
            VehicleModel vehicleData = context.watch<VehicleModel>();
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: vehicleData.image == ''
                          ? const NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/04/01/12/16/car-1300629_1280.png")
                          : NetworkImage(vehicleData.image.toString()),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    vehicleData.VehicleName.toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.car_rental),
                                  Text(
                                    vehicleData.VehicleModelYear.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 60,
                                child: TabBar(
                                    isScrollable: true,
                                    controller: controller,
                                    indicatorColor: Colors.purple,
                                    labelColor: Colors.black,
                                    labelStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    unselectedLabelStyle:
                                        const TextStyle(color: Colors.black54),
                                    tabs: const [
                                      Tab(child: Text("Details")),
                                    ]),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: TabBarView(
                                    controller: controller,
                                    children: [
                                      SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 20),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.blue
                                                          .withOpacity(.3),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 1),
                                                    ),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          child: ExpansionTile(
                                                            title: const Text(
                                                                'Vehicle Details'),
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Vehicle Name: ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                        "${vehicleData.VehicleName}")
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Vehicle Color: ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                        "${vehicleData.VehicleColor}")
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "VehicleNo: ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                        "${vehicleData.VehicleNo}")
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const Text(
                                                                      "Vehicle Model: ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                        "${vehicleData.VehicleModelYear}")
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: StreamProvider.value(
                                                initialData: AdminModel(),
                                                value: AdminServices()
                                                    .fetchUserRecord(widget.id),
                                                builder: (context, ctx) {
                                                  AdminModel adminData = context
                                                      .watch<AdminModel>();

                                                  phoneNumber = adminData
                                                      .phoneNumber
                                                      .toString();
                                                  return SizedBox(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                            height: 20),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.blue
                                                                .withOpacity(
                                                                    .3),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 5),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              child: ExpansionTile(
                                                                  title: const Text(
                                                                      'Contact-Owner'),
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Icon(
                                                                              Icons.email),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            adminData.email.toString(),
                                                                            style:
                                                                                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Icon(
                                                                              Icons.phone),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            adminData.phoneNumber.toString(),
                                                                            style:
                                                                                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      FillDetails(),
                                                ));
                                              },
                                              child: const Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void setLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  void setLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
