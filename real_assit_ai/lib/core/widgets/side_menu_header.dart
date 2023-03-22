import 'package:flutter/material.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';

import '../constants/assets.dart';
import '../theme/text_styles.dart';

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 8.dH),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.dW),
              child: Image.asset(
                AppImages.logo,
                height: 22.dW,
                width: 22.dW,
              ),
            ),
            Text(
              'Real Assist AI',
              style: TextStyles.boldLarge18.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
