import 'dart:async';

mixin Validator{
  var emailValidator=StreamTransformer<String,String>
      .fromHandlers(
    handleData: (email,sink){
      RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        caseSensitive: true,
        multiLine: false,
      );
      if(regExp.hasMatch(email)){
        sink.add(email);
      }
      else{
        sink.addError("Invalid Email");
      }
    }
  );
  var passwordValidator=StreamTransformer<String,String>
      .fromHandlers(
      handleData: (password,sink){
        if(password.length>=5){
          sink.add(password);
        }
        else{
          sink.addError("Password should be greater than 4");
        }
      }
  );

}