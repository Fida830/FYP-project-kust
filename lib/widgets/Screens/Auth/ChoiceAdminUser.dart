import 'package:a_car_rental/widgets/Screens/Auth/AdminLoginScreen.dart';
import 'package:a_car_rental/widgets/Screens/Auth/AdminRegisterScreen.dart';
import 'package:a_car_rental/widgets/Screens/Auth/UserLoginScreen.dart';
import 'package:a_car_rental/widgets/Screens/Auth/UserRegisterScreen.dart';
import 'package:flutter/material.dart';

class ChoiceAdminUser extends StatelessWidget {
  const ChoiceAdminUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //     width: MediaQuery.of(context).size.width,
              //     child: Image.asset(
              //       'assets/image/clip.png',
              //       fit: BoxFit.cover,
              //     )),
              const SizedBox(height: 300),
              Center(
                child: Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.indigo,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginScreen()));
                  },
                        // onPressed: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => AdminRegisterScreen()));
                        // },
                        child: const Center(
                          child: Text(
                            'Admin',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'OR',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.indigo,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserLoginScreen()));
                    },
                    child: const Center(
                      child: Text(
                        'User',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 200),
              const Text(
                'Please choose your option',
                style: TextStyle(
                    color: Colors.indigo, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
