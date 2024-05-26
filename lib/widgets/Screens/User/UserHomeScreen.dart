import 'package:a_car_rental/widgets/Screens/Admin/AdminNotification.dart';
import 'package:a_car_rental/widgets/Screens/Admin/Vehicle.Details.dart';
import 'package:a_car_rental/widgets/Screens/User/google_map_screen.dart';
import 'package:a_car_rental/widgets/Screens/User/user_drawer.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'VechileList.dart';

class UserHomeScreen extends StatefulWidget {
  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int currentIndex = 0;

  final screens = [
    HomeBottom(),
    VechileList(),
    Center(child: Text('favorite')),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String ownerId = "";
  String name = "";
  String email = "";
  String image = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,


      drawer: UserNavBar(),
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
              )),
        ],
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'cars list',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: 'favorite',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeBottom extends StatefulWidget {
  const HomeBottom({Key? key}) : super(key: key);

  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                    color: Color(0xFF8ECAE6),
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
              const Padding(
                padding: EdgeInsets.only(right: 100.0),
                child: Divider(
                  height: 10,
                  color: Colors.grey,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'info',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VechileList()));
                },
                child: Container(
                  color: Colors.white,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    autoplay: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 130,
                            width: 300,
                            color: Colors.indigo,
                            child: Image.asset(imageList[i]),
                          ),
                          Text(textList[i])
                        ],
                      );
                    },
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.indigo,
                        activeColor: Colors.black,
                      ),
                    ),
                    control: SwiperControl(color: Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(
                height: 50
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Container(
                  height: 40,
                  width: 200,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GoogleMapScreen()));
                    },
                    child: const Center(
                        child: Text(
                          "Google Map",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> textList = [
    "Toyota Corola",
    "Hiace Van",
    "Suzuki Bolan",
  ];
  List<String> imageList = [
    "assets/image/toyota_car.jpeg",
    "assets/image/van_car.jpg",
    "assets/image/car_suzuki.jpg",
  ];
}
