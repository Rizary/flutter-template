import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:template/app/model/core/NusaaiduApplication.dart';


class AppProvider extends InheritedWidget {

  final TemplateApplication application;

  AppProvider({Key key, Widget child, this.application})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>());
  }

  static Router getRouter(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>()).application.router;
  }

  static NusaaiduApplication getApplication(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>()).application;
  }

}
