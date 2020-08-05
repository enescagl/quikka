import 'package:flutter/material.dart';

abstract class AuthenticationService {
  Future loginWithEmail({@required String email, @required String password});

  Future signupWithEmail({@required String email, @required String password});
}
