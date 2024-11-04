import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'filter_selector.dart';

class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  _PhotoFilterCarouselState createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  final _filterColor = ValueNotifier<Color>(Colors.transparent);

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _onFilterChanged(Color color) {
    _filterColor.value = color.withOpacity(0.3); // Menurunkan opasitas agar filter terlihat lebih baik
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
       
