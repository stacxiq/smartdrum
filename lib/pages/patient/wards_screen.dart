import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartdrum/pages/patient/controller/patient_controller.dart';
import 'package:smartdrum/pages/patient/patient_list_screen.dart';
import 'package:smartdrum/pages/ward/add_ward_screen.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';

class WardsScreen extends StatelessWidget {
  WardController wardController = Get.put(WardController());
  PatientController patientController = Get.put(PatientController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الردهات'),
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: wardController.wardList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                patientController
                    .selectWard(wardController.wardList[index].name);
                Get.to(PatientListScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    wardController.wardList[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
