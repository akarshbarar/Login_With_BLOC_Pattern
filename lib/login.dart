import 'package:flutter/material.dart';
import 'package:flutter_app/BLOC/bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    final bloc=Bloc();
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder:(context,snapshot)=> TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "Enter Email",
                    errorText: snapshot.error

                  ),
                  onChanged: bloc.emailChanged,
                ),
              ),
              StreamBuilder<String>(
                stream: bloc.pass,
                builder:(context,snapshot)=> TextField(
                  decoration: InputDecoration(
                    labelText: "Enter PAssword",
                    hintText: "Enter password",
                    errorText: snapshot.error
                  ),
                  obscureText: true,
                  onChanged: bloc.passwordChanged,
                ),
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder:(context,snapshot)=> RaisedButton(
                  onPressed: (){
                    if(!snapshot.hasData){
                      return null;
                    }
                    else{
                      Navigator.of(context).pushNamed("/home");
                      return bloc.submit();
                    }
                    //snapshot.hasData?bloc.submit:null,
                  },
                  child: Text("Login"),
                ),
              ),
              FlatButton(
                child: Text("Create account"),
                onPressed: (){
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ],
          ),

      ),
    );
  }
}
