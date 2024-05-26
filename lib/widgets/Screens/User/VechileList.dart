import 'package:a_car_rental/widgets/Models/vehicle_model.dart';
import 'package:a_car_rental/widgets/Screens/User/Vehicle_detail.dart';
import 'package:a_car_rental/widgets/Services/vehicle_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VechileList extends StatefulWidget {
  const VechileList({Key? key,}) : super(key: key);


  @override
  State<VechileList> createState() => _VechileListState();
}

class _VechileListState extends State<VechileList> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(10, (i) => "Item $i");
  var items = <String>[

  ];

  @override
  void initState() {
    items = duplicateItems;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = duplicateItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),

              const Text(
                'Available Vehicles',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     onChanged: (value) {
              //       filterSearchResults(value);
              //     },
              //     controller: editingController,
              //     decoration: const InputDecoration(
              //         labelText: "Search",
              //         hintText: "Search",
              //         prefixIcon: Icon(Icons.search),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              //   ),
              // ),

              const SizedBox(height: 12),

              // Salon_Container
              StreamProvider.value(
                initialData: [VehicleModel()],
                value: VehicleServices().fetchAllVehicle(),
                builder: (context, ctx) {
                  List<VehicleModel> list = context.watch<List<VehicleModel>>();
                  return Container(
                    // height: MediaQuery.of(context).size.height * 0.45,
                    height:MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VehicleDetail(id: list[index].vid.toString()),
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 2, color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: list[index].image != ''
                                                ? NetworkImage(list[index]
                                                .image
                                                .toString())
                                                : NetworkImage(
                                                "https://cdn.pixabay.com/photo/2016/04/01/12/16/car-1300629_1280.png"),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width:
                                      MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          // Rating Bar Row
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                list[index].VehicleName.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              // const Spacer(),
                                            ],
                                          ),
                                          const SizedBox(height: 10),

                                          Row(
                                            children: [

                                              const SizedBox(width: 2),
                                               const Icon(
                                                Icons.color_lens_rounded,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                              Text(
                                                list[index].VehicleColor.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ]
                                          ),
                                          const SizedBox(height: 10),

                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: const Icon(
                                                  Icons.car_rental,
                                                  color: Colors.black,
                                                  size: 18,
                                                ),
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                list[index]
                                                    .VehicleModelYear
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [

                                              const SizedBox(width: 3),

                                              const Spacer(),
                                              SizedBox(
                                                height: 30,
                                                width: 80,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) => VehicleDetail(id: list[index].vid.toString()),
                                                    ));
                                                  },
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    backgroundColor:
                                                    const Color(
                                                        0xffE0C3F6),
                                                    side: const BorderSide(
                                                        width: 2,
                                                        color: Colors.black),
                                                    shape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            20)),
                                                  ),
                                                  child: const Text(
                                                    "View",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),






              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //         visualDensity: VisualDensity(vertical: 4),
              //       title: Text('${items[index]}'),
              //       leading:CircleAvatar(
              //         backgroundImage: AssetImage('assets/image/car_2.png'),
              //         minRadius: 50,
              //         maxRadius: 75,
              //       ),
              //
              //     );
              //
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}