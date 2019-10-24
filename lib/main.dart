import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/register.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Just a Slider Intro test",
      home: SliderIntro(),
      routes: {
        '/login':(context)=>LoginPage(),
        '/register':(context)=>RegisterPage(),
        '/home':(context)=>HomePage(),
      },
    );
  }
}

class SliderIntro extends StatefulWidget {
  @override
  _SliderIntroState createState() => _SliderIntroState();
}

class _SliderIntroState extends State<SliderIntro> {
  List<Slide> slides=List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(
      Slide(
          title: "First Slide",
          styleTitle: TextStyle(
              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
          ),
          description: "First Slide Txt DEscription",
          styleDescription:  TextStyle(
              color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal
          ),
          marginDescription: EdgeInsets.all(5.0),
          colorEnd:Colors.blue,
          colorBegin: Colors.red,
          backgroundImage: "images/aaa.png",
          directionColorEnd: Alignment.bottomRight,
          directionColorBegin: Alignment.topLeft,
          onCenterItemPress: (){}
      ),
    );
    slides.add(
      Slide(
          title: "Second Slide",
          styleTitle: TextStyle(
              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
          ),
          description: "Second Slide Txt DEscription",
          styleDescription:  TextStyle(
              color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal
          ),
          marginDescription: EdgeInsets.all(5.0),
          colorEnd:Colors.yellow,
          colorBegin: Colors.blue,
          backgroundImage: "images/bbb.jpg",
          directionColorEnd: Alignment.bottomRight,
          directionColorBegin: Alignment.topLeft,
          onCenterItemPress: (){}
      ),
    );
    slides.add(
      Slide(
          title: "Third Slide",
          styleTitle: TextStyle(
              color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
          ),
          description: "Third Slide Txt DEscription",
          styleDescription:  TextStyle(
              color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal
          ),
          marginDescription: EdgeInsets.all(5.0),
          colorEnd:Colors.green,
          colorBegin: Colors.indigo,
          backgroundImage: "images/ccc.png",
          directionColorEnd: Alignment.bottomRight,
          directionColorBegin: Alignment.topLeft,
          onCenterItemPress: (){}
      ),
    );

  }

  void onDonePress(){
    //Do Whatever you like
    //Move to next slide or actiity
    Navigator.of(context).pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      renderSkipBtn: Icon(
        Icons.skip_next,
        color: Color(0xffD02090),
      ), //Widget
      colorSkipBtn: Colors.white,
      highlightColorSkipBtn: Colors.blueGrey,

      renderNextBtn: Icon(
        Icons.navigate_next,
        color: Color(0xffD02090),
      ),//Widget

      renderDoneBtn: Icon(
        Icons.done,
        color: Color(0xffD02090),
      ),//Widget
      onDonePress: onDonePress,//Button
      colorDoneBtn: Colors.green,
      highlightColorDoneBtn: Colors.lightGreen,

      colorDot: Colors.pink,
      colorActiveDot: Colors.red,
      sizeDot: 15.0,

      shouldHideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
    );
  }
}


//Just a Check



