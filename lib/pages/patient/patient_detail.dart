import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smartdrum/core/widgets/elevated_btn.dart';

import 'package:smartdrum/models/patient.dart';
import 'package:smartdrum/pages/patient/controller/patient_controller.dart';

class PatientDetail extends StatefulWidget {
  final Patient patient;

  /// Displays a single patient's details.
  ///
  /// Takes a [Patient] object as a parameter.
  const PatientDetail({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  TextEditingController decisionController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController levelNumberController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();

  PatientController patientController = Get.put(PatientController());

  @override
  void initState() {
    setState(() {
      decisionController.text = widget.patient.decision;
      doctorNameController.text = widget.patient.doctorName;
      levelNumberController.text = widget.patient.level;
      roomNumberController.text = widget.patient.room;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        // The page's title is the patient's name.
        appBar: AppBar(
          title: Text(widget.patient.patientName),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.info),
              ),
              Tab(
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
        // The page displays the patient's details in a scrollable list.
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: context.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('اسم المريض',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Gap(10),
                      Text(widget.patient.patientName,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const Gap(10),
                      const IntrinsicHeight(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      const Gap(10),
                      Text('عمر المريض',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Gap(10),
                      Text(widget.patient.age,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const IntrinsicHeight(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      const Gap(10),
                      Text('رقم الهاتف',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Gap(10),
                      Text(widget.patient.phone,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const IntrinsicHeight(
                        child: Divider(
                          color: Color.fromARGB(255, 85, 58, 58),
                          thickness: 1,
                        ),
                      ),
                      const Gap(10),
                      Text('الحالة',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Gap(10),
                      Text(widget.patient.status,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const IntrinsicHeight(
                        child: Divider(
                          color: Color.fromARGB(255, 85, 58, 58),
                          thickness: 1,
                        ),
                      ),
                      const Gap(10),
                      Text('زمرة الدم',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Gap(10),
                      Text(widget.patient.bloodGroup,
                          style: Theme.of(context).textTheme.bodyLarge),
                      const IntrinsicHeight(
                        child: Divider(
                          color: Color.fromARGB(255, 85, 58, 58),
                          thickness: 1,
                        ),
                      ),
                      const Gap(10),
                      Text('الامراض المزمنة',
                          style: Theme.of(context).textTheme.titleLarge),
                      const Gap(10),
                      Text(widget.patient.chronicDiseases,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),

            // The second tab is for editing the patient's details.
            SingleChildScrollView(
              child: SizedBox(
                width: context.width,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: doctorNameController,
                        decoration: const InputDecoration(
                          labelText: 'اسم الطبيب',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Gap(20),
                      TextFormField(
                        controller: levelNumberController,
                        decoration: const InputDecoration(
                          labelText: 'الطابق',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Gap(20),
                      TextFormField(
                        controller: roomNumberController,
                        decoration: const InputDecoration(
                          labelText: 'الغرفة',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Gap(20),
                      TextFormField(
                        controller: decisionController,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          labelText: 'التشخيص',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Gap(20),
                      CustomBtn(
                        onPressed: () {
                          patientController.updatePatient(
                              widget.patient,
                              decisionController.text,
                              doctorNameController.text,
                              levelNumberController.text,
                              roomNumberController.text);
                        },
                        title: 'تحديث البيانات',
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
