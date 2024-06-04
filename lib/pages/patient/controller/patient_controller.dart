import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartdrum/models/patient.dart';

class PatientController extends GetxController {
  final instance = FirebaseDatabase.instance.ref().child("patient");
  RxList<Patient> patientList = RxList<Patient>([]);
  RxList<Patient> selectedPatientList = RxList<Patient>([]);

  TextEditingController decisionController = TextEditingController();
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
            bloodGroup: value['bloodGroup'],
            decision: value['decision'],
            doctorName: value['doctorName'],
            level: value['level'],
            room: value['room'],
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

  selectWard(String ward) {
    selectedPatientList.value =
        patientList.where((element) => element.ward == ward).toList();
  }

  updatePatient(Patient patient, String decision, String dName, String level,
      String room) {
    print(patient.id);
    instance.child(patient.id).update({
      'decision': decision,
      'doctorName': dName,
      'level': level,
      'room': room
    }).then((value) {
      fetchPatient();
      Get.back();
      Get.snackbar('تم التحديث', 'تم تحديث حالة المريض بنجاح');
    }).catchError((error) {
      Get.snackbar('خطأ', 'حدث خطأ ما');
    });
  }
}
