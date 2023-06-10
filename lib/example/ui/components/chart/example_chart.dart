import 'package:ccp_starter/example/helper/example_helper.dart';
import 'package:ccp_starter/example/values/example_insets.dart';
import 'package:ccp_starter/example/values/example_color.dart';
import 'package:ccp_starter/example/ui/components/indicator/example_swiper_indicator.dart';
import 'package:ccp_starter/example/ui/components/section/example_custom_section.dart';
import 'package:ccp_starter/example/ui/components/wrapper/example_card_wrapper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExampleChart extends StatefulWidget {
  const ExampleChart({super.key, this.data});
  final dynamic data;
  final Color leftBarColor = Colors.green;
  final Color centerBarColor = Colors.red;
  final Color rightBarColor = Colors.blue;
  final Color avgColor = Colors.orange;
  @override
  State<StatefulWidget> createState() => ExampleChartState();
}

class ExampleChartState extends State<ExampleChart> {
  List chartList = [];

  @override
  void initState() {
    super.initState();
    seperateChartData(widget.data);
  }

  seperateChartData(List chartData) {
    List<List<dynamic>> dividedLists = [];
    int totalItems = chartData.length;
    int itemsPerList = 7;

    for (int i = 0; i < totalItems; i += itemsPerList) {
      dividedLists.add(chartData.sublist(
          i, i + itemsPerList > totalItems ? totalItems : i + itemsPerList));
    }
    chartList = [...dividedLists];
    // log the divided lists
    for (int i = 0; i < chartList.length; i++) {
      // log('List ${i + 1}: ${chartList[i]}');
    }

    initChartData(tabIndex);
  }

  List chartTab = [];
  int tabIndex = 0;
  int touchedGroupIndex = -1;
  List<BarChartGroupData> rawBarGroups = <BarChartGroupData>[];
  List<BarChartGroupData> showingBarGroups = <BarChartGroupData>[];
  initChartData(idx) {
    chartTab = chartList[idx];
    List tmpList = chartTab;
    final List<BarChartGroupData> items = [
      ...tmpList
          .map(
            (item) => makeGroupData(
              tmpList.indexOf(item),
              y1: item['positive'] + 0.0,
              y2: item['negative'] + 0.0,
              y3: item['neutral'] + 0.0,
            ),
          )
          .toList(),
    ];

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  nextChart() {
    if (tabIndex < chartList.length - 1) {
      tabIndex += 1;
      initChartData(tabIndex);
    }
    setState(() {});
  }

  previousChart() {
    if (tabIndex > 0) {
      tabIndex -= 1;
      initChartData(tabIndex);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ExampleCustomSection(
      title: 'Chart',
      trailing: ExampleSwiperIndicator(
        currentIndex: tabIndex,
        dataLength: chartList.length,
        previousTap: () => previousChart(),
        nextTap: () => nextChart(),
      ),
      child: ExampleCardWrapper(
        margin: EdgeInsets.symmetric(horizontal: margin16.w),
        padding: EdgeInsets.fromLTRB(margin16.w, margin24.h, margin16.w, 24.h),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Expanded(
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceEvenly,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: colorDarkBlue,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          var item = chartTab[groupIndex];

                          var positiveCount = item['positive'].floor();
                          var negativeCount = item['negative'].floor();
                          var neutralCount = item['neutral'].floor();
                          var totalCount =
                              positiveCount + negativeCount + neutralCount;
                          return BarTooltipItem(
                            '${item['name']}\n',
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // height: 2,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.start,
                            children: [
                              TextSpan(
                                text: '\n',
                                style: TextStyle(
                                  color: Colors.blue[400]!,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 0.2,
                                ),
                              ),
                              TextSpan(
                                text: '•  ',
                                style: TextStyle(
                                  color: Colors.blue[400]!,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'neutral: $neutralCount\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '•  ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'negative: $negativeCount\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '•  ',
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 78, 241, 100),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'positive: $positiveCount\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Total: $totalCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 2.0,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      touchCallback: (FlTouchEvent event, response) {},
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 30,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          interval: 1,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.w),
                      child: Row(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.h,
                            margin: EdgeInsets.only(right: 4.w),
                            color: const Color.fromARGB(255, 78, 241, 100),
                          ),
                          Text(
                            'positive',
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8.w),
                      child: Row(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.h,
                            margin: EdgeInsets.only(right: 4.w),
                            color: Colors.red,
                          ),
                          Text(
                            'negative',
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 0.w),
                      child: Row(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.h,
                            margin: EdgeInsets.only(right: 4.w),
                            color: Colors.blue[400]!,
                          ),
                          Text(
                            'neutral',
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: const Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    );
    String text;
    double maxCount = meta.max;

    if (value == 0) {
      text = '0';
    } else if (value == (maxCount * 0.2).floor()) {
      text = Helper.formatNumber(maxCount * 0.2);
    } else if (value == (maxCount * 0.4).floor()) {
      text = Helper.formatNumber(maxCount * 0.4);
    } else if (value == (maxCount * 0.6).floor()) {
      text = Helper.formatNumber(maxCount * 0.6);
    } else if (value == (maxCount * 0.8).floor()) {
      text = Helper.formatNumber(maxCount * 0.8);
    } else if (value == maxCount) {
      text = Helper.formatNumber(maxCount);
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    var item = chartTab[value.toInt()];

    String name = item['name'] ?? '-';

    final Widget text = Text(
      name,
      style: TextStyle(
        color: const Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16.w, //margin top
      child: text,
    );
  }
}

BarChartGroupData makeGroupData(
  int x, {
  double y1 = 0.0,
  double y2 = 0.0,
  double y3 = 0.0,
  bool isTouched = false,
}) {
  double sum = y1 + y2 + y3;

  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(
          toY: sum,
          color: Colors.green,
          width: 16.w,
          borderRadius: BorderRadius.circular(0),
          rodStackItems: [
            // neutral y3
            BarChartRodStackItem(y1 + y2, y1 + y2 + y3, Colors.blue[400]!),

            // negative y2
            BarChartRodStackItem(y1, y1 + y2, colorRed),

            // positive y1
            BarChartRodStackItem(
                0, y1, const Color.fromARGB(255, 78, 241, 100)),
          ]),
    ],
  );
}
