import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import '../../core/constant/color.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.screenWidth,
    required this.veryhigh,
    required this.high,
    required this.normal,
    required this.low,
    required this.doses,
  });

  final double screenWidth;
  final int veryhigh;
  final int high;
  final int normal;
  final int low;
  final int doses;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                'وحدات الأنسولين',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.grey1),
              ),
              SizedBox(
                width: screenWidth * 0.35,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: DChartGauge(
                    donutWidth: 20,
                    data: [
                      {'domain': 'normal', 'measure': doses + 1},
                    ],
                    fillColor: (pieData, index) => ColorApp.blue,
                    // showLabelLine: true,
                    pieLabel: (pieData, index) {
                      return "${pieData['measure'] - 1}";
                    },
                    labelPosition: PieLabelPosition.inside,
                    labelPadding: 0,
                    labelColor: ColorApp.white,
                    labelFontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'سكر الدم',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.grey1),
              ),
              SizedBox(
                width: screenWidth * 0.35,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DChartGauge(
                    donutWidth: 20,
                    data: [
                      {'domain': 'very high', 'measure': veryhigh + 1},
                      {'domain': 'high', 'measure': high + 1},
                      {'domain': 'normal', 'measure': normal + 1},
                      {'domain': 'low', 'measure': low + 1},
                    ],
                    fillColor: (pieData, index) {
                      switch (pieData['domain']) {
                        case 'normal':
                          return ColorApp.green;
                        case 'high':
                          return ColorApp.yellow;
                        case 'very high':
                          return ColorApp.orange;
                        default:
                          return ColorApp.red;
                      }
                    },
                    // showLabelLine: true,
                    pieLabel: (pieData, index) {
                      return "${pieData['measure'] - 1}";
                    },
                    labelPosition: PieLabelPosition.inside,
                    labelPadding: 0,
                    labelColor: ColorApp.white,
                    labelFontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
