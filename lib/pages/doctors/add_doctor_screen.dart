import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartdrum/core/widgets/elevated_btn.dart';
import 'package:smartdrum/core/widgets/input_field_rounded.dart';
import 'package:smartdrum/pages/doctors/controller/doctor_controller.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';

class AddDoctorScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  DoctorController doctorController = Get.put(DoctorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة دكتور'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RoundedTextField(
                  hintText: 'اسم الدكتور',
                  controller: nameController,
                ),
                const Gap(30),
                RoundedTextField(
                  hintText: 'رقم الدكتور',
                  controller: phoneController,
                ),
                const Gap(30),
                RoundedTextField(
                  hintText: 'تخصص الدكتور',
                  controller: specialityController,
                ),
                const Gap(30),
                CustomBtn(
                    onPressed: () {
                      doctorController.add(nameController.text,
                          phoneController.text, specialityController.text);
                    },
                    title: 'حفظ'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
