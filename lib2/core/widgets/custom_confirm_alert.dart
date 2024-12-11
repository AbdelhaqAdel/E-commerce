import 'package:flutter/material.dart';
class CustomConfirmAlert extends StatelessWidget {
  const CustomConfirmAlert({super.key,required this.context,
  required this.text,required this.no,
  required this.yes});
  
  final BuildContext context;
  final String text;  
  final Function no;
  final Function yes;

  @override
  Widget build(BuildContext context) {
  return  SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets
                    .only(
                    bottom: 30.0,
                    left: 25,
                    right: 25,
                    top: 45
                ),
                child:Column(
                  children: [

                    Text(text,
                      maxLines: 2,
                      style: TextStyle(

                         fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.black.withOpacity(.6),
                        overflow: TextOverflow.ellipsis
                    ),),
                    const Spacer(),
                    Row(children: [
                      const Spacer(),
                      TextButton(onPressed: (){no();}, child:  Text('No',style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.black.withOpacity(.4)

                      ),),),
                      const SizedBox(width: 15,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(.7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextButton(onPressed: (){yes();}, child:  Text('Yes',style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white.withOpacity(.8)

                          ),),),
                        ),
                      ),
                    ],),
                  ],
                ),
              ),
            );
  }
}

