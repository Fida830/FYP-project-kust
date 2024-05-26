import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  final String imageUrl;
  final String carName;
  final int num;
  const CarTile({Key? key, required this.imageUrl, required this.carName, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blue,
      trailing: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
        ),
        child: Text(num.toString()),
      ),
      title: Text(carName),
      leading:Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
         image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill)
        ),
      )
    );
  }
}


