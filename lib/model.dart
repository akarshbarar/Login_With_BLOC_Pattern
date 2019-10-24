import 'package:firebase_database/firebase_database.dart';

class Model{
  String title;
  String body;

  Model(this.title, this.body);
  Model.fromSnapshot(DataSnapshot snapshot):
      title=snapshot.value["title"],
      body=snapshot.value["body"];
  toJson(){
    return {
      "title":title,
      "body":body
    };
  }

}