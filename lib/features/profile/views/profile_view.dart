import 'package:flutter/material.dart';
import 'package:profileapp/app/routes.dart';
import 'package:profileapp/features/profile/model/dummy_page_model.dart';
import 'package:profileapp/features/profile/model/profile_model.dart';
import 'package:profileapp/features/profile/servies/profile_services.dart';
import 'package:profileapp/helpers/confirmatiom_dialog.dart';
import 'package:profileapp/image-constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injector.dart';
import '../../../login_page.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileModel? _profileModel;
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
    initialFunction();
  }

  initialFunction() async {
    _profileModel = await ProfileServices().fetchProile();

    _isloading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile View"),
        centerTitle: true,
        actions: [
          //this is for logout

          IconButton(
              onPressed: () async {
                final bool isConfirmed = await getConfirmationDialog(context);
                if (isConfirmed) {
                  locator.get<SharedPreferences>().clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.loginRoute, (route) => false);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Loginpage(),
                  //     ),
                  //     (route) => false);
                }
                print(isConfirmed);
                //Show dialog for user confirmation
                // showDialog(
                //     barrierDismissible: false,
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: Text("Do u want to logout ?"),
                //         content: Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               TextButton(
                //                   onPressed: () {
                //                     Navigator.pop(context);
                //                   },
                //                   child: Text(
                //                     "No",
                //                   )),
                //               TextButton(
                //                   onPressed: () {
                // locator.get<SharedPreferences>().clear();
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Loginpage(),
                //     ),
                //     (route) => false);
                //                   },
                //                   child: Text(
                //                     "Yes",
                //                   )),
                //             ]),
                //       );
                //     });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: _isloading
          ? CircularProgressIndicator()
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ClipOval(
                    child: ClipRRect(
                      child: Image.network(
                        ImageConstants.profileImage,
                        fit: BoxFit.fitWidth,
                        height: 90,
                      ),
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _profileModel?.FullName ?? "",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _profileModel?.dateofBirth ?? "",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Supervisor: ${_profileModel?.supervisorName}"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.dummyRoute,
                            arguments: DummyPageModel(
                                name: "Hello", address: "Kathamandu", age: 20));
                      },
                      child: Text("Navigate"))
                ],
              ),
            ),
      backgroundColor: Colors.lightGreen,
    );
  }
}
