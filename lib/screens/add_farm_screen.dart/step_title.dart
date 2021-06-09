import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StepTitle extends StatelessWidget {
  StepTitle(this.title, this.maxLines, this.color, this.fontSize, this.group);
  final String title; 
  final int maxLines;
  final double fontSize;
  final Color color;
  final AutoSizeGroup group;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: maxLines,
      stepGranularity: 0.1,
      minFontSize: 10,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
      group: group,
    );
  }
}