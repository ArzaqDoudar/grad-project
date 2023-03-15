import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import 'logs/bloodglocosepage.dart';
import 'logs/carbspage.dart';
import 'logs/medicinepage.dart';
import 'logs/weightpage.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: ColorApp.white,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: ColorApp.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: SafeArea(
              child: Column(
                children: const [
                  TabBar(
                    unselectedLabelColor: ColorApp.blue,
                    labelColor: ColorApp.red,
                    indicatorColor: ColorApp.red,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    tabs: [
                      Tab(
                        text: 'نسبة السكر',
                        icon: Icon(Icons.water_drop),
                      ),
                      Tab(
                          text: 'الجرعات',
                          icon: Icon(Icons.medication_rounded)),
                      Tab(
                          text: 'الكربوهيدرات',
                          icon: Icon(Icons.fastfood_sharp)),
                      Tab(text: 'الوزن', icon: Icon(Icons.monitor_weight)),
                    ],
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              const BloodGlucosePage(),
              MedicinePage(),
              CarbsPage(),
              WeightPage()
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class MorePage extends StatelessWidget {
//   const MorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       // bottomNavigationBar: Cu(),
//       body: Text(
//         'More',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
