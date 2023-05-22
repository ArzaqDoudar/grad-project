import 'package:flutter/material.dart';
import '../../../../core/constant/imageasset.dart';
import '../widget/store.dart';
import '/core/constant/color.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorApp.white,
        body: SingleChildScrollView(
          child: Container(
            padding: screenWidth > 480
                ? EdgeInsets.symmetric(horizontal: screenWidth * 0.3)
                : const EdgeInsets.symmetric(horizontal: 25),
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
