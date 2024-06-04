import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartdrum/pages/auth/login.dart';
import 'package:smartdrum/pages/dashboard/test_sliders.dart';
import 'package:smartdrum/pages/dashboard/widgets/dashboard_item.dart';
import 'package:smartdrum/pages/doctors/controller/doctor_controller.dart';
import 'package:smartdrum/pages/doctors/doctor_screen.dart';
import 'package:smartdrum/pages/patient/wards_screen.dart';
import 'package:smartdrum/pages/reciption/reciption_screen.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';
import 'package:smartdrum/pages/ward/ward_screen.dart';

class DashboardPage extends StatelessWidget {
  DoctorController doctorController = Get.put(DoctorController());
  WardController wardController = Get.put(WardController());
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(30),
                // ParallaxEffect(),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardItem(
                      title: 'الردهات',
                      onTap: () {
                        Get.to(WardScreen());
                      },
                    ),
                    DashboardItem(
                      title: 'الدكاترة',
                      onTap: () {
                        Get.to(DoctorScreen());
                      },
                    ),
                  ],
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardItem(
                      title: 'الاستقبال',
                      onTap: () {
                        Get.to(() => ReceptionScreen());
                      },
                    ),
                    DashboardItem(
                      title: 'الطبلة',
                      onTap: () {
                        Get.to(() => WardsScreen());
                      },
                    ),
                  ],
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardItem(
                      title: 'تسجيل خروج',
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Get.offAll(() => LoginScreen());
                      },
                    ),
                    DashboardItem(
                      title: 'عن التطبيق',
                      onTap: () {
                        Get.defaultDialog(
                            title: "تطبيق الطبلة الالكترونية",
                            middleText:
                                " مرحبا بكم في تطبيق الطبلة الالكترونية",
                            backgroundColor: Colors.white,
                            titleStyle: const TextStyle(color: Colors.black),
                            middleTextStyle:
                                const TextStyle(color: Colors.black),
                            cancelTextColor: Colors.white,
                            confirmTextColor: Colors.white,
                            buttonColor: Colors.red,
                            barrierDismissible: false,
                            radius: 20,
                            content: SizedBox(
                              width: context.width * 0.8,
                              height: context.height * 0.45,
                              child: Column(
                                children: [
                                  const Text(
                                    "تم تطويرة بواسطة",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Gap(10),
                                  const IntrinsicHeight(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  const Gap(10),
                                  const Text(
                                    "ايه علي عبد الجبار محسن",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    "بيداء علي عبد",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    "مصطفى ثائر نيسان",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    "اجود مازن",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    "سجاد حميد",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    "جاسم محمد",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Gap(40),
                                  SizedBox(
                                    width: context.width * 0.75,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'رجوع',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
