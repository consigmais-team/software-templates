import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
      {Key? key,
      required this.fontSize,
      required this.maxLines,
      required this.title,
      required this.color,
      this.fontWeight, this.textAlign})
      : super(key: key);
  final int? maxLines;
  final double? fontSize;
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AutoSizeText(
          title,
          maxLines: maxLines,
          textAlign: textAlign ?? TextAlign.center,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.bold),
        ),
      ),
    );
  }
}
