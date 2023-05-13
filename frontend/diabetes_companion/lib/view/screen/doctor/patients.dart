import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../widget/patient.dart';
import '../../widget/searchtextfield.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({super.key});

  @override
  State<PatientsPage> createState() => PatientsPageState();
}

class PatientsPageState extends State<PatientsPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController glocoseController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ابقى على اتطلاع بحالة مريضك",
                    style: TextStyle(fontSize: 30, color: ColorApp.red),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SearchTextField(
                    title: 'ابحث عن مريض...',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Patient(
                    diabetesType: 'سكري نوع أول',
                    patientAge: 25,
                    patientName: 'سكري سكري',
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Patient(
                    diabetesType: 'سكري نوع أول',
                    patientAge: 25,
                    patientName: 'سكري سكري',
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
