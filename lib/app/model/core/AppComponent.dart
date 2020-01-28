import 'package:flutter/material.dart';
import 'package:template/app/model/core/AppProvider.dart';
import 'package:template/app/model/core/TemplateApplication.dart';
import 'package:template/config/Env.dart';
import 'package:template/utility/log/Log.dart';

class AppComponent extends StatefulWidget {

  final TemplateApplication _application;

  AppComponent(this._application);

  @override
  State createState() {
    return new AppComponentState(_application);
  }
}

class AppComponentState extends State<AppComponent> {

  final NusaaiduApplication _application;

  AppComponentState(this._application);

  @override
  void dispose()async{
    Log.info('dispose');
    super.dispose();
    await _application.onTerminate();
  }

  @override
  Widget build(BuildContext context) {

    final app = new MaterialApp(
      title: Env.value.appName,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _application.router.generator,
    );
    print('initial core.route = ${app.initialRoute}');

    final appProvider = AppProvider(child: app, application: _application);
    return appProvider;
  }
}
