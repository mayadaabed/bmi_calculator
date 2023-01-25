import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/colors.dart';

TextStyle textStyle({
  final double fontSize = 20,
  final color = white,
  final FontWeight fontWeight = FontWeight.normal,
}) =>
    GoogleFonts.poppins(
        fontSize: fontSize, color: color, fontWeight: fontWeight);

Widget floatButton(
        {required final String tag,
        final IconData icon = Icons.remove,
        required void Function()? function}) =>
    FloatingActionButton(
        heroTag: tag,
        mini: true,
        backgroundColor: red,
        onPressed: function,
        child: Icon(icon));
