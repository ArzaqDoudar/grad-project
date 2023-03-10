import '/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:rotation_stage/rotation_stage.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RotationStage(
      contentBuilder: (
        int index,
        RotationStageSide side,
        double currentPage,
      ) =>
          Card(
        child: Container(
          color: ColorApp.blue,
          width: 100,
          height: 100,
          child: Center(
              child: Icon(
                  color: ColorApp.white,
                  side.map(
                      front: Icons.abc,
                      left: Icons.collections,
                      back: Icons.access_alarms_sharp,
                      right: Icons.add_call))
              // Text(
              //   side.map(
              //     front: "hi",
              //     left: "Left",
              //     back: "Back",
              //     right: "Right",
              //   ),
              //   style: const TextStyle(color: ColorApp.white, fontSize: 20),
              // ),
              ),
        ),
      ),
    );
  }
}
