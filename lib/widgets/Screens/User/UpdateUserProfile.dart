import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/utils_error.dart';

class UpdateUserProfile extends StatefulWidget {
  final String image;
  final String fullName;
  final String email;
  final String phone;

  const UpdateUserProfile(
      {Key? key,
        required this.image,
        required this.fullName,
        required this.email,
        required this.phone})
      : super(key: key);

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {
  TextEditingController image = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool isObscure = true;

  @override
  void initState() {
    // TODO: implement initState
    image = TextEditingController(text: widget.image);
    fullName = TextEditingController(text: widget.fullName);
    email = TextEditingController(text: widget.email);
    phone = TextEditingController(text: widget.phone);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => {},
            child: const Icon(
              Icons.edit,
              color: Colors.black,
              size: 20,
            )),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
                  const SizedBox(height: 10),

                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: widget.image == '' && imageUrl == ''
                                    ? Image.asset(
                                  'assets/image/style3.png',
                                  fit: BoxFit.cover,
                                )
                                    : imageUrl == ""
                                    ? Image.network(
                                  widget.image,
                                )
                                    : Image.network(
                                  imageUrl,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 2,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffE0C3F6),
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
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
                          controller: fullName,
                          decoration: const InputDecoration(
                            hintText: 'Full name',
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
                  const SizedBox(height: 10),

                  //  Phone number text-field
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
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                          ),
                          validator: (phoneNo) => phoneNo != null &&
                              (phoneNo.length < 13 || phoneNo.length > 13)
                              ? 'Enter +92 then your phoneNo'
                              : null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //  Email text-field
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
                          controller: email,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  //  Update Button
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 330,
                      child: ElevatedButton(
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection("User")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fullName": fullName.text,
                              "phoneNumber": phone.text,
                              "imageUrl":
                              imageUrl.isEmpty ? widget.image : imageUrl,
                            }).then((value) {
                              Utils.showSnackBar(
                                  "Profile updated successfully");
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.indigo,
                          ),
                          child: const Text('Update Profile',
                              style: TextStyle(color: Colors.white))),
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

  ImagePicker picker = ImagePicker();

  File? file;

  String imageUrl = "";

  Future getImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedFile != null && pickedFile.path != null) {
      file = File(pickedFile.path);
      setState(() {});
      // imageUrl = await UploadFileServices().getUrl(context, file: file!);
      setState(() {});
    }
  }
}
