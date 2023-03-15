import 'package:flutter/material.dart';
import '/core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Store extends StatelessWidget {
  final String storeName;
  final String storeLocation;
  final String storeLogo;

  const Store({
    super.key,
    required this.storeName,
    required this.storeLocation,
    required this.storeLogo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                initialRating: 3,
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(width: 110),
                  Text(
                    storeLocation,
                    style: const TextStyle(fontSize: 18, color: ColorApp.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 30),
          Column(children: const [
            CircleAvatar(
              foregroundImage: AssetImage(ImageAsset.store1),
              radius: 65,
            ),
          ]),
        ],
      ),
    );
  }
}
