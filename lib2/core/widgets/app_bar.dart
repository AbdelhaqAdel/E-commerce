import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({this.text, required this.context, super.key});
  final String? text;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30.w), 
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const FaIcon(FontAwesomeIcons.angleLeft, size: 30),
            ),
          ),
        ),
         Align(
              alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7, 
              child: Text(
                "Waged",
                overflow: TextOverflow.visible,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        
      ]
    );
  }
}