//import 'dart:async';
//
//import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_app/map.dart';
//import 'package:flutter_app/model.dart';
//import 'package:flutter_app/nextPage.dart';
//
//void main()=>runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//       title: "ListView Test",
//      home: Index(),
//      routes: {
//         '/map':(context)=>MapPage()
//      },
//      debugShowCheckedModeBanner: false,
//    );
//  }
//}
//class Index extends StatefulWidget {
//  @override
//  _IndexState createState() => _IndexState();
//}
//
//class _IndexState extends State<Index> {
//  List<Model> list;
//  List<int> quantity;
//  Query query;
//  final FirebaseDatabase _database = FirebaseDatabase.instance;
//  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//  final titleController = TextEditingController();
//  final bodyController = TextEditingController();
//
//  StreamSubscription<Event> _onTodoAddedSubscription;
//  StreamSubscription<Event> _onTodoChangedSubscription;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    list=new List();
//    quantity=new List();
//
//    query=_database.reference().child("items");
//    _onTodoAddedSubscription = query.onChildAdded.listen(onEntryAdded);
//  }
//
//  @override
//  void dispose() {
//    _onTodoAddedSubscription.cancel();
//    _onTodoChangedSubscription.cancel();
//    super.dispose();
//  }
//  onEntryAdded(Event event){
//    setState(() {
//      list.add(
//        Model.fromSnapshot(event.snapshot)
//      );
//      print("DATA FROM LIST");
//
//      print(list.length);
//
//    });
//  }
//  Widget showList(){
//
//    if(list.length>0){
//      return ListView.builder(
//          shrinkWrap: true,
//          itemCount: list.length,
//          itemBuilder: (context,index){
//            String title=list[index].title;
//            String body=list[index].body;
//            print(title);
//            print(body);
//
//            return Center(
//              child: Card(
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: 200.0,
//                    child:  Image.network(
//                        "https://images.pexels.com/photos/1724357/pexels-photo-1724357.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
//                      fit: BoxFit.fill,
//                    )
//                  ),
//                   ListTile(
//                      leading: Icon(Icons.album),
//                      title: Text(title),
//                      subtitle: Text(body),
//                    ),
//                  Row(
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(Icons.arrow_drop_up,size: 30.0,),
//                           onPressed: (){
//                             setState(() {
//                               quantity[index]=quantity[index]+1;
//                             });
//                           },
//                         ),
//                         Text(quantity[index].toString()),
//                         IconButton(
//                           icon: Icon(Icons.arrow_drop_down,size: 30.0,),
//                           onPressed: (){
//                             setState(() {
//                               quantity[index]=quantity[index]-1;
//
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//
//
//                  ],
//                ),
//              ),
//            );
//          }
//      );
//    }
//    else{
//      return Center(
//          child: Text(
//            "Welcome. Your list is empty",
//            textAlign: TextAlign.center,
//            style: TextStyle(fontSize: 30.0),
//          ));
//    }
//  }
//
//  showAddTodoDialog(BuildContext context) async {
//    titleController.clear();
//    await showDialog<String>(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            content: new Row(
//              children: <Widget>[
//                new Expanded(
//                    child: new TextField(
//                      controller: titleController,
//                      autofocus: true,
//                      decoration: new InputDecoration(
//                        labelText: 'Add new title',
//                      ),
//                    )
//                ),
//                new Expanded(
//                    child: new TextField(
//                      controller: bodyController,
//                      autofocus: true,
//                      decoration: new InputDecoration(
//                        labelText: 'Add new body',
//                      ),
//                    )
//                ),
//              ],
//            ),
//            actions: <Widget>[
//              new FlatButton(
//                  child: const Text('Cancel'),
//                  onPressed: () {
//                    Navigator.pop(context);
//                  }),
//              new FlatButton(
//                  child: const Text('Save'),
//                  onPressed: () {
//                    addNewTodo(titleController.text.toString(),bodyController.text.toString());
//                    Navigator.pop(context);
//                  })
//            ],
//          );
//        });
//  }
//
//  addNewTodo(String title,String body) {
//
//       Model obj=new Model(title,body);
//      _database.reference().child("items").push().set(obj.toJson());
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    for(int i=0;i<list.length;i++){
//      quantity.add(0);
//    }
//    print("Quantity"+quantity.length.toString());
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Listiew Tap Test"),
//      ),
//      body: Column(
//        children: <Widget>[
//          Container(
//            width: MediaQuery.of(context).size.width,
//            height: 500.0,
//            child:showList(),
//          ),
//          RaisedButton(
//            child: Text("Move To Cart"),
//            onPressed: (){
//                Navigator.of(context).push(NewPage(list, quantity));
//            },
//          ),
//        ],
//      ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            showAddTodoDialog(context);
//          },
//          tooltip: 'Increment',
//          child: Icon(Icons.add),
//        ));
//
//  }
//}
