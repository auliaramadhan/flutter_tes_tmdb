import 'package:flutter/material.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import '../../theme/app_color.dart';

class ScrollIndicatorCircle extends StatelessWidget {
  final int imagesLength;
  final int currentIndex;
  const ScrollIndicatorCircle({
    Key? key,
    required this.imagesLength,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: EdgeInsets.all(3),
          height: 10,
          width: currentIndex == index ? 24 :10,
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColor.primary : Colors.black26,
            borderRadius: BorderRadius.circular(10)
          ),
        );
      }),
    );
  }
}

class ScrollIndicatorLine extends StatefulWidget {
  final ScrollController scrollCtrl;

  const ScrollIndicatorLine({
    Key? key,
    required this.scrollCtrl,
  }) : super(key: key);

  @override
  State<ScrollIndicatorLine> createState() => _ScrollIndicatorLineState();
}

class _ScrollIndicatorLineState extends State<ScrollIndicatorLine> {
  double curentPosition = 0;
  double indicatorlength = 0;
  double indicatorMaxlength = 80;
  double indicatorratio = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 0),
      () {
        setState(() {
          indicatorratio = (widget.scrollCtrl.position.maxScrollExtent + SizeConfig.screenWidth - 32) / indicatorMaxlength;
          indicatorlength = (SizeConfig.screenWidth - 32) / indicatorratio;
        });
      },
    );
    widget.scrollCtrl.addListener(() {
      setState(() {
        curentPosition = (widget.scrollCtrl.offset) / indicatorratio;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(3),
            width: indicatorMaxlength,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            left: curentPosition,
            child: Container(
              margin: EdgeInsets.all(3),
              width: indicatorlength,
              height: 10,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
