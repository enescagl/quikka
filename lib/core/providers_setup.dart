import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:quikka/core/services/authentication_service.dart';
import 'package:quikka/core/services/firestore_service.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: AuthenticationService()),
  Provider.value(value: FirestoreService())
];

List<SingleChildWidget> dependentServices = [
  // ProxyProvider<Api, AuthenticationService>(
  //   update: (context, api, authenticationService) =>
  //       AuthenticationService(api: api),
  // )
];

List<SingleChildWidget> uiConsumableProviders = [
  // StreamProvider<User>(
  //   create: (context) =>
  //       Provider.of<AuthenticationService>(context, listen: false).user,
  // )
];
