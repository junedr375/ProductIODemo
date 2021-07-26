import 'dart:async';

import 'package:easyshop/Screens/Home.dart';
import 'package:easyshop/Utils/AppImages.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:easyshop/Utils/getOfContext.dart';
import 'package:easyshop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String? phoneNumber;
  const OTPScreen({Key? key, @required this.phoneNumber}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int resendSeconds = 15;

  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  ///to Reset Timer
  void resetTimer() {
    resendSeconds = 15;
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (resendSeconds >= 1) if (mounted)
        setState(() {
          resendSeconds--;
        });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = getMediaQuerySize(context);
    double mainAxisHeight = getMainAxisHeight(context);
    final theme = getThemeData(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: mainAxisHeight,
        width: screenSize.width,
        child: Stack(
          children: [
            Container(
              height: mainAxisHeight * 0.45,
              color: theme.primaryColor.withOpacity(0.8),
              child: Column(
                children: [
                  Container(
                    height: mainAxisHeight * 0.30,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: screenSize.width,
                    alignment: Alignment.center,
                    child: Lottie.asset(AppImages.otpIconLottie, repeat: true),
                  ),
                ],
              ),
            ),
            Positioned(
              top: mainAxisHeight * 0.35,
              left: 0,
              child: Container(
                height: mainAxisHeight * 0.75,
                width: screenSize.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(80))),
                child: ListView(
                  children: [
                    SizedBox(
                      height: mainAxisHeight * 0.1,
                    ),
                    Container(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Enter OTP received on: ',
                              style: theme.textTheme.headline3),
                          TextSpan(
                              text: widget.phoneNumber,
                              style: theme.textTheme.headline2)
                        ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: PinCodeTextField(
                        controller: pinController,
                        appContext: context,
                        animationType: AnimationType.fade,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          inactiveColor: theme.primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        length: 6,
                        onCompleted: (val) {
                          setState(() {
                            pinController.text = val;
                          });
                          print(pinController.text);
                        },
                        onChanged: (val) {},
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Didn't recieve an OTP resend in: ",
                              style: theme.textTheme.headline5),
                          TextSpan(
                              text: '$resendSeconds s ',
                              style: theme.textTheme.headline3)
                        ]),
                      ),
                    ),
                    Visibility(
                      visible: resendSeconds == 0,
                      child: InkWell(
                          onTap: resetTimer,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        if (isOtpEntered()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isOtpEntered()
                                ? theme.primaryColor.withOpacity(0.8)
                                : theme.primaryColor.withOpacity(0.4)),
                        child: Text(
                          'Submit',
                          style: isOtpEntered()
                              ? theme.textTheme.headline2
                              : TextStyle(
                                  color: Colors.grey[600], fontSize: 24),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  bool isOtpEntered() {
    return pinController.text.length == 6;
  }
}
