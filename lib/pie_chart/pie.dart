import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:table_and_charts/pie_chart/indicator.dart';

class PieChartSample extends StatefulWidget {
  const PieChartSample({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

// Pie chart kullanmak icin bu class call edilmeli. Suanlık static-sabit veri ile calisiyor. Disaridan parametre alacak hale getirilmeli.

class PieChart2State extends State {
  int touchedIndex = -1;
  double value1 = 35;
  double value2 = 15;
  double value3 = 20;
  double value4 = 40;
  String name1 = 'first';
  String name2 = 'second';
  String name3 = 'third';
  String name4 = 'fourth';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: name1,
                isSquare: true,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: name2,
                isSquare: true,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff845bef),
                text: name3,
                isSquare: true,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: name4,
                isSquare: true,
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: value1,
            title: '${value1.toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: value2,
            title: '${value2.toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: value3,
            title: '${value3.toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: value4,
            title: '${value4.toString()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}