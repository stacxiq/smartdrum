import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smartdrum/models/patient.dart';
import 'package:smartdrum/pages/doctors/models/doctor.dart';
import 'package:smartdrum/pages/ward/models/ward.dart';

class AddPatientController extends GetxController {
  // database
  final instance = FirebaseDatabase.instance.ref().child("patient");

  RxList<Patient> patientList = RxList<Patient>([]);
  // List
  RxList<String> genderList = ['ذكر', 'انثى'].obs;

  // TextEditingControllers
  TextEditingController patientNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController chronicDiseasesController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  // active values
  Rx<Doctor> activeDoctor =
      Rx<Doctor>(Doctor(name: '', phone: '', speciality: '', id: ''));
  Rx<Ward> activeWard = Rx<Ward>(Ward(name: '', id: ''));
  RxString activeGender = RxString('');

  setDoctor(Doctor? doctor) {
    activeDoctor.value = doctor!;
  }

  setWard(Ward? ward) {
    activeWard.value = ward!;
  }

  setGender(String? gender) {
    print(gender);
    activeGender.value = gender!;
  }

  addPatient() {
    if (activeDoctor.value == null) {
      EasyLoading.showError('يجب تحديد الطبيب');
      return;
    } else if (activeWard.value == null) {
      EasyLoading.showError('يجب تحديد الردهة');
      return;
    } else if (activeGender.value == null) {
      EasyLoading.showError('يجب تحديد الجنس');
      return;
    } else if (patientNameController.text.isEmpty) {
      EasyLoading.showError('يجب تحديد الاسم');
      return;
    } else if (phoneController.text.isEmpty) {
      EasyLoading.showError('يجب تحديد رقم الهاتف');
      return;
    } else if (ageController.text.isEmpty) {
      EasyLoading.showError('يجب تحديد العمر');
      return;
    } else if (chronicDiseasesController.text.isEmpty) {
      EasyLoading.showError('يجب تحديد الامراض');
      return;
    } else if (statusController.text.isEmpty) {
      EasyLoading.showError('يجب تحديد الحالة');
      return;
    } else if (bloodGroupController.text.isEmpty) {
      EasyLoading.showError('يجب تحديد مجموعة الدم');
      return;
    } else {
      EasyLoading.show(status: 'loading...');
      instance.push().set({
        "doctor": activeDoctor.value!.name,
        "ward": activeWard.value.name,
        "gender": activeGender.value,
        "patientName": patientNameController.text,
        "age": ageController.text,
        "phone": phoneController.text,
        "chronicDiseases": chronicDiseasesController.text,
        "status": statusController.text,
        "bloodGroup": bloodGroupController.text,
        "decision": ' ',
        "level": ' ',
        "room": ' ',
        "doctorName": ' ',
      }).then((value) {
        fetchPatient();
        EasyLoading.dismiss();
        Get.back();
      }).catchError((error) {
        EasyLoading.dismiss();
        EasyLoading.showError(error.toString());
      });
    }
  }

  fetchPatient() {
    instance.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        patientList.clear();
        data.forEach((key, value) {
          patientList.add(Patient(
            id: key,
            patientName: value['patientName'],
            gender: value['gender'],
            age: value['age'],
            ward: value['ward'],
            doctor: value['doctor'],
            phone: value['phone'],
            chronicDiseases: value['chronicDiseases'],
            status: value['status'],
            doctorName: value['doctorName'],
            level: value['level'],
            room: value['room'],
            bloodGroup: value['bloodGroup'],
            decision: value['decision'],
          ));
        });
      }
    });
  }

  @override
  void onInit() {
    fetchPatient();
    super.onInit();
  }

  deletePatient(String id) {
    EasyLoading.show(status: 'loading...');
    instance.child(id).remove().then((value) {
      EasyLoading.dismiss();
      patientList.removeWhere((element) => element.id == id);
    }).catchError((onError) {
      EasyLoading.showError(onError.toString());
    });
  }

  updatePatient(String id) {
    EasyLoading.show(status: 'loading...');
    instance.child(id).update({
      'patientName': patientNameController.text,
      'gender': activeGender.value,
      'age': ageController.text,
      'ward': activeWard.value.name,
      'doctor': activeDoctor.value.name,
      'phone': phoneController.text,
      'chronicDiseases': chronicDiseasesController.text,
      'status': statusController.text,
      'bloodGroup': bloodGroupController.text,
      'decision': statusController.text,
    }).then((value) {
      EasyLoading.dismiss();
      fetchPatient();
      Get.back();
    }).catchError((onError) {
      EasyLoading.showError(onError.toString());
    });
  }
}
