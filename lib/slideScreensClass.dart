import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'webViewClass.dart';

bool seen = false;

class SlideScreens extends StatefulWidget {
  const SlideScreens({Key? key}) : super(key: key);

  @override
  _SlideScreensState createState() => new _SlideScreensState();
}

class _SlideScreensState extends State<SlideScreens> {
  List<Slide> slides = [];
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        centerWidget: Column(
          children: [
            SizedBox(
              width: 100,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: 300, child: Image.asset('images/1.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              "Choisissez",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Votre destination et votre véhicule.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono'),
            )
          ],
        ),
        backgroundColor: Colors.white,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        centerWidget: Column(
          children: [
            SizedBox(
              width: 100,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: 300, child: Image.asset('images/2.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              "Réservez",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "en ligne (Paiement en Cash).",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono'),
            )
          ],
        ),
        backgroundColor: Colors.white,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        centerWidget: Column(
          children: [
            SizedBox(
              width: 100,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: 300, child: Image.asset('images/3.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              "Confirmation",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Par mail de votre course.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono'),
            )
          ],
        ),
        backgroundColor: Colors.white,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        centerWidget: Column(
          children: [
            SizedBox(
              width: 100,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: 300, child: Image.asset('images/4.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              "Profitez",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "de votre trajet avec El Mouhajir.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'RobotoMono'),
            )
          ],
        ),
        backgroundColor: Colors.white,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
      (Route<dynamic> route) => false,
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xffd7b65d)),
      overlayColor: MaterialStateProperty.all<Color>(Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),
      showSkipBtn: false,

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),
      showNextBtn: false,

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Colors.black38,
      colorActiveDot: Color(0xffd7b65d),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.white,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
