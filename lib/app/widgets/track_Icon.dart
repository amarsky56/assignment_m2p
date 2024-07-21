import 'package:assignment/app/services/responsive_size.dart';
import 'package:assignment/app/widgets/img_view.dart';
import 'package:flutter/material.dart';

class TrackIcon extends StatelessWidget {
  final imgPath;
  final color;

  const TrackIcon({super.key, required this.imgPath, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.kh,
      width: 24.kw,
      child: ImgView(
        imagePath: imgPath,
        height: 24.kh,
        width: 24.kh,
        color: color,
      ),
    );
  }
}
