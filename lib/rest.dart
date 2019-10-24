//import 'package:flutter/material.dart';
//import 'package:flutter_app/home.dart';
//import 'package:flutter_app/login.dart';
//import 'package:flutter_app/register.dart';
//import 'package:intro_slider/intro_slider.dart';
//import 'package:intro_slider/slide_object.dart';
//
//void main()=>runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData.dark(),
//      title: "Just a Slider Intro test",
//      home: SliderIntro(),
//      routes: {
//        '/login':(context)=>LoginPage(),
//        '/register':(context)=>RegisterPage(),
//        '/home':(context)=>HomePage(),
//      },
//    );
//  }
//}
//
//class SliderIntro extends StatefulWidget {
//  @override
//  _SliderIntroState createState() => _SliderIntroState();
//}
//
//class _SliderIntroState extends State<SliderIntro> {
//  List<Slide> slides=List();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    slides.add(
//      Slide(
//          title: "First Slide",
//          styleTitle: TextStyle(
//              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
//          ),
//          description: "First Slide Txt DEscription",
//          styleDescription:  TextStyle(
//              color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal
//          ),
//          marginDescription: EdgeInsets.all(5.0),
//          colorEnd:Colors.blue,
//          colorBegin: Colors.red,
//          backgroundImage: "images/aaa.png",
//          directionColorEnd: Alignment.bottomRight,
//          directionColorBegin: Alignment.topLeft,
//          onCenterItemPress: (){}
//      ),
//    );
//    slides.add(
//      Slide(
//          title: "Second Slide",
//          styleTitle: TextStyle(
//              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
//          ),
//          description: "Second Slide Txt DEscription",
//          styleDescription:  TextStyle(
//              color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal
//          ),
//          marginDescription: EdgeInsets.all(5.0),
//          colorEnd:Colors.yellow,
//          colorBegin: Colors.blue,
//          backgroundImage: "images/bbb.jpg",
//          directionColorEnd: Alignment.bottomRight,
//          directionColorBegin: Alignment.topLeft,
//          onCenterItemPress: (){}
//      ),
//    );
//    slides.add(
//      Slide(
//          title: "Third Slide",
//          styleTitle: TextStyle(
//              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
//          ),
//          description: "Third Slide Txt DEscription",
//          styleDescription:  TextStyle(
//              color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal
//          ),
//          marginDescription: EdgeInsets.all(5.0),
//          colorEnd:Colors.green,
//          colorBegin: Colors.indigo,
//          backgroundImage: "images/ccc.png",
//          directionColorEnd: Alignment.bottomRight,
//          directionColorBegin: Alignment.topLeft,
//          onCenterItemPress: (){}
//      ),
//    );
//
//  }
//
//  void onDonePress(){
//    //Do Whatever you like
//    //Move to next slide or actiity
//    Navigator.of(context).pushNamed('/login');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return IntroSlider(
//      slides: slides,
//      renderSkipBtn: Icon(
//        Icons.skip_next,
//        color: Color(0xffD02090),
//      ), //Widget
//      colorSkipBtn: Colors.white,
//      highlightColorSkipBtn: Colors.blueGrey,
//
//      renderNextBtn: Icon(
//        Icons.navigate_next,
//        color: Color(0xffD02090),
//      ),//Widget
//
//      renderDoneBtn: Icon(
//        Icons.done,
//        color: Color(0xffD02090),
//      ),//Widget
//      onDonePress: onDonePress,//Button
//      colorDoneBtn: Colors.green,
//      highlightColorDoneBtn: Colors.lightGreen,
//
//      colorDot: Colors.pink,
//      colorActiveDot: Colors.red,
//      sizeDot: 15.0,
//
//      shouldHideStatusBar: true,
//      backgroundColorAllSlides: Colors.grey,
//    );
//  }
//}
