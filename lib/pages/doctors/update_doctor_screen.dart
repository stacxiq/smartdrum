import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartdrum/core/widgets/elevated_btn.dart';
import 'package:smartdrum/core/widgets/input_field_rounded.dart';

import 'package:smartdrum/pages/doctors/controller/doctor_controller.dart';
import 'package:smartdrum/pages/doctors/models/doctor.dart';

class UpdateDoctorScreen extends StatelessWidget {
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController phoneUpdateController = TextEditingController();
  TextEditingController specialityUpdateController = TextEditingController();
  DoctorController doctorController = Get.put(DoctorController());

  final Doctor doctor;
  UpdateDoctorScreen({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    nameUpdateController.text = doctor.name;
    phoneUpdateController.text = doctor.phone;
    specialityUpdateController.text = doctor.speciality;
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
                  controller: nameUpdateController,
                ),
                const Gap(30),
                RoundedTextField(
                  hintText: 'رقم الدكتور',
                  controller: phoneUpdateController,
                ),
                const Gap(30),
                RoundedTextField(
                  hintText: 'تخصص الدكتور',
                  controller: specialityUpdateController,
                ),
                const Gap(30),
                CustomBtn(
                    onPressed: () {
                      doctorController.updateDoctor(
                        doctor.id,
                        nameUpdateController.text,
                        phoneUpdateController.text,
                        specialityUpdateController.text,
                      );
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
