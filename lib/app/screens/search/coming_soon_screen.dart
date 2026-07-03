import 'package:flutter/material.dart';

import '../../constants/assetConstant.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          AssetConstant.comingSoon,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
