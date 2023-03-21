import 'package:flutter/material.dart';

class Backgroud {
  GetBackgroudColor({required String type}) {
    var color;
    Color backgroud = Color.fromARGB(255, 110, 109, 109);
    if (type == 'Flay') {
      backgroud = const Color(0xff9EB1D8);
    } else if (type == 'Poison') {
      backgroud = const Color(0xffC36E97);
    } else if (type == 'Groud') {
      backgroud = backgroud = const Color(0xFFF78551);
    } else if (type == 'Rock') {
      backgroud = const Color(0xffD4C294);
    } else if (type == 'Bug') {
      backgroud = const Color(0xff86D674);
    } else if (type == 'Ghost') {
      backgroud = const Color(0xff8571BE);
    } else if (type == 'Steel') {
      backgroud = const Color(0xff4C91B2);
    } else if (type == 'Fire') {
      backgroud = const Color(0xfffd6b6d);
    } else if (type == 'Water') {
      backgroud = const Color(0xff58ABF6);
    } else if (type == 'Grass') {
      backgroud = const Color(0xff8BBE8A);
    } else if (type == 'Electric') {
      backgroud = const Color(0xFFFFC107);
    } else if (type == 'Ice') {
      backgroud = const Color(0xFf91D8DF);
    } else if (type == 'Dragon') {
      backgroud = const Color(0xFF7383B9);
    } else if (type == 'Psychic') {
      backgroud = const Color(0xFF785ecc);
    } else if (type == 'Dark') {
      backgroud = const Color(0xFF6F6E78);
    } else if (type == 'Fairy') {
      backgroud = const Color(0xFFEBA8C3);
    }

    return color = backgroud;
  }
}
