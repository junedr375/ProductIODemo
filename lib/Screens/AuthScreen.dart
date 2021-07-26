import 'package:easyshop/Screens/OTPScreen.dart';
import 'package:easyshop/Utils/AppImages.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:easyshop/Utils/getOfContext.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

///Login Signup Screen With Bottom Drawer
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController phonNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = getMediaQuerySize(context);
    double mainAxisHeight = getMainAxisHeight(context);

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: mainAxisHeight,
        width: screenSize.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              topLottiesAnimationWidget(),
              bottomLoginButtonWidget(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget topLottiesAnimationWidget() {
    double mainAxisHeight = getMainAxisHeight(context);
    return Container(
      height: mainAxisHeight * 0.65,
      child:
          Lottie.asset(AppImages.loginLottie, repeat: true, fit: BoxFit.fill),
    );
  }

  Widget bottomLoginButtonWidget() {
    double mainAxisHeight = getMainAxisHeight(context);
    final theme = getThemeData(context);
    return Container(
      height: mainAxisHeight * 0.25,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          authButtonTile('Login', Colors.green, () {
            showBottomBar();
          }),
          Container(
            height: 20,
            child: Text(
              'or',
              style: theme.textTheme.headline4,
            ),
          ),
          authButtonTile('Signup', Colors.indigoAccent.withOpacity(0.7), () {
            showBottomBar();
          }),
        ],
      ),
    );
  }

  Widget authButtonTile(String name, Color color, Function() onTap) {
    Size screenSize = getMediaQuerySize(context);
    final theme = getThemeData(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenSize.width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Text(
          name,
          style: theme.textTheme.headline3,
        ),
      ),
    );
  }

  ///Bottom Drawer to show Login TextField
  showBottomBar() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          Size screenSize = getMediaQuerySize(context);
          final theme = getThemeData(context);
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter boxSetState) =>
                  Container(
                    height: 250,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      color: theme.backgroundColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            'Enter your Mobile number to receive OTP.',
                            style: theme.textTheme.headline4,
                          ),
                        ),
                        IntlPhoneField(
                          style: theme.textTheme.headline2,
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              fillColor: theme.primaryColor,
                              hintStyle: theme.textTheme.bodyText1),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            phonNumberController.text = phone.completeNumber;
                            //    print(phonNumberController.text);
                            boxSetState(() {});
                          },
                        ),
                        Visibility(
                          visible: phonNumberController.text.length >= 13,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPScreen(
                                              phoneNumber:
                                                  phonNumberController.text,
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: theme.primaryColor.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'Send OTP',
                                  style: theme.textTheme.headline3,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ));
        });
  }
}
