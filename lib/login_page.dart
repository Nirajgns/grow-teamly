import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/app/routes.dart';
import 'package:profileapp/constants/app_constants.dart';
import 'package:profileapp/helpers/snacks.dart';
import 'package:profileapp/home_page.dart';
import 'package:profileapp/injector.dart';
import 'package:profileapp/models/login_response_model.dart';
import 'package:profileapp/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'image-constants.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> _loginFormkey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isobscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _loginFormkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Image.network(ImageConstants.appLogo, height: 150),


                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      validator: (String? value) {
                        if (value == null) {
                          return "please enter your password";
                        } else if (value.length < 10) {
                          return "please enter valid phone number.";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Phone number",
                          labelText: "Phone number",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          prefixIcon: Icon(
                            Icons.phone,
                          )),
                    ),

                    
                    TextFormField(
                        controller: _passwordController,
                        obscureText: isobscure,
                        validator: (String? value) {
                          if (value == null) {
                            return "please enter your password";
                          } else if (value.length < 8) {
                            return "password must be greater than equal to 8 character.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              child: const Icon(Icons.visibility),
                              onLongPressStart: (val) {
                                setState(() {
                                  isobscure = false;
                                });
                              },
                              onLongPressEnd: (val) {
                                isobscure = true;
                              },
                            ),
                            // suffixIcon: IconButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         isobscure = !isobscure;
                            //       });
                            //     },
                            //     icon: Icon(
                            //       isobscure
                            //           ? Icons.remove_red_eye
                            //           : Icons.visibility_off,
                            //     )),
                            prefixIcon: const Icon(
                              Icons.fingerprint_outlined,
                            ))),
                    ElevatedButton(
                        onPressed: () async {
                          if (_loginFormkey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            AuthServices authServices = AuthServices();
                            LoginResponseModel? response =
                                await authServices.login(_phoneController.text,
                                    _passwordController.text);
                            setState(() {
                              isLoading = false;
                            });
                            //check if response comes from server
                            if (response == null) {
                              AppSnacks.showSnacksBar(context,
                                  message: "No response from the server.");
                            } else if(response.data != null) {
                              locator.get<SharedPreferences>().setString(
                                  AppConstants.token, response.data!);
                              AppSnacks.showSnacksBar(context,
                                  message: "Logged in successfully");
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //   content: Text("loged in ${response.data}"),
                              //   duration: Duration(seconds: 5),
                              // ));
                              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeRoute,  (route) => false);
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     CupertinoPageRoute(
                              //         builder: (context) => Homepage()),
                              //     (route) => false);
                            } else {
                              AppSnacks.showSnacksBar(context,
                                  message: "Invalid credentials.");
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //   content:
                              //       Text("please enter valid email password"),
                              // ));
                            }
                          }
                        },
                        child: const Text(("Login"))),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading) const Center(child: const CircularProgressIndicator())
        ]),
      ),
    );
  }
}
