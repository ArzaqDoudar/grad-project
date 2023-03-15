import '../widget/datetime/basicdatetimefield.dart';
import '/view/widget/dropdownitems.dart';
import 'package:flutter/material.dart';
import '../widget/advicecard.dart';
import '/data/datasource/static/staticadvice.dart';
// import 'auth/login.dart';

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (BuildContext context) => const Login(),
          //       ),
          //     );
          //   },
          //   child: const Text('Open route'),
          // ),
          AdviceCard(
            //TODO change the static data to data from database
            text: adviceModelList[0].text,
            image: adviceModelList[0].image,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: CustomDropdownMenu(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: BasicDateTimeField(
              textEditingController: dateController,
            ),
          )
        ],
      ),
    ]);
  }
}
