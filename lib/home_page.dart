import 'package:flutter/material.dart';
import 'package:table_and_charts/pie_chart/pie.dart';
import 'package:table_and_charts/ring_chart/ring_chart.dart';
import 'package:table_and_charts/three_bar_table/three_bar_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Text('One Variable Table',
                style: TextStyle(fontSize: 20)),
          ),
          // OneVariableTable(data1: _data1),
          // PieChartSample()
          ThreeBarChart(),
          SizedBox(height: 30),
          RingChart(),
        ],
      ),),
    );
  }
}

