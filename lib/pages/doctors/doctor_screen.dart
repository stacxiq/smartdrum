import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:smartdrum/pages/doctors/add_doctor_screen.dart';
import 'package:smartdrum/pages/doctors/controller/doctor_controller.dart';
import 'package:smartdrum/pages/doctors/update_doctor_screen.dart';
import 'package:smartdrum/pages/ward/add_ward_screen.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';

class DoctorScreen extends StatelessWidget {
  DoctorController doctorController = Get.put(DoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدكاترة'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: doctorController.doctorList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  Get.to(
                    () => UpdateDoctorScreen(
                      doctor: doctorController.doctorList[index],
                    ),
                  );
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorController.doctorList[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      doctorController.doctorList[index].phone,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Dialogs.materialDialog(
                        color: Colors.white,
                        msg: 'هل تريد حذف هذا الدكتور؟',
                        title: 'حذف',
                        context: context,
                        actions: [
                          IconsOutlineButton(
                            onPressed: () {
                              Get.back();
                            },
                            text: 'الغاء',
                          ),
                          IconsButton(
                            onPressed: () {
                              doctorController.deleteDoctor(
                                  doctorController.doctorList[index].id);
                              Get.back();
                            },
                            text: 'حذف',
                            iconData: Icons.delete,
                            color: Colors.red,
                            textStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                          ),
                        ]);
                    // doctorController
                    //     .deleteDoctor(doctorController.doctorList[index].id);
                  },
                ),
                subtitle: Text(
                  doctorController.doctorList[index].speciality,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddDoctorScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
