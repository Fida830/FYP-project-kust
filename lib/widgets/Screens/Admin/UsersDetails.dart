import 'package:a_car_rental/widgets/Screens/Admin/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'AddUsers.dart';
import 'AdminNotification.dart';
import 'UserInformation.dart';

class UsersDetails extends StatefulWidget {
  const UsersDetails({Key? key}) : super(key: key);

  @override
  State<UsersDetails> createState() => _UsersDetailsState();
}

int selectIndex = 1;

class _UsersDetailsState extends State<UsersDetails> {
  @override
  Widget build(BuildContext context) {
    // TabController _tabController = TabController(length: 3, vsync: this);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AdminNavBar(),
        appBar: AppBar(
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
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'User Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
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
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Name'),
                          ),
                          const SizedBox(width: 60),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Fida Muhammad'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('CNIC'),
                          ),
                          const SizedBox(width: 64),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('14101-9090990-2'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Email'),
                          ),
                          const SizedBox(width: 62),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('muhammadfida830@gmail.com'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Contact'),
                          ),
                          const SizedBox(width: 48),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('08676547890 '),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Address'),
                          ),
                          const SizedBox(width: 46),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Dhoda  Road  Kohat'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
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
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Name'),
                          ),
                          const SizedBox(width: 60),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Fida Muhammad'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('CNIC'),
                          ),
                          const SizedBox(width: 64),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('14101-9090990-2'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Email'),
                          ),
                          const SizedBox(width: 62),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('muhammadfida830@gmail.com'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Contact'),
                          ),
                          const SizedBox(width: 48),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('08676547890 '),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Address'),
                          ),
                          const SizedBox(width: 46),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Dhoda  Road  Kohat'),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        margin: const EdgeInsets.fromLTRB(200, 230, 20, 10),
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
                                    builder: (context) => UserInformation()));
                          },
                          child: const Center(
                              child: Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddUsers()));
          },
          backgroundColor: Colors.indigo,
          child: const Text('Edit'),
        ),
      ),
    );
  }
}
