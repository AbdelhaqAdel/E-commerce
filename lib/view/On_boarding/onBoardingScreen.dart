import 'package:salla/shared/utils/widgets/navigation.dart';
import 'package:salla/view/auth_view/shop_login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/styles/colors.dart';

class boardingModel
{
  late final String image;
  late final String title;
  late final String body;
 boardingModel({
  required this.image,
  required this.title,
  required this.body,
 });
}


class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool islast=false;
  List <boardingModel>boarding=[
    boardingModel(
      image: ('assets/images/onboard1.jpg'),
      title: 'on board 1 title',
      body: 'on board 1 body'
      ),
    boardingModel(
      image: ('assets/images/onboard2.jpg'),
      title: 'on board 2 title',
      body: 'on board 2 body'
      ),
    boardingModel(
      image: ('assets/images/onboard3.png'),
      title: 'on board 3 title',
      body: 'on board 3 body'
      ),
  ];

  var boardcontroller = PageController();

  //const OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed:(){
            NavigationAndFinish(context,ShopLogin());
    },
           child: Text('Skip')),

        ], 
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if(index == boarding.length-1){
                    setState(() {
                      islast=true;
                    });
                  }
                  else{
                    setState(() {
                      islast=false;
                    });
                  }
                },
                controller: boardcontroller,
                itemBuilder:(context,index)=>buildBoarditem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(controller: boardcontroller,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defultColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4,
                    ),
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(islast){
                    NavigationAndFinish(context,ShopLogin());
                 }
                 else{
                  boardcontroller.nextPage(duration: Duration(
                    milliseconds: 750,
                  ),
                   curve: Curves.fastLinearToSlowEaseIn,
                   );
                }
                },
                child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoarditem(boardingModel model)=> 
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
             child: Image(
                image: AssetImage(model.image),
              ),
           ),
          
          SizedBox(
            height: 20,
          ),
          Text(model.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
             fontSize: 24,
          ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('${model.body}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
             fontSize: 14,
          ),
         ),
          SizedBox(
            height: 20,
          ),
        ],
      );
}