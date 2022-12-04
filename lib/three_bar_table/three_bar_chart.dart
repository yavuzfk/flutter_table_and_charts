import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';

class ThreeBarChart extends StatelessWidget {
  const ThreeBarChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          const RotatedBox(
            quarterTurns: 1,
            child: Text(
              'Year',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar 1',
                        'data': [
                          {'domain': '2020', 'measure': 32},
                          {'domain': '2021', 'measure': 43},
                          {'domain': '2022', 'measure': 29},
                          {'domain': '2023', 'measure': 16},
                        ],
                      },
                      {
                        'id': 'Bar 2',
                        'data': [
                          {'domain': '2020', 'measure': 24},
                          {'domain': '2021', 'measure': 42},
                          {'domain': '2022', 'measure': 9},
                          {'domain': '2023', 'measure': 37},
                        ],
                      },
                      {
                        'id': 'Bar 3',
                        'data': [
                          {'domain': '2020', 'measure': 17},
                          {'domain': '2021', 'measure': 28},
                          {'domain': '2022', 'measure': 12},
                          {'domain': '2023', 'measure': 30},
                        ],
                      },
                    ],
                    minimumPaddingBetweenLabel: 1,
                    domainLabelPaddingToAxisLine: 16,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 10,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => id == 'Bar 1'
                        ? Colors.green.shade300
                        : id == 'Bar 2'
                        ? Colors.green.shade600
                        : Colors.green.shade900,
                    barValue: (barData, index) =>
                    '${barData['measure']}',
                    showBarValue: true,
                    barValueFontSize: 12,
                    barValuePosition: BarValuePosition.outside,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Year',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}