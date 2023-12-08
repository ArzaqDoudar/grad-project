import 'package:flutter/material.dart';
import '/core/constant/color.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String productIngredient;
  final String productImage;
  final String productStore;
  const ProductWidget({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productIngredient,
    required this.productImage,
    required this.productStore,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.all(10.0),
            title: Text(
              productName,
              style: const TextStyle(
                fontFamily: 'Amiri',
                fontSize: 40,
                color: ColorApp.blue,
              ),
              textAlign: TextAlign.center,
            ),
            content: SizedBox(
              // Specify some width
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Image.asset(productImage),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'الوصف: $productDescription',
                    style: const TextStyle(
                        fontFamily: 'Amiri',
                        color: ColorApp.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'المكونات :$productIngredient',
                    style: const TextStyle(
                        fontFamily: 'Amiri',
                        color: ColorApp.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'السعر :$productPrice شيكل',
                    style: const TextStyle(
                        fontFamily: 'Amiri',
                        color: ColorApp.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                  splashColor: Colors.green,
                  icon: const Icon(
                    Icons.done,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Container(
          // height: 300,
          child: Column(children: [
            Image.asset(
              productImage,
              // height: 500
            ),
            Text(
              productName,
              style: const TextStyle(
                  fontFamily: 'Amiri',
                  color: ColorApp.blue,
                  fontWeight: FontWeight.normal,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            // Text(
            //   '$productPrice شيكل',
            //   style: const TextStyle(
            //       fontFamily: 'Amiri',
            //       color: ColorApp.lightblue,
            //       fontWeight: FontWeight.w600,
            //       fontSize: 15),
            //   textAlign: TextAlign.center,
            //   // maxLines: 2,
            //   softWrap: true,
            // ),
            // const SizedBox(
            //   height: 3,
            // ),
            // FilledButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.transparent,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     padding: const EdgeInsets.all(5),
            //     textStyle: const TextStyle(fontSize: 0),
            //     alignment: const Center().alignment,
            //   ),
            //   // onPressed: () async {
            //   //   await showDialog(
            //   //     context: context,
            //   //     barrierDismissible: false, // user must tap button!
            //   //     builder: (context) => AlertDialog(
            //   //       contentPadding: const EdgeInsets.all(10.0),
            //   //       title: Text(
            //   //         productName,
            //   //         style: const TextStyle(
            //   //           fontFamily: 'Amiri',
            //   //           fontSize: 40,
            //   //           color: ColorApp.blue,
            //   //         ),
            //   //         textAlign: TextAlign.center,
            //   //       ),
            //   //       content: SizedBox(
            //   //         // Specify some width
            //   //         width: MediaQuery.of(context).size.width,
            //   //         height: MediaQuery.of(context).size.height * 0.5,
            //   //         child: Column(
            //   //           children: [
            //   //             Image.asset(productImage),
            //   //             const SizedBox(
            //   //               height: 10,
            //   //             ),
            //   //             Text(
            //   //               productIngredient,
            //   //               style: const TextStyle(
            //   //                   fontFamily: 'Amiri',
            //   //                   color: ColorApp.grey,
            //   //                   fontWeight: FontWeight.w500,
            //   //                   fontSize: 14),
            //   //               textAlign: TextAlign.center,
            //   //             ),
            //   //             const SizedBox(
            //   //               height: 10,
            //   //             ),
            //   //             Text(
            //   //               productPrice,
            //   //               style: const TextStyle(
            //   //                   fontFamily: 'Amiri',
            //   //                   color: ColorApp.lightblue,
            //   //                   fontWeight: FontWeight.w600,
            //   //                   fontSize: 20),
            //   //               textAlign: TextAlign.center,
            //   //               maxLines: 1,
            //   //               softWrap: true,
            //   //             ),
            //   //           ],
            //   //         ),
            //   //       ),
            //   //       actions: <Widget>[
            //   //         IconButton(
            //   //             splashColor: Colors.green,
            //   //             icon: const Icon(
            //   //               Icons.done,
            //   //               color: Colors.blue,
            //   //             ),
            //   //             onPressed: () {
            //   //               Navigator.of(context).pop();
            //   //             })
            //   //       ],
            //   //     ),
            //   //   );
            //   // },
            //   child: const Icon(
            //     Icons.arrow_downward_rounded,
            //     color: ColorApp.blue,
            //   ),
            // ),
          ]),
        ),
      ),
    );

    // SizedBox(
    //   width: double.infinity,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Column(children: [
    //         CircleAvatar(
    //           foregroundColor: ColorApp.white,
    //           foregroundImage: AssetImage(storeLogo),
    //           radius: 40,
    //         ),
    //       ]),
    //       const SizedBox(width: 10),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Text(
    //             storeName,
    //             maxLines: 3,
    //             softWrap: true,
    //             style: const TextStyle(
    //               fontSize: 24,
    //               fontWeight: FontWeight.bold,
    //               color: ColorApp.blue,
    //             ),
    //           ),
    //           const SizedBox(height: 10),
    //           RatingBar.builder(
    //             initialRating: initialRating ?? 0.0,
    //             minRating: 1,
    //             direction: Axis.horizontal,
    //             allowHalfRating: true,
    //             itemCount: 5,
    //             itemSize: 25,
    //             ignoreGestures: true,
    //             itemBuilder: (context, _) => const Icon(
    //               Icons.star,
    //               color: Colors.amber,
    //             ),
    //             onRatingUpdate: (rating) {
    //               print(rating);
    //             },
    //           ),
    //           const SizedBox(height: 15),
    //           Center(
    //             child: Text(
    //               storeLocation,
    //               style: const TextStyle(fontSize: 18, color: ColorApp.grey),
    //               textAlign: TextAlign.center,
    //             ),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //       FilledButton(
    //         style: ElevatedButton.styleFrom(
    //           backgroundColor: Colors.transparent,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           padding: const EdgeInsets.all(10),
    //           textStyle: const TextStyle(fontSize: 20),
    //           alignment: const Center().alignment,
    //         ),
    //         onPressed: () {
    //           Get.toNamed(RouteApp.storeprofile,
    //               arguments: {'store_id': controller.storeId});
    //           // Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
    //           //     MaterialPageRoute(builder: (context) => const StoreProfile()),
    //           //     (route) => true);
    //         },
    //         child: const Icon(
    //           Icons.arrow_back_ios_new,
    //           color: ColorApp.blue,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
