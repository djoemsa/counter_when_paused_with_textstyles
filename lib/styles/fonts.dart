import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle oswald = GoogleFonts.oswald(
  fontSize: 40,
  color: Colors.blue,
);

TextStyle pacifico = GoogleFonts.pacifico(
  fontSize: 40,
  color: Colors.indigo,
);

TextStyle teko = GoogleFonts.teko(
  fontSize: 40,
  color: Colors.green,
);

Map<String, TextStyle> fontListMap = {
  'oswald': oswald,
  'pacifico': pacifico,
  'teko': teko
};
