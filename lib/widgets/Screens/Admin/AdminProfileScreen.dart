import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frofile'),
      ),
      body: const SafeArea(
        child: Center(child: Text("You have no notification")),
      ),
    );
  }
}
