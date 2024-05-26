import 'package:a_car_rental/widgets/Models/add_user_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminNotification.dart';
import 'package:a_car_rental/widgets/Screens/Admin/UsersDetails.dart';
import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:a_car_rental/widgets/Services/add_user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_card.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavBar(),
      appBar: AppBar(
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
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "USER",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                  color: const Color(0xFF8ECAE6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 575,
                  width: MediaQuery.of(context).size.width,
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
                            'Users',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
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
                                  return


                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => UsersDetails()));
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0xffDDDDDD),
                                                      blurRadius: 6.0,
                                                      spreadRadius: 2.0,
                                                      offset: Offset(0.0, 0.0),
                                                    )
                                                  ]),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const CircleAvatar(),
                                                        const SizedBox(width: 15),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              list[i].fullName.toString(),
                                                              style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                            Text(
                                                              list[i].phoneNo.toString(),
                                                              style: const TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w400),
                                                            ),
                                                            Text(
                                                              list[i].email.toString(),
                                                              style: const TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w400),
                                                            ),
                                                            const SizedBox(height: 20),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height: 50,
                                                                        child: Image.asset(
                                                                          'assets/image/car.png',
                                                                        )),
                                                                    Text('')
                                                                  ],
                                                                ),
                                                                const SizedBox(width: 30),
                                                                Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height: 50,
                                                                      child: Image.asset(
                                                                          'assets/image/debit_card.png'),
                                                                    ),
                                                                    Text('')
                                                                  ],
                                                                ),
                                                                const SizedBox(width: 30),
                                                                Column(
                                                                  children: [
                                                                    SizedBox(
                                                                        height: 50,
                                                                        child: Image.asset(
                                                                            'assets/image/map.png')),
                                                                    Text(list[i].address.toString())
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );




                                    Card(
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                            "assets/image/car_2.png"), //list[i].image.toString()
                                      ),
                                      title: Text(list[i].fullName.toString()),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(list[i].email.toString()),
                                          Text(list[i].CNIC.toString()),
                                          Text(list[i].address.toString()),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),




                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemCount: 2,
                        //     itemBuilder: (context, i) {
                        //       return const Padding(
                        //         padding: EdgeInsets.all(8.0),
                        //         child: HomeCard(),
                        //       );
                        //     }),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
