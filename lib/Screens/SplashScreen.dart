import 'package:easyshop/Screens/AuthScreen.dart';
import 'package:easyshop/Utils/AppImages.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:easyshop/Utils/getOfContext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

///Splash Screen Widget
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = getMediaQuerySize(context);
    double mainAxisHeight = getMainAxisHeight(context);
    final theme = getThemeData(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                theme.primaryColor,
                theme.primaryColor.withOpacity(0.9),
                theme.primaryColor.withOpacity(0.7),
                theme.primaryColor.withOpacity(0.5),
              ])),
          height: mainAxisHeight,
          width: screenSize.width,
          child: Stack(
            children: [
              Center(
                child: Lottie.asset(AppImages.splashLottie,
                    onLoaded: (composition) {
                  //When animation completes it will send to next screen
                  Future.delayed(
                      Duration(
                          milliseconds: composition.duration.inMilliseconds),
                      () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => AuthScreen()));
                  });
                }),
              ),
              Positioned(
                  bottom: screenSize.height * 0.2,
                  left: screenSize.width * 0.25,
                  right: screenSize.width * 0.25,
                  height: 50,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Easy Shop',
                      style: GoogleFonts.ruslanDisplay(
                          textStyle: theme.textTheme.headline1),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          )),
    );
  }
}
