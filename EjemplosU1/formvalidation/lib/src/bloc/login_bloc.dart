import 'dart:async';

class LoginBloc {

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();


  //Recuperarlos datos del string
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;


  //Insertar valores strin
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController.close();
    _passwordController.close();
  }


}
