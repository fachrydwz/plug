import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'widget/filter_carousel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: PhotoFilterCarousel(camera: firstCamera),
      debugShowCheckedModeBanner: false,
    ),
  );
}
