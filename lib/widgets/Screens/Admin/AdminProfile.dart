import 'package:a_car_rental/widgets/Screens/Admin/AdminHomeScreen.dart';
import 'package:a_car_rental/widgets/Screens/Admin/UpdateAdminProfile.dart';
import 'package:flutter/material.dart';


class AdminProfile extends StatefulWidget {
  final String image;
  final String fullName;
  final String email;
  final String phone;

  const AdminProfile(
      {Key? key,
      required this.image,
      required this.fullName,
      required this.email,
      required this.phone})
      : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  TextEditingController image = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    image = TextEditingController(text: widget.image);
    fullName = TextEditingController(text: widget.fullName);
    email = TextEditingController(text: widget.email);
    phone = TextEditingController(text: widget.phone);
    super.initState();
  }

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 20,
              )),
          title: const Text(
            "My Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UpdateAdminProfile(
                      image: widget.image,
                      fullName: widget.fullName,
                      email: widget.email,
                      phone: widget.phone,
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    Center(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 48,
                                child: ClipOval(
                                  child: widget.image == ''
                                      ? Image.asset(
                                    'assets/image/style3.png',
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.network(
                                    widget.image,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),



                              // CircleAvatar(
                              //   radius: 50,
                              //   child: ClipRRect(
                              //       borderRadius: BorderRadius.circular(500),
                              //       child: widget.image.isEmpty
                              //           ? Image.network("")
                              //           : Image.network(widget.image)),
                              // )
                            ],
                          ),
                          const SizedBox(height: 7),
                          Text(
                            widget.fullName,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            widget.email,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    //  Full name text-field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: TextFormField(
                        controller: fullName,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Full Name",
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    //  Email text-field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: TextFormField(
                        controller: email,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    //  Phone number text-field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: TextFormField(
                        controller: phone,
                        // initialValue: userData.phoneNo,
                        readOnly: true,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          label: Text("Phone Number"),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    const SizedBox(height: 30),

                    //  Edit Button
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 330,
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UpdateAdminProfile(
                                    image: widget.image,
                                    fullName: widget.fullName,
                                    email: widget.email,
                                    phone: widget.phone,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                            ),
                            child: const Text('Edit Profile',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
