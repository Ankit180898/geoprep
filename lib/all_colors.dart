import 'package:flutter/material.dart';

class Style {
  Color primary_color = Color(0xFF00AA00);
  Color bg = Color(0xff0c0c30);
  Color accent = Color(0xFFFF2D55);
  Color secondary = Color(0xFF7E7E7E);
  Color miniText = Color(0xff9494A9);
  Color disabledText = Color(0xffCCEECC);

  //add from vivek
  // static Color pDXBeam_azure_green = Color(0xFF0080ff);
  static Color blue = Color(0xFF0080FF);
  static Color disabled_green = Color(0xFFCCEECC);
  static Color main_profile_back = Color(0xFFF8FDF8);
  static Color white_color = Colors.white;
  static Color secondary_Yellow_Green = Color(0xFF00AA00);
  static Color alert_scarlet_red = Color(0xFFFF2700);
  static Color alert_scarlet_green = Color(0xFF32CD32);
  static Color gray = Color(0xFF89909A);
  static Color mediumGray = Color(0xffCED3D9);
  static Color veryLightGray = Color(0xFFF5F6F8);
  static Color primaryJetBlack = Color(0xFF0A0A0A);
  static Color secondaryMikadoYellow = Color(0xFFFFC600);
  static Color lightyellow = Color(0xFFFFF6D7);
  static Color lightGray = Color(0xFFE6EAED);
  static Color disabledBlue = Color(0xFFCCE6FF);
  static Color hover_green = Color(0xFF028A02);

  //Todo change name
  static Color border_box = Color(0xFFE5F6E5);
  static Color dotted_border = Color(0xFF32CD32);
  Color main_black = Color(0xFF0A0A0A);

  static MaterialColor pDXBeam_azure_green = MaterialColor(0xFF0080FF, {
    50: Color(0xFF0080FF).withOpacity(.1),
    100: Color(0xFF0080FF).withOpacity(.2),
    200: Color(0xFF0080FF).withOpacity(.3),
    300: Color(0xFF0080FF).withOpacity(.4),
    400: Color(0xFF0080FF).withOpacity(.5),
    500: Color(0xFF0080FF).withOpacity(.6),
    600: Color(0xFF0080FF).withOpacity(.7),
    700: Color(0xFF0080FF).withOpacity(.8),
    800: Color(0xFF0080FF).withOpacity(.9),
    900: Color(0xFF0080FF).withOpacity(1),
  });
  showCustomColor() {
    ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => const RadialGradient(
        center: Alignment.topCenter,
        stops: [.5, 1],
        colors: [
          Colors.pink,
          Colors.yellow,
        ],
      ).createShader(bounds),
    );
  }
}


