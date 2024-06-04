import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartdrum/core/widgets/elevated_btn.dart';
import 'package:smartdrum/core/widgets/input_field_rounded.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';

class AddWardScreen extends StatelessWidget {
  TextEditingController wardNameController = TextEditingController();
  WardController wardController = Get.put(WardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة ردهة'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RoundedTextField(
                  hintText: 'عنوان الردهة',
                  controller: wardNameController,
                ),
                const Gap(30),
                CustomBtn(
                    onPressed: () {
                      wardController.add(wardNameController.text);
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
