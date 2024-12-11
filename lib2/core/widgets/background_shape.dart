
import 'package:flutter/material.dart';

class BackGroundShape extends StatelessWidget {
  const BackGroundShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}