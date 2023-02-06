import 'package:bdlha/Persntation/welcome_badge/Widget/WelcomeBadgeImage.dart';
import 'package:bdlha/style/ColorManger/ColorManger.dart';
import 'package:bdlha/style/button/button.dart';
import 'package:bdlha/style/size/Container.dart';
import 'package:bdlha/style/size/PaddingApp.dart';
import 'package:bdlha/style/text/StaticText.dart';
import 'package:flutter/material.dart';
class WelcomeBadge extends StatelessWidget {
  const WelcomeBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
          children: [
            backGround(MediaQuery.of(context).size.height),
            Container(
              color: ColorManager.textcolor.withOpacity(0.6),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top:PaddingApp.welcomeText*MediaQuery.of(context).size.height,
                        bottom:PaddingApp.welcomeText*MediaQuery.of(context).size.height
                    ),
                    child: Text(StaticText.welcomeText,style: TextStyle(
                      color:ColorManager.secondColor.withOpacity(.3),
                      fontSize: 30
                    )),
                  ),
                  SizedBox(
                    width:Width.bigButton*MediaQuery.of(context).size.width ,
                    child: ListView.builder(
                        itemCount: welcomeButton.length,
                        shrinkWrap: true,
                        itemBuilder: (c,i){
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, route[i]);
                        },
                        child: authButton(
                          MediaQuery.of(context).size.height,
                            MediaQuery.of(context).size.width,
                            welcomeButton[i],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
      ),
    );
  }
}
List <String> welcomeButton=[
  StaticText.signIn,
  StaticText.signUp,
];
List <String> route=[
  '/Login',
  '/SignUp',
];
