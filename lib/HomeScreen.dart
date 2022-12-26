import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/image/clip.png',
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  'assets/image/car_2.png',
                  fit: BoxFit.cover,
                  height: 160,
                  width: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Divider(
                  height: 10,
                  color: Colors.grey,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'info',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                 Container(
                   color: Colors.white,
                   height: 200,
                   width: MediaQuery.of(context).size.width,
                   child: Swiper(itemCount: 3,
                     itemBuilder: (BuildContext context, int i){
                     return Column(mainAxisAlignment: MainAxisAlignment.center,
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
                     pagination: SwiperPagination(
                       alignment: Alignment.bottomCenter,
                       builder: DotSwiperPaginationBuilder(
                         color: Colors.grey,
                         activeColor: Colors.black,
                       ),
                     ),
                     control: SwiperControl(
                       color: Colors.transparent
                     ),
                   ),
                 ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.indigo,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Task',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Container(
                        height: 60,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.black)
                           ),
                           child: Center(child: Text('User Managment',style: TextStyle(fontSize:30, fontWeight:FontWeight.bold, ),)),
                          ),
                         ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(child: Text('Vehicle Managment',style: TextStyle(fontSize:30, fontWeight:FontWeight.bold, ),)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(child: Text('Charges Managment',style: TextStyle(fontSize:30, fontWeight:FontWeight.bold, ),)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(child: Text('Setting ',style: TextStyle(fontSize:30, fontWeight:FontWeight.bold, ),)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 60,
                            width: 330,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(child: Text('Logout ',style: TextStyle(fontSize:30, fontWeight:FontWeight.bold, ),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> textList = [
    "First",
    "Second",
    "third",
  ];
  List<String> imageList =[
    "assets/image/car_picture.jpg",
    "assets/image/clip.png",
    "assets/image/car_2.png",
  ];
}
