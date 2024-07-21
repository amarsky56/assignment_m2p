import 'package:assignment/app/services/responsive_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../res/dimens.dart';
import '../res/strings.dart';
import '../services/text_style_util.dart';

class EmptyPage extends StatelessWidget {
  final String? title;
  final String? img;

  const EmptyPage({super.key,  this.title, this.img});

  get imagePath => null;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(Assets.lottiefilesEmpty),
          Dimens.height16.kheightBox,
          Text(title ?? Strings.notFound, style: TextStyleUtil.k16(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
