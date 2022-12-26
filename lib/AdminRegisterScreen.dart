import 'package:a_car_rental/AdminLoginScreen.dart';
import 'package:a_car_rental/HomeScreen.dart';
import 'package:flutter/material.dart';

class AdminRegisterScreen extends StatelessWidget {
  const AdminRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/image/clip.png',
                    fit: BoxFit.cover,
                  )
              ),
              SizedBox(height: 15,),
              Text('Create Account',style: TextStyle(fontSize: 36,color: Colors.indigo,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Conform Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                  ),
                  child:
                  Text('Create Account', style: TextStyle(color: Colors.white))),
              SizedBox(height: 15,),
              Text('Already have an account?',style: TextStyle(color: Colors.grey),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginScreen()));
              }, child: Text('Login',style: TextStyle(color: Colors.indigo),))
            ]),
      ),
    );
  }
}
