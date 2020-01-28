import 'dart:async';

import 'package:template/app/model/core/TemplateApplication.dart';
import 'package:template/utility/log/Log.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc{

  final TemplateApplication _application;

  DashboardBloc(this._application) {
    _init();
  }

  CompositeSubscription _compositeSubscription = CompositeSubscription();

  void _init() {

  }

  void dispose() {
    _compositeSubscription.clear();
    

  }
}

