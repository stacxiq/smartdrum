import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:smartdrum/core/constants/colors.dart';
import 'package:smartdrum/core/widgets/elevated_btn.dart';
import 'package:smartdrum/core/widgets/input_field_rounded.dart';
import 'package:smartdrum/models/patient.dart';
import 'package:smartdrum/pages/doctors/controller/doctor_controller.dart';
import 'package:smartdrum/pages/doctors/models/doctor.dart';
import 'package:smartdrum/pages/reciption/controllers/add_patient_controller.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';
import 'package:smartdrum/pages/ward/models/ward.dart';

class EditPatientScreen extends StatelessWidget {
  DoctorController doctorController = Get.put(DoctorController());
  WardController wardController = Get.put(WardController());
  AddPatientController addPatientController = Get.put(AddPatientController());
  String dropdownValue = 'ذكر';
  final Patient patient;
  EditPatientScreen({
    Key? key,
    required this.patient,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    addPatientController.patientNameController.text = patient.patientName;
    addPatientController.activeGender.value = patient.gender;
    addPatientController.ageController.text = patient.age;
    addPatientController.phoneController.text = patient.phone;
    addPatientController.chronicDiseasesController.text =
        patient.chronicDiseases;
    addPatientController.statusController.text = patient.status;
    addPatientController.bloodGroupController.text = patient.bloodGroup;
    addPatientController.activeWard.value = wardController.wardList.firstWhere(
      (element) => element.name == patient.ward,
    );

    addPatientController.activeDoctor.value =
        doctorController.doctorList.firstWhere(
      (element) => element.name == patient.doctor,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل بيانات المريض'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                RoundedTextField(
                  hintText: ' اسم المريض',
                  controller: addPatientController.patientNameController,
                ),
                const Gap(15),
                Container(
                  width: context.width,
                  height: context.height * 0.062,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.kPrimary,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(
                    () => DropdownButton<String>(
                      value: addPatientController.activeGender.value.isEmpty
                          ? null
                          : addPatientController.activeGender.value,
                      hint: const Text('الجنس', style: TextStyle(fontSize: 16)),
                      onChanged: addPatientController.setGender,
                      alignment: Alignment.centerRight,
                      underline: const SizedBox(),
                      isExpanded: true,
                      style: const TextStyle(color: Colors.black),
                      dropdownColor: AppColors.kSecondary,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      selectedItemBuilder: (BuildContext context) {
                        return addPatientController.genderList
                            .map((String value) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              addPatientController.activeGender.value,
                              style: const TextStyle(
                                color: AppColors.kPrimary,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items: addPatientController.genderList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Gap(15),
                RoundedTextField(
                  hintText: ' عمر المريض',
                  controller: addPatientController.ageController,
                ),
                const Gap(15),
                RoundedTextField(
                  hintText: 'رقم الهاتف',
                  controller: addPatientController.phoneController,
                ),
                const Gap(15),
                RoundedTextField(
                  hintText: 'الامراض المزمنة',
                  controller: addPatientController.chronicDiseasesController,
                ),
                const Gap(15),
                RoundedTextField(
                  hintText: 'حالة المريض',
                  controller: addPatientController.statusController,
                ),
                const Gap(15),
                RoundedTextField(
                  hintText: 'فصيلة الدم',
                  controller: addPatientController.bloodGroupController,
                ),
                const Gap(15),
                Container(
                  width: context.width,
                  height: context.height * 0.065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.kPrimary,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(
                    () => DropdownButton<Ward>(
                      hint:
                          const Text('الردهة', style: TextStyle(fontSize: 16)),
                      onChanged: addPatientController.setWard,
                      alignment: Alignment.centerRight,
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: addPatientController.activeWard.value.name.isEmpty
                          ? wardController.wardList.first
                          : addPatientController.activeWard.value,
                      style: const TextStyle(color: Colors.black),
                      dropdownColor: AppColors.kSecondary,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      selectedItemBuilder: (BuildContext context) {
                        return wardController.wardList.map((Ward value) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              addPatientController
                                      .activeWard.value.name.isNotEmpty
                                  ? addPatientController.activeWard.value.name
                                  : 'الردهة',
                              style: const TextStyle(
                                color: AppColors.kPrimary,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items: wardController.wardList
                          .map<DropdownMenuItem<Ward>>((Ward value) {
                        return DropdownMenuItem<Ward>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Gap(15),
                Container(
                  width: context.width,
                  height: context.height * 0.065,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.kPrimary,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(
                    () => DropdownButton<Doctor>(
                      hint:
                          const Text('الطبيب', style: TextStyle(fontSize: 16)),
                      onChanged: addPatientController.setDoctor,
                      alignment: Alignment.centerRight,
                      value:
                          addPatientController.activeDoctor.value.name.isEmpty
                              ? doctorController.doctorList.first
                              : addPatientController.activeDoctor.value,
                      underline: const SizedBox(),
                      isExpanded: true,
                      style: const TextStyle(color: Colors.black),
                      dropdownColor: AppColors.kSecondary,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      selectedItemBuilder: (BuildContext context) {
                        return doctorController.doctorList.map((Doctor value) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              addPatientController
                                      .activeDoctor.value.name.isNotEmpty
                                  ? addPatientController.activeDoctor.value.name
                                  : 'الدكتور',
                              style: const TextStyle(
                                color: AppColors.kPrimary,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      items: doctorController.doctorList
                          .map<DropdownMenuItem<Doctor>>((Doctor value) {
                        return DropdownMenuItem<Doctor>(
                          value: value,
                          child: Text('${value.name} - ${value.speciality}'),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Gap(30),
                CustomBtn(
                  onPressed: () {
                    addPatientController.updatePatient(patient.id);
                    // wardController.add(wardNameController.text);
                  },
                  title: 'حفظ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
