import 'package:a_car_rental/widgets/Models/users_model.dart';
import 'package:a_car_rental/widgets/Screens/User/UserHomeScreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:a_car_rental/widgets/Services/user_services.dart';
import 'package:flutter/material.dart';

class FillDetails extends StatefulWidget {
  const FillDetails({Key? key}) : super(key: key);

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

bool isAgreeToTermsConditions = false;


class _FillDetailsState extends State<FillDetails> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    //----- Controllers -----
    final fullName = TextEditingController();
    final email = TextEditingController();
    final phoneNumber = TextEditingController();
    final CNIC = TextEditingController();
    final pickupDate = TextEditingController();
    final returnDate = TextEditingController();

    // UserAuthServices _userAuthServices = UserAuthServices();
    UserServices _userServices = UserServices();

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
                const SizedBox(height: 15),
                const Text(
                  'Fill details',
                  style: TextStyle(
                      fontSize: 32,
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
                        keyboardType: TextInputType.emailAddress,
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

                //  CNIC text-field
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
                        controller: CNIC,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'CNIC',
                          border: InputBorder.none,
                        ),
                        validator: (CNIC) => CNIC != null &&
                                (CNIC.length < 13 || CNIC.length > 13)
                            ? 'Enter 13 digits CNIC'
                            : null,
                      ),
                    ),
                  ),
                ),

                //  pickup date text-field
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
                        controller: pickupDate,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          hintText: 'Pickup Date',
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'pickup Date/Month/Year' : null,
                      ),
                    ),
                  ),
                ),

                //  return date text-field
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
                        controller: returnDate,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          hintText: 'Return Date',
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'return Date/Month/Year' : null,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // SingleChildScrollView(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Text(
                //         'I agree to the  ',
                //         style: TextStyle(color: Colors.grey),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(
                //           //         builder: (context) => ()));
                //         },
                //         child: const Text(
                //           'Terms & Conditions',
                //           style: TextStyle(color: Colors.blue),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 10),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                            ),
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.white))),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                makeLoadingTrue();
                                _userServices
                                    .bookVehicle(UsersModel(
                                  cid: FirebaseAuth.instance.currentUser!.uid,
                                  fullName: fullName.text,
                                  email: email.text,
                                  phoneNumber: phoneNumber.text,
                                  CNIC: phoneNumber.text,
                                  pickupDate: pickupDate.text,
                                  returnDate: returnDate.text,
                                ))
                                    .then((value) {
                                  fullName.clear();
                                  email.clear();
                                  phoneNumber.clear();
                                  CNIC.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Successfully booked"),
                                    backgroundColor: Colors.blue,
                                  ));
                                  makeLoadingFalse();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserHomeScreen()));

                                }).onError((error, stackTrace) {
                                  makeLoadingFalse();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("$error"),
                                    backgroundColor: Colors.red,
                                  ));
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                            ),
                            child: const Text('Confirm',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
