import 'package:flutter/material.dart';
import 'package:flutter_app/BLOC/bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  @override
  Widget build(BuildContext context) {
    final bloc=Bloc();

    TextEditingController password=TextEditingController();
    TextEditingController confirmPassword=TextEditingController();


    return SafeArea(
        child: Scaffold(
          body: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<String>(
                    stream: bloc.email,
                    builder:(context,snapshot)=>TextField(
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
                      controller: password,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        hintText: "Enter password",
                          errorText: snapshot.error
                      ),
                      obscureText: true,
                      onChanged: bloc.passwordChanged,
                    ),
                  ),
                  TextField(
                    controller: confirmPassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
                    ),

                  ),
                  StreamBuilder<bool>(
                    stream: bloc.submitCheck,
                    builder:(context,snapshot)=> RaisedButton(
                      onPressed: (){
                          if(password.text.toString().compareTo(confirmPassword.text.toString())==0){
                            snapshot.hasData?bloc.submit:null;
                          }
                      },
                      child: Text("Register"),
                    ),
                  ),
                  FlatButton(
                    child: Text("Already have account Sign in"),
                    onPressed: (){
                      Navigator.of(context).pushNamed('/login');
                    },
                  )
                ],
              ),
          ),
        )
    );
  }
}
