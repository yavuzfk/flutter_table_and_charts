import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'dart:convert';

// Initial Value
// List<Map<String, Object>> _data1 = [
//   {'name': 'Please wait', 'value': 0}
// ];

// Mock Data
// List<Map<String,Object>> tableList= [
//   {
//     'name': 'Jan',
//     'value': 8726.2453,
//   },
//   {
//     'name': 'Feb',
//     'value': 2445.2453,
//   },
//   {
//     'name': 'Mar',
//     'value': 6636.2400,
//   },
//   {
//     'name': 'Apr',
//     'value': 4774.2453,
//   },
//   {
//     'name': 'May',
//     'value': 1066.2453,
//   },
//   {
//     'name': 'Jun',
//     'value': 4576.9932,
//   },
//   {
//     'name': 'Jul',
//     'value': 8926.9823,
//   }
// ];



class OneVariableTable extends StatelessWidget {
  const OneVariableTable({
    Key? key,
    required List<Map<String, Object>> data1,
  }) : _data1 = data1, super(key: key);

  final List<Map<String, Object>> _data1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      child: Echarts(
        option: '''
              {
                dataset: {
                  dimensions: ['name', 'value'],
                  source: ${jsonEncode(_data1)},
                },
                color: ['#3398DB'],
                legend: {
                  data: ['直接访问', '背景'],
                  show: false,
                },
                grid: {
                  left: '0%',
                  right: '0%',
                  bottom: '5%',
                  top: '7%',
                  height: '85%',
                  containLabel: true,
                  z: 22,
                },
                xAxis: [{
                  type: 'category',
                  gridIndex: 0,
                  axisTick: {
                    show: false,
                  },
                  axisLine: {
                    lineStyle: {
                      color: '#0c3b71',
                    },
                  },
                  axisLabel: {
                    show: true,
                    color: 'rgb(170,170,170)',
                    formatter: function xFormatter(value, index) {
                      if (index === 6) {
                        return `\${value}\\n*`;
                      }
                      return value;
                    },
                  },
                }],
                yAxis: {
                  type: 'value',
                  gridIndex: 0,
                  splitLine: {
                    show: false,
                  },
                  axisTick: {
                      show: false,
                  },
                  axisLine: {
                    lineStyle: {
                      color: '#0c3b71',
                    },
                  },
                  axisLabel: {
                    color: 'rgb(170,170,170)',
                  },
                  splitNumber: 12,
                  splitArea: {
                    show: true,
                    areaStyle: {
                      color: ['rgba(250,250,250,0.0)', 'rgba(250,250,250,0.05)'],
                    },
                  },
                },
                series: [{
                  name: '合格率',
                  type: 'bar',
                  barWidth: '50%',
                  xAxisIndex: 0,
                  yAxisIndex: 0,
                  itemStyle: {
                    normal: {
                      barBorderRadius: 5,
                      color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [
                          {
                            offset: 0, color: '#00feff',
                          },
                          {
                            offset: 1, color: '#027eff',
                          },
                          {
                            offset: 1, color: '#0286ff',
                          },
                        ],
                      },
                    },
                  },
                  zlevel: 11,
                }],
              }
            ''',
        extraScript: '''
              chart.on('click', (params) => {
                if(params.componentType === 'series') {
                  Messager.postMessage(JSON.stringify({
                    type: 'select',
                    payload: params.dataIndex,
                  }));
                }
              });
            ''',
      ),
    );
  }
}
