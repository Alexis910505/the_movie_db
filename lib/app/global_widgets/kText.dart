
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie/app/theme/appColors.dart';


class KText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? wordSpacing;

  final TextDirection? textDirection;
  final TextDecoration? decoration;

  const KText({Key? key, 
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.wordSpacing,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: GoogleFonts.poppins(
        decoration: decoration,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? white,
        wordSpacing: wordSpacing,
      ),
      maxLines: maxLines,
      textAlign: TextAlign.justify,
      textDirection: textDirection,
      overflow: TextOverflow.ellipsis,
    );
  }
}
