import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:template/app/bloc/DashboardBloc.dart';
import 'package:template/app/model/core/AppProvider.dart';

class DashboardPage extends StatefulWidget {
  static const String PATH = '/dashboard';

  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

    DashboardBloc bloc;
    //TapGestureRecognizer _tapRecognizer;
    Color greyColor = Color.fromARGB(255, 163, 163, 163);

    @override
    void dispose() {
      super.dispose();
      bloc.dispose();
      //_tapRecognizer.dispose();
    }

    @override
    Widget build(BuildContext context) {
      _init();
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              title: Text('Template - Dashboard')
          ),
          body: SingleChildScrollView (child: Padding (
            padding: const EdgeInsets.all(16.0),        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RichText( 
                  text: TextSpan (
                    children: [
                      TextSpan (
                        text: "Welcome!!!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          )
      );
    }

    void _init(){
      if(null == bloc){
        bloc = DashboardBloc(AppProvider.getApplication(context));
        //bloc.loadFeedList();
      }
    }
}
