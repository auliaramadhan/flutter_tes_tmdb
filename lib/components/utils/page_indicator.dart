import 'package:flutter/material.dart';
import 'package:flutter_starter_private/components/spacing.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
class PageIndicatorLine extends StatelessWidget {
  PageIndicatorLine({
    Key? key,
    required this.curentPage,
    required this.pageCount,
    this.indicatorMaxlength,
  }) : super(key: key);
  final int curentPage;
  final int pageCount;
  final double? indicatorMaxlength;
  final double indicatorScreenlength = SizeConfig.screenWidth - 32;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        children: [
          const ExtraHeight(32),
          Container(
            width: indicatorMaxlength ?? indicatorScreenlength,
            height: 10,
            color: Colors.black26,
          ),
          Positioned(
            left: 0,
            child: Container(
              width: (indicatorMaxlength ?? indicatorScreenlength) * (curentPage / pageCount),
              height: 10,
              color: Colors.blue,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
