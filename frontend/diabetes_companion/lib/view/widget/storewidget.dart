import 'package:diabetes_companion/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/patient/store/storeprofile.dart';
import '/core/constant/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreWidget extends StatelessWidget {
  final String storeId;
  final String storeName;
  final String storeLocation;
  final String storeLogo;
  final String storePhone;
  final double? initialRating;
  final double? lat;
  final double? long;

  const StoreWidget({
    super.key,
    required this.storeName,
    required this.storeLocation,
    required this.storeLogo,
    this.initialRating,
    required this.storeId,
    this.lat,
    this.long,
    required this.storePhone,
  });

  @override
  Widget build(BuildContext context) {
    print('storeId $storeId');
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            CircleAvatar(
              foregroundColor: ColorApp.white,
              foregroundImage: AssetImage(storeLogo),
              radius: 40,
            ),
          ]),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                storeName,
                maxLines: 3,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.blue,
                ),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: initialRating ?? 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                ignoreGestures: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  storeLocation,
                  style: const TextStyle(fontSize: 18, color: ColorApp.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          FilledButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10),
              textStyle: const TextStyle(fontSize: 20),
              alignment: const Center().alignment,
            ),
            onPressed: () {
              Get.toNamed(RouteApp.storeprofile, arguments: {
                'storeId': storeId,
                'storeName': storeName,
                'storePhone': storePhone,
                'storeLocation': storeLocation,
                'storeLogo': storeLogo,
                'lat': lat,
                'long': long,
              });
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorApp.blue,
            ),
          ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import '/core/constant/color.dart';
// import '../../core/constant/imageasset.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class Store extends StatelessWidget {
//   final String storeName;
//   final String storeLocation;
//   final String storeLogo;

//   const Store({
//     super.key,
//     required this.storeName,
//     required this.storeLocation,
//     required this.storeLogo,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(children: const [
//             CircleAvatar(
              // foregroundImage: AssetImage(ImageAsset.store1),
//               radius: 65,
//             ),
//           ]),
//           const SizedBox(width: 30),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 storeName,
//                 maxLines: 3,
//                 softWrap: true,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: ColorApp.blue,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               RatingBar.builder(
//                 initialRating: 3,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemSize: 25,
//                 ignoreGestures: true,
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               const SizedBox(height: 15),
//               Center(
//                 child: Text(
//                   storeLocation,
//                   style: const TextStyle(fontSize: 18, color: ColorApp.grey),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//           // const SizedBox(width: 15),
//           Column(children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.arrow_forward_ios_outlined,
//                 color: ColorApp.blue,
//               ),
//             ),
//           ]),
//         ],
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import '/core/constant/color.dart';
// import '../../core/constant/imageasset.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class Store extends StatelessWidget {
//   final String storeName;
//   final String storeLocation;
//   final String storeLogo;

//   const Store({
//     super.key,
//     required this.storeName,
//     required this.storeLocation,
//     required this.storeLogo,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 storeName,
//                 maxLines: 3,
//                 softWrap: true,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: ColorApp.blue,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               RatingBar.builder(
//                 initialRating: 3,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemSize: 25,
//                 ignoreGestures: true,
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: Colors.amber,
//                 ),
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.arrow_back_ios_outlined,
//                       color: ColorApp.blue,
//                     ),
//                   ),
//                   const SizedBox(width: 90),
//                   Text(
//                     storeLocation,
//                     style: const TextStyle(fontSize: 18, color: ColorApp.grey),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(width: 30),
//           Column(children: const [
//             CircleAvatar(
//               foregroundImage: AssetImage(ImageAsset.store1),
//               radius: 65,
//             ),
//           ]),
//         ],
//       ),
//     );
//   }
// }
