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

                  return ListTile(
                    title: (quantity[index]==0)?null:Text(list[index].title.toString()),
                    subtitle: (quantity[index]==0)?null:Text(quantity[index].toString()),
                  );
                }
            ),
          ),
          RaisedButton(
            child: Text("Map"),
            onPressed: (){
                Navigator.of(context).pushNamed('/map');
            },

          ),
        ],
      ),
    );
  });

}