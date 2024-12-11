import 'package:flutter/material.dart';
import 'glass_box.dart';

void alert(
    {required context,
      required String text,
      required Function no,
      required Function yes}) =>
    showDialog<String>(
      context: context,
      barrierColor: Colors.black.withOpacity(.3),
      useSafeArea: true,
      builder: (BuildContext context) => AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        scrollable: false,
        shadowColor: Colors.transparent,
        content: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: GlassBox(
                widget: Stack(
                  children: [
                    Column(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GlassBox(
                            widget: SizedBox(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0,
                                    left: 25,
                                    right: 25,
                                    top: 45),
                                child: Column(
                                  children: [
                                    Text(
                                      text,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black.withOpacity(.6),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            no();
                                          },
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black
                                                    .withOpacity(.4)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                            Colors.blue.withOpacity(.7),
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: TextButton(
                                              onPressed: () {
                                                yes();
                                              },
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                    FontWeight.w800,
                                                    color: Colors.white
                                                        .withOpacity(.8)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            color: Colors.white.withOpacity(.5),
                            borderRadius: 30,
                            x: 15,
                            y: 15,
                            border: true,
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                color: Colors.transparent,
                borderRadius: 0,
                x: 3,
                y: 3, border: false,),
            ),
          ),
        ),
        elevation: 0,
        clipBehavior: Clip.none,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
      ),
    );
