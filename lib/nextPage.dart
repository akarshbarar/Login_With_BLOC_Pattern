import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/map.dart';
import 'package:flutter_app/model.dart';

class NewPage extends MaterialPageRoute<Null>{
  List<Model> list;
  List<int> quantity;
  NewPage(this.list,this.quantity)
      :super(builder:(BuildContext context){
    return Scaffold(
      appBar: new AppBar(title: new Text("New Page"),),
      body:Column(
        children: <Widget>[
          Container(
            height: 400.0,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context,index){
                  print(list);

                  return ListTile(
                    title: (quantity[index]==0)?null:Text(list[index].title.toString()+""+list[index].body.toString()),
                    subtitle: (quantity[index]==0)?null:Text(quantity[index].toString()),
                  );
                }
            ),
          ),
          RaisedButton(
            child: Text("upload"),
            onPressed: (){
              FirebaseDatabase _database = FirebaseDatabase.instance;
              List<String> titleNew=List();
              List<String> bodyNew=List();
              List<int> quantityNew=List();
              for(int i=0;i<list.length;i++){
                print(list[i].title);
                print(list[i].body);
                print(quantity[i]);
                titleNew.add(list[i].title);
                bodyNew.add(list[i].body);
                quantityNew.add(quantity[i]);
              }
              _database.reference().child("list").push().set({
                   "title":titleNew,
                   "body":bodyNew,
                   "quantity":quantityNew
              });
            },

          ),
        ],
      ),
    );
  });

}