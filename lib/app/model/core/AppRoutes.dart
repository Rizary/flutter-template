import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:template/app/ui/page/HomePage.dart';
import 'package:template/app/ui/page/RegisterPage.dart';
import 'package:template/app/ui/page/DashboardPage.dart';

var rootHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  });

var registerRouteHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return RegisterPage();
  });

var dashboardRouteHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return DashboardPage();
  });

class AppRoutes {

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('ROUTE WAS NOT FOUND !!!');
        });
    router.define(HomePage.PATH, handler: rootHandler);
    router.define(RegisterPage.PATH, handler: registerRouteHandler);
    router.define(DashboardPage.PATH, handler: dashboardRouteHandler);
  }
}
