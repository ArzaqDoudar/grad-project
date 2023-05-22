import 'package:flutter/material.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../widget/sectopbar.dart';

class StoreProfile extends StatefulWidget {
  const StoreProfile({super.key});

  @override
  State<StoreProfile> createState() => StoreProfileState();
}

class StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: ColorApp.white,
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'متجر شوفانكم',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: screenWidth > 480
                ? EdgeInsets.symmetric(horizontal: screenWidth * 0.3)
                : const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage(ImageAsset.store1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'متجر شوفانكم',
                  style: TextStyle(
                      fontFamily: 'Amiri',
                      color: ColorApp.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'رام الله شارع الارسال',
                      style: TextStyle(
                          fontFamily: 'Amiri',
                          color: ColorApp.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    Text(
                      '0568415330',
                      style: TextStyle(
                          fontFamily: 'Amiri',
                          color: ColorApp.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
                const Divider(),
                // const SizedBox(
                //   height: 20,
                // ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.6),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(ImageAsset.bread),
                                const Text(
                                  'خبز صحي',
                                  style: TextStyle(
                                      fontFamily: 'Amiri',
                                      color: ColorApp.blue,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                                const Text(
                                  '10 شيكل',
                                  style: TextStyle(
                                      fontFamily: 'Amiri',
                                      color: ColorApp.lightblue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                                const SizedBox(
                                  height: 20,
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
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (context) => AlertDialog(
                                        contentPadding:
                                            const EdgeInsets.all(10.0),
                                        title: const Text(
                                          'خبز صحي',
                                          style: TextStyle(
                                            fontFamily: 'Amiri',
                                            fontSize: 40,
                                            color: ColorApp.blue,
                                          ),
                                        ),
                                        content: SizedBox(
                                          // Specify some width
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: Column(
                                            children: [
                                              Image.asset(ImageAsset.bread),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                ' خبز زاكي كتير و صحي و خالي من الغلوتين و مناسب لمرضى السكري و لمرضى القلب',
                                                style: TextStyle(
                                                    fontFamily: 'Amiri',
                                                    color: ColorApp.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 25),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text(
                                                '10 شيكل',
                                                style: TextStyle(
                                                    fontFamily: 'Amiri',
                                                    color: ColorApp.lightblue,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
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
                                  child: const Icon(
                                    Icons.arrow_downward_rounded,
                                    color: ColorApp.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ],
            ),
          ),
        ));
  }
}
