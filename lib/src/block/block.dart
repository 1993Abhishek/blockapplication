import 'dart:async';

import 'package:blockapplication/src/block/validator.dart';

class Block extends Validators{
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Add data ro stream

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);


//Update data

  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;

  dispose()
  {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc= Block();
