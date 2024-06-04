import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smartdrum/pages/doctors/models/doctor.dart';
import 'package:smartdrum/pages/ward/models/ward.dart';

class DoctorController extends GetxController {
  final instance = FirebaseDatabase.instance.ref().child("doctors");
  RxList<Doctor> doctorList = RxList<Doctor>([]);
  add(String name, String phone, String speciality) {
    EasyLoading.show(status: 'loading...');
    instance.push().set({
      "name": name,
      "phone": phone,
      "speciality": speciality,
      "status": "active",
    }).then((value) {
      fetchDoctor();
      EasyLoading.dismiss();
      Get.back();
    }).catchError((error) {
      EasyLoading.dismiss();
      EasyLoading.showError(error.toString());
    });
  }

  fetchDoctor() {
    instance.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        doctorList.clear();
        data.forEach((key, value) {
          doctorList.add(Doctor(
              name: value['name'],
              phone: value['phone'],
              speciality: value['speciality'],
              id: key));
        });
      }
    });
  }

  @override
  void onInit() {
    fetchDoctor();
    super.onInit();
  }

  deleteDoctor(String id) {
    EasyLoading.show(status: 'loading...');
    instance.child(id).remove().then((value) {
      EasyLoading.dismiss();
      doctorList.removeWhere((element) => element.id == id);
    }).catchError((onError) {
      EasyLoading.showError(onError.toString());
    });
  }

  updateDoctor(String id, String name, String phone, String speciality) {
    EasyLoading.show(status: 'loading...');
    instance.child(id).update({
      "name": name,
      "phone": phone,
      "speciality": speciality,
    }).then((value) {
      EasyLoading.dismiss();
      fetchDoctor();
      Get.back();
    }).catchError((onError) {
      EasyLoading.showError(onError.toString());
    });
  }
}
