import 'package:flutter/material.dart';
import '/core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../widget/store.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                ),
                Store(
                  storeLocation: 'رام الله',
                  storeLogo: ImageAsset.store1,
                  storeName: 'متجر شوفانكم',
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  height: 10,
                ),
                Store(
                  storeLocation: 'رام الله',
                  storeLogo: ImageAsset.store1,
                  storeName: 'متجر شوفانكم',
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
        ));
  }
}
// import 'package:flutter/material.dart';

// class StorePage extends StatelessWidget {
//   const StorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       // bottomNavigationBar: Cu(),
//       body: Text(
//         'Store',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
