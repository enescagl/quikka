import 'package:flutter/material.dart';
import 'package:quikka/core/services/authentication_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class StatsViewModel extends BaseViewModel {
  final AuthenticationService authenticationService;

  StatsViewModel({@required this.authenticationService});

  Future checkIfUserRegistered() async {
    // user credentials logic comes here
  }

  Future getUserStats() async {
    // getting user stats logic comes here
  }
}
