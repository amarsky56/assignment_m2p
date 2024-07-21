import 'package:assignment/app/services/colors.dart';
import 'package:assignment/app/services/responsive_size.dart';
import 'package:flutter/material.dart';

import '../../../res/dimens.dart';
import '../../../widgets/img_view.dart';

class SendMoneyCard extends StatelessWidget {
  final String title;
  final String img;

  const SendMoneyCard({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.pad4),
      child: SizedBox(
        width: Dimens.width80,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.radius100),
                child: Container(color: context.kWhite1, child: ImgView(height: Dimens.width47, width: Dimens.width47, imagePath: img))),
            Dimens.height8.kheightBox,
            Text(title.replaceAll(" ", "\n"), textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
