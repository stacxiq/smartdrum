import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:smartdrum/pages/ward/add_ward_screen.dart';
import 'package:smartdrum/pages/ward/controller/ward_controller.dart';
import 'package:smartdrum/pages/ward/update_ward_screen.dart';

class WardScreen extends StatelessWidget {
  WardController wardController = Get.put(WardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الردهات'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: wardController.wardList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  Get.to(() =>
                      UpdateWardScreen(ward: wardController.wardList[index]));
                },
                title: Text(wardController.wardList[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Dialogs.materialDialog(
                      msg: 'هل تريد حذف هذه الردهة؟',
                      title: "حذف الردهة",
                      color: Colors.white,
                      context: context,
                      actions: [
                        IconsOutlineButton(
                          onPressed: () {
                            Get.back();
                          },
                          text: 'الغاء',
                          iconData: Icons.cancel_outlined,
                          textStyle: TextStyle(color: Colors.grey),
                          iconColor: Colors.grey,
                        ),
                        IconsButton(
                          onPressed: () {
                            wardController
                                .deleteWard(wardController.wardList[index].id);
                            Get.back();
                          },
                          text: 'حذف',
                          iconData: Icons.delete,
                          color: Colors.red,
                          textStyle: TextStyle(color: Colors.white),
                          iconColor: Colors.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddWardScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
