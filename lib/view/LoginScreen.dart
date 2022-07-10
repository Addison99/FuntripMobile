import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_trip_v2/api_connect/driver_rest_client.dart';
import 'package:fun_trip_v2/model/driver_model.dart';
import 'package:fun_trip_v2/model/user_model.dart';
import 'package:fun_trip_v2/view/HomeScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            child: Lottie.asset('assets/anim/background.json')),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height * 0.2,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Lottie.asset('assets/anim/rocket_anim.json')),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () async {
                  var result = await GoogleSignIn().signIn();
                  if (result != null) {
                    final driverRestApi = DriverRestApi(Dio());
                    UserModel driver = UserModel(
                      userName: result.displayName,
                      email: result.email,
                      password: 'no-password',
                    );
                    try {
                      var createUserResult =
                          await driverRestApi.createDriver(driver);
                      log('create user result ${createUserResult.response}');
                    } on DioError catch (err) {
                      log('error while login, skipping ${err.message}');
                    }

                    UserModel.currentUser = UserModel(
                        userName: result.displayName, email: result.email);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => const HomeScreen())));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 40,
                          child: Image.asset('assets/images/ic_google.png')),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Login with Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
