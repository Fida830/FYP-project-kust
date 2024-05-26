import 'package:a_car_rental/widgets/Models/admin_model.dart';
import 'package:a_car_rental/widgets/Services/Admin_auth_services.dart';
import 'package:a_car_rental/widgets/Services/admin_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'AdminLoginScreen.dart';

class AdminRegisterScreen extends StatefulWidget {
  @override
  State<AdminRegisterScreen> createState() => _AdminRegisterScreenState();
}

class _AdminRegisterScreenState extends State<AdminRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    //----- Controllers -----
    final fullName = TextEditingController();
    final email = TextEditingController();
    final phoneNumber = TextEditingController();
    final password = TextEditingController();
    final confirmPasswordController = TextEditingController();

    AdminAuthServices _ownerAuthServices = AdminAuthServices();
    AdminServices _ownerServices = AdminServices();

    bool isLoading = false;

    makeLoadingTrue() {
      isLoading = true;
      setState(() {});
    }

    makeLoadingFalse() {
      isLoading = false;
      setState(() {});
    }

    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                    width: 400, //MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/image/clip.png',
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: 15),
                const Text(
                  'Create Account',
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                //  Full name text-field
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    width: 400, //MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextFormField(
                        controller: fullName,
                        decoration: const InputDecoration(
                          hintText: 'Full Name',
                          border: InputBorder.none,
                        ),
                        validator: (fullName) =>
                            fullName != null && fullName.length < 3
                                ? 'Enter a name (at least 3 characters)'
                                : null,
                      ),
                    ),
                  ),
                ),

                //  Email text-field
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    width: 400, //MediaQuery.of(context).size.width,
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
                ),

                //  Phone text-field
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    width: 400, //MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextFormField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Phone No',
                          border: InputBorder.none,
                        ),
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (phoneNo) => phoneNo != null &&
                                (phoneNo.length < 13 || phoneNo.length > 13)
                            ? 'Enter +92 then your phoneNo'
                            : null,
                      ),
                    ),
                  ),
                ),

                //  password text-field
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    width: 400, //MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                        validator: (password) =>
                            password != null && password.length < 6
                                ? 'Enter at least 6 characters'
                                : null,
                      ),
                    ),
                  ),
                ),

                //  confirm password text-field
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 60,
                    width: 400, //MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value != null && value != password.text
                                ? 'Confirm password must be equal to Password!'
                                : null,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  width: 330,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          makeLoadingTrue();
                          _ownerAuthServices
                              .registerUser(
                                  email: email.text, password: password.text)
                              .then((value) {
                            _ownerServices
                                .createUser(AdminModel(
                              oid: value.user!.uid,
                              fullName: fullName.text,
                              email: email.text,
                              phoneNumber: phoneNumber.text,
                              imageUrl: '',
                            ))
                                .then((value) {
                              fullName.clear();
                              email.clear();
                              password.clear();
                              phoneNumber.clear();
                              confirmPasswordController.clear();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Register successfully"),
                                backgroundColor: Colors.green,
                              ));
                              makeLoadingFalse();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdminLoginScreen()));
                            });
                          }).onError((error, stackTrace) {
                            makeLoadingFalse();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$error"),
                              backgroundColor: Colors.red,
                            ));
                          });
                        }
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminLoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                      ),
                      child: const Text('Create Account',
                          style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(height: 15),

                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.grey),

                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdminLoginScreen()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
