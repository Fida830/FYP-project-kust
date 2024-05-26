import 'package:a_car_rental/widgets/Screens/Auth/UserForgotPassword.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:a_car_rental/widgets/Screens/User/UserHomeScreen.dart';
import 'package:a_car_rental/widgets/Services/user_auth_services.dart';
import 'package:a_car_rental/widgets/Utils/Utils_error.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'UserRegisterScreen.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  // --- Controllers ---
  final email = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  UserAuthServices _customerAuthServices = UserAuthServices();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/image/clip.png',
                        fit: BoxFit.cover,
                      )),
                  Image.asset('assets/image/car_picture.jpg',
                    height: 150),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: 'RENT A ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'CAR',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          )
                        ])),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              controller: email,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                              ),
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              controller: password,
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 330,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                makeLoadingTrue();
                                _customerAuthServices
                                    .loginUser(
                                        email: email.text,
                                        password: password.text)
                                    .then((value) {
                                  email.clear();
                                  password.clear();
                                  makeLoadingFalse();
                                  Utils.showSnackBar("Login Successfully");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserHomeScreen()),
                                  );
                                }).onError((error, stackTrace) {
                                  makeLoadingFalse();
                                  Utils.showSnackBar("$error");
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                            ),
                            child: const Text('Login',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserForgotPasswordScreen()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account? ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserRegisterScreen()));
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
