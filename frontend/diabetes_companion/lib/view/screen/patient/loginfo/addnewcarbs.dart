import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/searchtextfield.dart';
import '../../../widget/sectopbar.dart';

class AddNewCarbs extends StatelessWidget {
  AddNewCarbs({super.key});
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController addDoseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SecTopBar(
          label: 'اضافة وجبة جديدة',
        ),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              child: Column(children: const [
                SizedBox(
                  height: 30,
                ),
                SearchTextField(
                  title: 'ابحث عن وجبة...',
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
