import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:smartdrum/pages/patient/controller/patient_controller.dart';
import 'package:smartdrum/pages/patient/patient_detail.dart';

class PatientListScreen extends StatelessWidget {
  final PatientController patientController = Get.put(PatientController());

  PatientListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المرضى'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: patientController.selectedPatientList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => PatientDetail(
                    patient: patientController.selectedPatientList[index],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(patientController
                        .selectedPatientList[index].patientName),
                    Gap(10),
                    Text(patientController.selectedPatientList[index].phone),
                    Gap(10),
                    Text(
                        'العمر: ${patientController.selectedPatientList[index].age}'),
                    Gap(10),
                    Text(
                        'الردهة: ${patientController.selectedPatientList[index].ward}'),
                    Gap(10),
                    Text(
                        'الدكتور: ${patientController.selectedPatientList[index].doctor}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
