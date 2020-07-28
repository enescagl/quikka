import 'package:flutter/material.dart';

enum StatisticsBoxPosition { left, center, right }

class StatisticsBox extends StatelessWidget {
  final StatisticsBoxPosition position;
  final double height;
  final Widget header;
  final Widget body;

  StatisticsBox({this.position, this.height, this.header, this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          header,
          body,
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: position != StatisticsBoxPosition.center
            ? BorderRadius.only(
                topRight: position == StatisticsBoxPosition.right
                    ? Radius.circular(4)
                    : Radius.zero,
                topLeft: position == StatisticsBoxPosition.left
                    ? Radius.circular(4)
                    : Radius.zero,
                bottomLeft: position == StatisticsBoxPosition.left
                    ? Radius.circular(4)
                    : Radius.zero,
                bottomRight: position == StatisticsBoxPosition.right
                    ? Radius.circular(4)
                    : Radius.zero,
              )
            : null,
      ),
      height: height,
    );
  }
}
