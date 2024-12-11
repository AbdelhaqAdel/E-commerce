import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({super.key,required this.onTap,required this.tapIndex});
  final Function(int) onTap;
  final int tapIndex;
  @override
  Widget build(BuildContext context) {
    return 
          TabBar(
            onTap: (index) {
              onTap(index);
            },
            indicatorColor:
            tapIndex == 0 ? Colors.red : Colors.teal,
            indicatorWeight: 5,
            splashBorderRadius: BorderRadius.circular(25),
            indicatorSize: TabBarIndicatorSize.label,
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.book,
                      color: tapIndex == 0
                          ? Colors.red
                          : Colors.black.withOpacity(.6),
                      size: tapIndex == 0 ? 25 : 22,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Lecture',
                      style: TextStyle(
                        fontSize: tapIndex == 0 ? 20 : 18,
                        color: tapIndex== 0
                            ? Colors.red
                            : Colors.black.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.laptopCode,
                      color: tapIndex == 1
                          ? Colors.teal
                          : Colors.black.withOpacity(.6),
                      size: tapIndex == 1 ? 25 : 22,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Lab',
                      style: TextStyle(
                        fontSize:tapIndex== 1 ? 20 : 18,
                        color:tapIndex == 1
                            ? Colors.teal
                            : Colors.black.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}