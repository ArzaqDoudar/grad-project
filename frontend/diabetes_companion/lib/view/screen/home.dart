import '/view/widget/dropdownitems.dart';
import 'package:flutter/material.dart';
import '../widget/advicecard.dart';
import '/data/datasource/static/staticadvice.dart';
import 'auth/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Login(),
                ),
              );
            },
            child: const Text('Open route'),
          ),
          AdviceCard(
            //TODO change the static data to data from database
            text: adviceModelList[0].text,
            image: adviceModelList[0].image,
          ),
          const CustomDropdownMenu()
        ],
      ),
    ]);
  }
}
