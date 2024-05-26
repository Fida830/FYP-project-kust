import 'package:a_car_rental/widgets/Screens/Auth/AdminLoginScreen.dart';
import 'package:a_car_rental/widgets/Services/Admin_auth_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class AdminForgotPasswordScreen extends StatefulWidget {
  const AdminForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<AdminForgotPasswordScreen> createState() =>
      _AdminForgotPasswordScreenState();
}

class _AdminForgotPasswordScreenState extends State<AdminForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  // --- Controllers ---
  final email = TextEditingController();
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AdminAuthServices _ownerAuthServices = AdminAuthServices();

    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/image/clip.png',
                      fit: BoxFit.cover,
                    )),
                Image.asset('assets/image/car_picture.jpg'),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: 'Enter Your Email to Reset Password',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        )
                      ])),
                    )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
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
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid email'
                                    : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 330,
                        child: ElevatedButton(
                            onPressed: () {
                              _ownerAuthServices
                                  .resetPassword(email: email.text.trim())
                                  .then((value) {
                                email.clear();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Email has been send to Your $email"),
                                  backgroundColor: Colors.blue,
                                ));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                            ),
                            child: const Text('Reset',
                                style: TextStyle(color: Colors.white))),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 330,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white60,
                          ),
                          child: const Text('Cancel',
                              style: TextStyle(color: Colors.indigo)),
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
    );
  }
}
