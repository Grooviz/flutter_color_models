import 'package:flutter/material.dart' show Color;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_color_models/flutter_color_models.dart';

/// A set of colors containing black, white, grey, 6 other
/// colors, each within a different part of the hue spectrum,
/// as well as pure red, green, blue, yellow, cyan, and pink.
const List<Color> _testColors = <Color>[
  Color(0xFF000000), // Black
  Color(0xFF909090), // Grey
  Color(0xFFFFFFFF), // White
  Color(0xFFF06F0C), // Hue 26°
  Color(0xFF66CC33), // Hue 101°
  Color(0xFF33CC99), // Hue 161°
  Color(0xFF0C6699), // Hue 201°
  Color(0xFF782AD4), // Hue 267°
  Color(0xFFD1106E), // Hue 331°
  Color(0xFFFF0000), // red
  Color(0xFF00FF00), // green
  Color(0xFF0000FF), // blue
  Color(0xFFFFFF00), // yellow
  Color(0xFF00FFFF), // cyan
  Color(0xFFFF00FF), // pink
];

/// The following tests convert each of the test [Color]s from
/// RGB to each of the other color spaces. They are then converted
/// back to the RGB color space and are expected to equal the
/// original RGB color value, before finally being recast
/// as a [Color] and compared to the original [Color].
void main() {
  test('CMYK Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final CmykColor cmykColor = rgbColor.toCmykColor();
      expect(rgbColor.equals(cmykColor), equals(true));
      expect(cmykColor.toColor(), equals(color));
    });
  });

  test('HSI Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final HsiColor hsiColor = rgbColor.toHsiColor();
      expect(rgbColor.equals(hsiColor), equals(true));
      expect(hsiColor.toColor(), equals(color));
    });
  });

  test('HSL Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final HslColor hslColor = rgbColor.toHslColor();
      expect(rgbColor.equals(hslColor), equals(true));
      expect(hslColor.toColor(), equals(color));
    });
  });

  test('HSP Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final HspColor hspColor = rgbColor.toHspColor();
      expect(rgbColor.equals(hspColor), equals(true));
      expect(hspColor.toColor(), equals(color));
    });
  });

  test('HSV Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final HsvColor hsvColor = rgbColor.toHsvColor();
      expect(rgbColor.equals(hsvColor), equals(true));
      expect(hsvColor.toColor(), equals(color));
    });
  });

  test('LAB Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final LabColor labColor = rgbColor.toLabColor();
      expect(rgbColor.equals(labColor), equals(true));
      expect(labColor.toColor(), equals(color));
    });
  });

  test('XYZ Conversions', () {
    _testColors.forEach((Color color) {
      final RgbColor rgbColor = RgbColor.fromColor(color);
      final XyzColor xyzColor = rgbColor.toXyzColor();
      expect(rgbColor.equals(xyzColor), equals(true));
      expect(xyzColor.toColor(), equals(color));
    });
  });

  test('Chained Conversions', () {
    _testColors.forEach((Color color) {
      Color copy = color;

      final CmykColor cmykColor = CmykColor.fromColor(copy);
      copy = cmykColor.toColor();
      expect(copy, equals(color));

      final HsiColor hsiColor = HsiColor.fromColor(copy);
      copy = hsiColor.toColor();
      expect(copy, equals(color));

      final HslColor hslColor = HslColor.fromColor(copy);
      copy = hslColor.toColor();
      expect(copy, equals(color));

      final HspColor hspColor = HspColor.fromColor(copy);
      copy = hspColor.toColor();
      expect(copy, equals(color));

      final HsvColor hsvColor = HsvColor.fromColor(copy);
      copy = hsvColor.toColor();
      expect(copy, equals(color));

      final LabColor labColor = LabColor.fromColor(copy);
      copy = labColor.toColor();
      expect(copy, equals(color));

      final RgbColor rgbColor = RgbColor.fromColor(copy);
      copy = rgbColor.toColor();
      expect(copy, equals(color));

      final XyzColor xyzColor = XyzColor.fromColor(copy);
      copy = xyzColor.toColor();
      expect(copy, equals(color));
    });
  });
}