import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_app/VALIDATOR/validator.dart';

abstract class Dispose{
  void dispose();
}


class Bloc extends Object with Validator  implements Dispose{

  final _emailController=BehaviorSubject<String>();
  final _passwordController=BehaviorSubject<String>();

  Function(String) get emailChanged=>_emailController
      .sink
      .add;
  Function(String) get passwordChanged=>_passwordController
      .sink
      .add;


  submit(){
      print("BUTTON CLICKED");
      print(_emailController.value);
      print(_passwordController.value);
  }

  Stream<String> get email=>_emailController
      .stream
      .transform(
        emailValidator
  );
  Stream<String> get pass=>_passwordController
      .stream
      .transform(
      passwordValidator
  );

  Stream<bool> get submitCheck=>Observable
      .combineLatest2(email, pass, (e,p)=>true);

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.close();
    _passwordController?.close();
  }
}