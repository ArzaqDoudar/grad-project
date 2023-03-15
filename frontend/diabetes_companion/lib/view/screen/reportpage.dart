import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
          child: SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),
              series: <LineSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
                // Bind data source
                dataSource: <SalesData>[
                  SalesData('Jan', 30),
                  SalesData('Feb', 28),
                  SalesData('Mar', 34),
                  SalesData('Apr', 32),
                  SalesData('May', 40)
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales)
          ])),
    ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

// import 'package:flutter/material.dart';

// class ReportPage extends StatelessWidget {
//   const ReportPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       // bottomNavigationBar: Cu(),
//       body: Text(
//         'Report',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
