import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:smartdrum/pages/reciption/add_patients.dart';
import 'package:smartdrum/pages/reciption/controllers/add_patient_controller.dart';
import 'package:smartdrum/pages/reciption/edit_patient_screen.dart';

class ReceptionScreen extends StatelessWidget {
  AddPatientController addPatientController = Get.put(AddPatientController());
  ReceptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاستقبال'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: addPatientController.patientList.length,
          itemBuilder: (context, index) {
            return Container(
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
                  Text(addPatientController.patientList[index].patientName),
                  const Gap(10),
                  Text(addPatientController.patientList[index].phone),
                  const Gap(10),
                  Text('العمر: ${addPatientController.patientList[index].age}'),
                  const Gap(10),
                  Text(
                      'الردهة: ${addPatientController.patientList[index].ward}'),
                  const Gap(10),
                  Text(
                      'الدكتور: ${addPatientController.patientList[index].doctor}'),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: context.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.to(
                              () => EditPatientScreen(
                                patient:
                                    addPatientController.patientList[index],
                              ),
                            );
                            // addPatientController.deletePatient(
                            //     addPatientController.patientList[index].id);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              Gap(10),
                              Text(
                                'تعديل',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        width: context.width * 0.4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Dialogs.materialDialog(
                              color: Colors.white,
                              msg: 'هل تريد حذف هذا المريض؟',
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
                                    addPatientController.deletePatient(
                                        addPatientController
                                            .patientList[index].id);
                                    Get.back();
                                  },
                                  text: 'حذف',
                                  iconData: Icons.delete,
                                  color: Colors.red,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                              ],
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              Gap(10),
                              Text(
                                'حذف',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPatientScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
