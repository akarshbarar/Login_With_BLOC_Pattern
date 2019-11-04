import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';
import 'package:flutter_app/nextPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Model> list;
List<int> quantity;
Query query;
final FirebaseDatabase _database = FirebaseDatabase.instance;
StreamSubscription<Event> _onTodoAddedSubscription;
StreamSubscription<Event> _onTodoChangedSubscription;
//database referene.
  var ref= FirebaseDatabase.instance.reference().child('items');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list=List();
    quantity=List();
    query=_database.reference().child("items");
    _onTodoAddedSubscription = query.onChildAdded.listen(onEntryAdded);
  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }



  onEntryAdded(Event event) {
    setState(() {
      list.add(Model.fromSnapshot(event.snapshot));
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
               onPressed: (){
               },
              icon: Icon(Icons.backspace),
            ),
          ],
        ),
        body: Center(
          child:Column(
            children: <Widget>[
              listWidget(),
              RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(NewPage(list,quantity));
                },
                child: Text("Go"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listWidget(){
    for(int i=0;i<list.length;i++){
      quantity.add(0);
    }
    if(list.length>0){
      return ListView.builder(
        shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context,index){
            String title=list[index].title;
            String body=list[index].body;
            return GestureDetector(
              onTap: (){},
              child: Card(
                elevation: 5.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(title),
                    Text(body),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            setState(() {
                              quantity[index]=quantity[index]+1;
                            });
                          },
                          icon: Icon(Icons.thumb_up,color: Colors.red,),
                        ),
                        Text(quantity[index].toString(),style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),),
                        IconButton(
                          onPressed: (){
                            setState(() {
                              quantity[index]=quantity[index]-1;
                            });
                          },
                          icon: Icon(Icons.thumb_down,color: Colors.green,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
//              child: ListTile(
//                title: Text(title),
//                subtitle: Text(body),
//              ),
            );
          }
      );
    } else {
      return Center(
          child: Text(
            "Welcome. Your list is empty",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          ));
    }
  }
}
