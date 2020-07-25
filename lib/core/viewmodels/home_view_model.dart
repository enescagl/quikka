import 'package:flutter/material.dart';
import 'package:quikka/core/services/authentication_service.dart';
import 'package:quikka/core/viewmodels/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final AuthenticationService authenticationService;

  HomeViewModel({@required this.authenticationService});

  Future checkIfUserRegistered() async {
    // user credentials logic comes here
  }

  Future getUserInformation() async {
    // user credentials logic comes here
  }

  Future getRandomQuiz() async {
    // getting random quiz logic comes here
  }
  Future getLatestQuiz() async {
    // getting latest quiz logic comes here
  }
}
