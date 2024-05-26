import 'package:a_car_rental/widgets/Models/users_model.dart';
import 'package:a_car_rental/widgets/Screens/Admin/AdminProfileScreen.dart';
import 'package:a_car_rental/widgets/Screens/Auth/AdminLoginScreen.dart';
import 'package:a_car_rental/widgets/Screens/Auth/UserForgotPassword.dart';
import 'package:a_car_rental/widgets/Screens/User/UserProfile.dart';
import 'package:a_car_rental/widgets/Screens/User/google_map_screen.dart';
import 'package:a_car_rental/widgets/Services/user_auth_services.dart';
import 'package:a_car_rental/widgets/Services/user_services.dart';
import 'package:a_car_rental/widgets/about_us.dart';
import 'package:a_car_rental/widgets/privacy_policy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserNavBar extends StatefulWidget {
  const UserNavBar({Key? key}) : super(key: key);

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
  String fullName = "";
  String email = "";
  String imageUrl = "";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {

    UserAuthServices _userAuthServices = UserAuthServices();

    return Drawer(
      child: StreamProvider.value(
          initialData: UsersModel(),
          value: UserServices()
              .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
          builder: (context, child) {

            UsersModel usersData = context.watch<UsersModel>();

            fullName = usersData.fullName.toString();
            email = usersData.email.toString();
            imageUrl = usersData.imageUrl.toString();
            phoneNumber = usersData.phoneNumber.toString();
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    usersData.fullName.toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  accountEmail: Text(usersData.email.toString(),
                      style:
                      const TextStyle(fontSize: 16, color: Colors.white)),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: usersData.imageUrl == ''
                          ? Image.asset(
                        'assets/image/style3.png',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      )
                          : Image.network(
                        usersData.imageUrl.toString(),
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      image: const DecorationImage(
                        image: AssetImage("assets/image/tree.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('My Profile'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserProfile(
                        image: usersData.imageUrl.toString(),
                        fullName: usersData.fullName.toString(),
                        email: usersData.email.toString(),
                        phone: usersData.phoneNumber.toString(),
                      ),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Setting'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lock_outline_sharp),
                  title: const Text('Reset Password'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserForgotPasswordScreen(),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_outlined),
                  title: const Text('Notification'),
                  onTap: () {
                    //Close navigation drawer before
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                ),



                ListTile(
                  leading: const Icon(Icons.location_on_rounded),
                  title: const Text('Google Map'),
                  onTap: () {
                    //Close navigation drawer before
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GoogleMapScreen()));
                  },
                ),


                const Divider(
                  color: Colors.black54,
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline_rounded),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ));
                  },
                ),
                const Divider(
                  color: Colors.black54,
                ),
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Log Out'),
                  onTap: () {
                    _userAuthServices.signOut();
                    // FirebaseAuth.instance.signOut();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminLoginScreen()));
                  },
                ),
              ],
            );
          }),
    );
  }
}
