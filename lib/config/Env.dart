
import 'package:flutter/material.dart';
import 'package:template/app/model/core/AppComponent.dart';
import 'package:template/app/model/core/NusaaiduApplication.dart';

enum EnvType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
  TESTING
}

class Env {

  static Env value;

  String appName;
  String baseUrl;
  //Color primarySwatch;
  EnvType environmentType = EnvType.DEVELOPMENT;

  // Database Config
  //int dbVersion = 1;
  //String dbName;


  Env() {
    value = this;
    _init();
  }

  void _init() async{
    var application = NusaaiduApplication();
    await application.onCreate();
    runApp(AppComponent(application));
  }
}
