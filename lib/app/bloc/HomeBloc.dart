import 'dart:async';

import 'package:template/app/model/core/TemplateApplication.dart';
import 'package:template/app/bloc/Validators.dart';
import 'package:template/utility/log/Log.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc with Validators{

  final TemplateApplication _application;
 
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get emailChanged => _email.sink.add;
  Function(String) get passwordChanged => _password.sink.add;

  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream => _password.stream.transform(validatePassword);

  Stream<bool> get loginCheck =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) {
          return (e == _email.value && p == _password.value)
              ? true
              : null;
      });

  HomeBloc(this._application) {
    _init();
  }

  CompositeSubscription _compositeSubscription = CompositeSubscription();

  var loadedMap = {};

  void _init() {

  }

  void dispose() {
    _compositeSubscription.clear();
    

  }
}
