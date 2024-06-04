import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartdrum/core/widgets/elevated_btn.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';
import 'package:smartdrum/pages/ward/models/ward.dart';

class UpdateWardScreen extends StatelessWidget {
  final Ward ward;
  UpdateWardScreen({super.key, required this.ward});

  TextEditingController wardNameController = TextEditingController();

  WardController wardController = Get.put(WardController());

  @override
  Widget build(BuildContext context) {
    wardNameController.text = ward.name;
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل ردهة'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: wardNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'اسم الردهة',
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomBtn(
              onPressed: () {
                wardController.updateWard(ward.id, wardNameController.text);
              },
              title: 'تعديل',
            ),
          ]),
        ),
      ),
    );
  }
}
