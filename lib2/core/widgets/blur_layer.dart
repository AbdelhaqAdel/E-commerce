import 'dart:ui';

import 'package:flutter/material.dart';

class BlurLayer extends StatelessWidget {
  const BlurLayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 300, sigmaY: 300),
        child: const SizedBox(),
      ),
    );
  }
}
