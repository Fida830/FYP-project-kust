import 'package:flutter/material.dart';

class VehicleDetailes extends StatefulWidget {
  const VehicleDetailes({Key? key}) : super(key: key);

  @override
  State<VehicleDetailes> createState() => _VehicleDetailesState();
}

class _VehicleDetailesState extends State<VehicleDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
             height: MediaQuery.of(context).size.height,
             width: MediaQuery.of(context).size.width,
             color: Colors.white,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                   child: Text(
                   "Cars Details",
                   style: TextStyle(color: Colors.black,fontSize: 30),
            )),
          ],
        ),
      )),
    );
  }
}
