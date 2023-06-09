import 'package:ccp_starter/example/themes/example_color.dart';
import 'package:ccp_starter/example/themes/example_insets.dart';
import 'package:ccp_starter/example/themes/example_textstyle.dart';
import 'package:ccp_starter/example/ui/components/example_section/example_custom_section.dart';
import 'package:ccp_starter/example/ui/components/example_wrapper/example_card_wrapper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamplePieChart extends StatefulWidget {
  const ExamplePieChart({super.key, required this.data});
  final List data;

  @override
  State<ExamplePieChart> createState() => _ExamplePieChartState();
}

class _ExamplePieChartState extends State<ExamplePieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ExampleCustomSection(
      title: 'Pie Chart',
      child: ExampleCardWrapper(
        margin: EdgeInsets.symmetric(horizontal: margin16.w),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
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
                    centerSpaceRadius: 0,
                    sections: showingSections(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 8.w,
                  runSpacing: 4.h,
                  children: widget.data
                      .map(
                        (item) => Indicator(
                          color: item['color'] ?? Colors.grey,
                          text: item['name'] ?? '-',
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    double totalSum = 0;
    for (var item in widget.data) {
      totalSum = totalSum + item['social'] + 0.0;
    }

    return List.generate(widget.data.length, (index) {
      var item = widget.data[index];
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 20.0.sp : 10.0.sp;
      final radius = isTouched ? 130.0.w : 120.0.w;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      double tmpValue = (item['social'] / totalSum) * 100;
      double value = double.parse(tmpValue.toStringAsFixed(1));

      return PieChartSectionData(
        color: item['color'] ?? Colors.grey,
        value: value,
        title: '$value%',
        radius: radius,
        titlePositionPercentageOffset: 0.8,
        badgePositionPercentageOffset: 0.8,
        showTitle: !isTouched,

        // widget ketika di klik
        badgeWidget: isTouched
            ? ExampleCardWrapper(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                color: item['color'] ?? Colors.grey,
                child: SizedBox(
                  width: 140.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${item['name']}',
                        style: TextStyle(
                            color: colorWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            shadows: const []),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '$value%',
                        style: TextStyle(
                            color: colorWhite,
                            fontSize: 14.sp,
                            fontWeight: semiBold,
                            shadows: const []),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    this.textColor,
  });
  final Color color;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: colorWhite,
          ),
        )
      ],
    );
  }
}
