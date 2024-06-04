import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:smartdrum/pages/ward/models/ward.dart';

class WardController extends GetxController {
  final instance = FirebaseDatabase.instance.ref().child("ward");
  RxList<Ward> wardList = RxList<Ward>([]);
  add(String name) {
    EasyLoading.show(status: 'loading...');
    instance.push().set({
      "name": name,
      "status": "active",
    }).then((value) {
      fetchWard();
      EasyLoading.dismiss();
      Get.back();
    }).catchError((error) {
      EasyLoading.dismiss();
      EasyLoading.showError(error.toString());
    });
  }

  fetchWard() {
    instance.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        wardList.clear();
        data.forEach((key, value) {
          wardList.add(Ward(name: value['name'], id: key));
        });
      }
    });
  }

  @override
  void onInit() {
    fetchWard();
    super.onInit();
  }

  deleteWard(String id) {
    EasyLoading.show(status: 'loading...');
    instance.child(id).remove().then((value) {
      EasyLoading.dismiss();
      wardList.removeWhere((element) => element.id == id);
    }).catchError((onError) {
      EasyLoading.showError(onError.toString());
    });
  }

  updateWard(String id, String name) {
    EasyLoading.show(status: 'loading...');
    instance.child(id).update({
      "name": name,
    }).then((value) {
      EasyLoading.dismiss();

      Get.back();
      fetchWard();
    }).catchError((onError) {
      EasyLoading.showError(onError.toString());
    });
  }
}
