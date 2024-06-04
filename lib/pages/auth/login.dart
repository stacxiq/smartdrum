import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartdrum/pages/dashboard/dashboard_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignInScreen(
      providers: [
        EmailAuthProvider(),
        
      ],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Get.offAll(DashboardPage());
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          Get.offAll(DashboardPage());
        })
      ],
    ));
  }
}
