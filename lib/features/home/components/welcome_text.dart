import 'package:flutter/material.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Yuhuu ,Your work Is',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Row(
          children: [
            Text(
              'almost done ! ',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            CustomSvgPicture.withoutColor(
                path: 'assets/images/waving_hand.svg'),
          ],
        ),
      ],
    );
  }
}
