import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';

Future<void> main() async {
  // Initialize Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Create a simple icon with the letter S
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final size = const Size(1024, 1024);
  
  // Draw background
  final paint = Paint()..color = const Color(0xFF675AF2);
  canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  
  // Draw letter S
  const textStyle = TextStyle(
    color: Colors.white,
    fontSize: 600,
    fontWeight: FontWeight.bold,
  );
  
  final textSpan = TextSpan(
    text: 'S',
    style: textStyle,
  );
  
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );
  
  textPainter.layout(
    minWidth: 0,
    maxWidth: size.width,
  );
  
  final xCenter = (size.width - textPainter.width) / 2;
  final yCenter = (size.height - textPainter.height) / 2;
  final offset = Offset(xCenter, yCenter);
  
  textPainter.paint(canvas, offset);
  
  // Convert to image
  final picture = recorder.endRecording();
  final img = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();
  
  // Save the image
  final file = File('assets/images/app_icon.png');
  await file.writeAsBytes(buffer);
  
  // Create foreground icon (just the letter S on transparent background)
  final recorderFg = ui.PictureRecorder();
  final canvasFg = Canvas(recorderFg);
  
  // Draw letter S on transparent background
  textPainter.paint(canvasFg, offset);
  
  // Convert to image
  final pictureFg = recorderFg.endRecording();
  final imgFg = await pictureFg.toImage(size.width.toInt(), size.height.toInt());
  final byteDataFg = await imgFg.toByteData(format: ui.ImageByteFormat.png);
  final bufferFg = byteDataFg!.buffer.asUint8List();
  
  // Save the foreground image
  final fileFg = File('assets/images/app_icon_foreground.png');
  await fileFg.writeAsBytes(bufferFg);
  
  print('Icons generated successfully!');
  exit(0);
}
