import 'dart:async';

import 'package:template/app/model/core/TemplateApplication.dart';
import 'package:template/app/bloc/Validators.dart';
import 'package:template/utility/log/Log.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators{

  final TemplateApplication _application;
 
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get nameChanged => _name.sink.add;
  Function(String) get emailChanged => _email.sink.add;
  Function(String) get passwordChanged => _password.sink.add;


  Stream<String> get nameStream => _name.stream.transform(validateName);
  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream <String> get passwordStream => _password.stream.transform(validatePassword);

  Stream<bool> get registerCheck =>
      Observable.combineLatest3(nameStream, emailStream, passwordStream, (n, e, p) {
          return (n == _name.value && e == _email.value && p == _password.value)
              ? true
              : null;
      });

  RegisterBloc(this._application) {
    _init();
  }

  CompositeSubscription _compositeSubscription = CompositeSubscription();

  var loadedMap = {};

  void _init() {

  }

  void dispose() {
    _compositeSubscription.clear();
    _name.close();
    _email.close();
    _password.close();

  }
}
